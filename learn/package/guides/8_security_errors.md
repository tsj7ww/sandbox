# Python Package Security and Error Handling: Comprehensive Guide

## Security Framework

### 1. Exception Hierarchy
```python
# exceptions.py
from typing import Optional, Any

class PackageError(Exception):
    """Base exception for all package errors."""
    
    def __init__(self, message: str, code: Optional[str] = None):
        super().__init__(message)
        self.code = code or 'UNKNOWN_ERROR'
        self.message = message

class ValidationError(PackageError):
    """Raised when input validation fails."""
    
    def __init__(self, message: str, invalid_value: Any = None):
        super().__init__(message, code='VALIDATION_ERROR')
        self.invalid_value = invalid_value

class SecurityError(PackageError):
    """Base class for security-related errors."""
    
    def __init__(self, message: str, severity: str = 'HIGH'):
        super().__init__(message, code='SECURITY_ERROR')
        self.severity = severity

class AuthenticationError(SecurityError):
    """Raised when authentication fails."""
    
    def __init__(self, message: str):
        super().__init__(message, severity='CRITICAL')

class AuthorizationError(SecurityError):
    """Raised when authorization fails."""
    
    def __init__(self, message: str, required_permissions: Optional[list] = None):
        super().__init__(message, severity='HIGH')
        self.required_permissions = required_permissions or []

class ConfigurationError(PackageError):
    """Raised when configuration is invalid."""
    
    def __init__(self, message: str, config_key: Optional[str] = None):
        super().__init__(message, code='CONFIG_ERROR')
        self.config_key = config_key
```

### 2. Input Validation

#### Validation Framework
```python
# security/validation.py
from typing import Any, Callable, TypeVar, Generic, List, Dict
from dataclasses import dataclass
from abc import ABC, abstractmethod

T = TypeVar('T')

class Validator(Generic[T], ABC):
    """Base class for validators."""
    
    @abstractmethod
    def validate(self, value: Any) -> T:
        """Validate and potentially transform input."""
        pass

@dataclass
class ValidationResult:
    """Result of validation operation."""
    is_valid: bool
    errors: List[str]
    transformed_value: Any = None

class InputValidator:
    """Comprehensive input validation system."""
    
    def __init__(self):
        self.validators: Dict[str, Validator] = {}
    
    def register_validator(self, name: str, validator: Validator) -> None:
        """Register a new validator."""
        self.validators[name] = validator
    
    def validate(self, name: str, value: Any) -> ValidationResult:
        """Validate input using registered validator."""
        if name not in self.validators:
            return ValidationResult(
                is_valid=False,
                errors=[f"No validator registered for '{name}'"]
            )
        
        try:
            transformed = self.validators[name].validate(value)
            return ValidationResult(
                is_valid=True,
                errors=[],
                transformed_value=transformed
            )
        except ValidationError as e:
            return ValidationResult(
                is_valid=False,
                errors=[str(e)]
            )
```

### 3. Security Auditing

#### Audit Logger
```python
# security/audit.py
import logging
import json
from typing import Dict, Any, Optional
from datetime import datetime
import threading

class AuditLogger:
    """Security audit logging system."""
    
    def __init__(self, log_file: str):
        self.logger = logging.getLogger('security_audit')
        handler = logging.FileHandler(log_file)
        handler.setFormatter(
            logging.Formatter('%(asctime)s - %(message)s')
        )
        self.logger.addHandler(handler)
        self.logger.setLevel(logging.INFO)
        self._thread_local = threading.local()
    
    def set_context(self, **kwargs: Any) -> None:
        """Set context for current thread."""
        if not hasattr(self._thread_local, 'context'):
            self._thread_local.context = {}
        self._thread_local.context.update(kwargs)
    
    def clear_context(self) -> None:
        """Clear context for current thread."""
        if hasattr(self._thread_local, 'context'):
            del self._thread_local.context
    
    def log_security_event(self, 
                          event_type: str,
                          details: Dict[str, Any],
                          severity: str = 'INFO') -> None:
        """Log a security event."""
        context = getattr(self._thread_local, 'context', {})
        event = {
            'timestamp': datetime.utcnow().isoformat(),
            'event_type': event_type,
            'severity': severity,
            'details': details,
            'context': context
        }
        self.logger.info(json.dumps(event))
```

## Error Handling Patterns

### 1. Context Managers

#### Error Context
```python
# error_handling/context.py
from typing import Optional, Type, TypeVar
from types import TracebackType
import sys
from contextlib import contextmanager

T = TypeVar('T', bound=Exception)

class ErrorContext:
    """Context manager for handling errors."""
    
    def __init__(self, 
                 error_types: tuple[Type[Exception], ...],
                 handler: Optional[Callable[[Exception], None]] = None,
                 reraise: bool = True):
        self.error_types = error_types
        self.handler = handler
        self.reraise = reraise
        self.error: Optional[Exception] = None
    
    def __enter__(self) -> 'ErrorContext':
        return self
    
    def __exit__(self,
                 exc_type: Optional[Type[BaseException]],
                 exc_val: Optional[BaseException],
                 exc_tb: Optional[TracebackType]) -> bool:
        if exc_val is not None and isinstance(exc_val, self.error_types):
            self.error = exc_val
            if self.handler:
                self.handler(exc_val)
            return not self.reraise
        return False

@contextmanager
def handling_errors(*error_types: Type[Exception],
                   handler: Optional[Callable[[Exception], None]] = None,
                   reraise: bool = True):
    """Convenient context manager for error handling."""
    try:
        yield
    except error_types as e:
        if handler:
            handler(e)
        if reraise:
            raise
```

### 2. Error Recovery

#### Recovery Strategies
```python
# error_handling/recovery.py
from typing import TypeVar, Generic, Callable, Optional, Any
from dataclasses import dataclass
import time

T = TypeVar('T')

@dataclass
class RetryConfig:
    """Configuration for retry behavior."""
    max_attempts: int = 3
    delay: float = 1.0
    backoff_factor: float = 2.0
    exceptions: tuple[Type[Exception], ...] = (Exception,)

class RetryStrategy(Generic[T]):
    """Implements retry behavior for operations."""
    
    def __init__(self, config: RetryConfig):
        self.config = config
    
    def execute(self, 
                operation: Callable[..., T],
                *args: Any,
                **kwargs: Any) -> T:
        """Execute operation with retry behavior."""
        last_exception: Optional[Exception] = None
        delay = self.config.delay
        
        for attempt in range(self.config.max_attempts):
            try:
                return operation(*args, **kwargs)
            except self.config.exceptions as e:
                last_exception = e
                if attempt < self.config.max_attempts - 1:
                    time.sleep(delay)
                    delay *= self.config.backoff_factor
                    continue
        
        assert last_exception is not None
        raise last_exception
```

## Security Best Practices

### 1. Authentication and Authorization

#### Security Decorator
```python
# security/decorators.py
from typing import Callable, Any, TypeVar
from functools import wraps

F = TypeVar('F', bound=Callable[..., Any])

def require_auth(permission: str) -> Callable[[F], F]:
    """Decorator to enforce authentication and authorization."""
    
    def decorator(func: F) -> F:
        @wraps(func)
        def wrapper(*args: Any, **kwargs: Any) -> Any:
            # Get current user context
            user = get_current_user()
            
            # Check authentication
            if not user:
                raise AuthenticationError("User not authenticated")
            
            # Check authorization
            if not user.has_permission(permission):
                raise AuthorizationError(
                    "Permission denied",
                    required_permissions=[permission]
                )
            
            return func(*args, **kwargs)
        return wrapper  # type: ignore
    return decorator
```

### 2. Secure Configuration

#### Configuration Manager
```python
# security/config.py
from typing import Any, Dict, Optional
import os
import json
from pathlib import Path

class SecureConfig:
    """Secure configuration management."""
    
    def __init__(self, config_path: str):
        self._config: Dict[str, Any] = {}
        self._secret_keys: set[str] = set()
        self._load_config(config_path)
    
    def _load_config(self, config_path: str) -> None:
        """Load configuration securely."""
        path = Path(config_path)
        if not path.exists():
            raise ConfigurationError(f"Config file not found: {config_path}")
        
        try:
            with open(path) as f:
                self._config = json.load(f)
        except json.JSONDecodeError as e:
            raise ConfigurationError(f"Invalid config format: {e}")
        
        # Load sensitive configs from environment
        for key in self._config:
            env_key = f"APP_{key.upper()}"
            if env_key in os.environ:
                self._config[key] = os.environ[env_key]
                self._secret_keys.add(key)
    
    def get(self, key: str, default: Any = None) -> Any:
        """Get configuration value."""
        return self._config.get(key, default)
    
    def __str__(self) -> str:
        """Safe string representation hiding sensitive values."""
        safe_config = {
            k: '******' if k in self._secret_keys else v
            for k, v in self._config.items()
        }
        return json.dumps(safe_config, indent=2)
```

### 3. Data Sanitization

#### Input Sanitizer
```python
# security/sanitization.py
import html
import re
from typing import Any, Optional

class InputSanitizer:
    """Input sanitization utilities."""
    
    @staticmethod
    def sanitize_html(content: str) -> str:
        """Sanitize HTML content."""
        return html.escape(content)
    
    @staticmethod
    def sanitize_filename(filename: str) -> str:
        """Sanitize file names."""
        # Remove potentially dangerous characters
        clean = re.sub(r'[^a-zA-Z0-9._-]', '_', filename)
        # Prevent directory traversal
        return clean.lstrip('.')
    
    @staticmethod
    def sanitize_sql(value: Any) -> str:
        """Sanitize SQL input (prefer parameterized queries)."""
        if value is None:
            return 'NULL'
        return str(value).replace("'", "''")
```

## Best Practices Implementation

### 1. Error Handling Guidelines
- Use specific exceptions
- Implement proper cleanup
- Log errors appropriately
- Provide context information
- Handle all error cases

### 2. Security Guidelines
- Validate all inputs
- Sanitize user data
- Use secure defaults
- Implement proper authentication
- Regular security audits

### 3. Recovery Strategies
- Implement retry logic
- Handle temporary failures
- Maintain system state
- Provide fallback options
- Monitor recovery success

### 4. Logging and Monitoring
- Log security events
- Monitor error patterns
- Track system health
- Alert on critical issues
- Maintain audit trails

## Security and Error Prevention

### 1. Code Analysis Tools
- Use static analyzers
- Implement security linting
- Regular dependency scans
- Code quality checks
- Type checking

### 2. Testing Practices
- Security test cases
- Error handling tests
- Input validation tests
- Recovery scenario tests
- Penetration testing

### 3. Documentation
- Security policies
- Error handling guides
- Recovery procedures
- Audit requirements
- Incident response