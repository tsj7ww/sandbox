# Python Performance Optimization and Resource Management: Comprehensive Guide

## Performance Optimization Framework

### 1. Performance Monitoring Infrastructure

#### Profiling Setup
```python
# profiling/profiler.py
import cProfile
import pstats
from functools import wraps
from pathlib import Path
from typing import Callable, Any, Optional

class PerformanceProfiler:
    """Performance profiling utility for tracking execution metrics."""
    
    def __init__(self, output_dir: str = "profiles"):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
    
    def profile(self, output_file: Optional[str] = None) -> Callable:
        """Decorator for profiling functions."""
        def decorator(func: Callable) -> Callable:
            @wraps(func)
            def wrapper(*args: Any, **kwargs: Any) -> Any:
                profile = cProfile.Profile()
                try:
                    result = profile.runcall(func, *args, **kwargs)
                    if output_file:
                        stats_path = self.output_dir / f"{output_file}.stats"
                        profile.dump_stats(str(stats_path))
                        # Create readable report
                        stats = pstats.Stats(str(stats_path))
                        stats.sort_stats('cumulative')
                        report_path = self.output_dir / f"{output_file}.txt"
                        with open(report_path, 'w') as f:
                            stats.stream = f
                            stats.print_stats()
                    return result
                finally:
                    profile.disable()
            return wrapper
        return decorator
```

### 2. Memory Management

#### Memory Tracker
```python
# monitoring/memory.py
import gc
import psutil
import os
from typing import Dict, Any
from dataclasses import dataclass
from contextlib import contextmanager

@dataclass
class MemoryStats:
    """Container for memory statistics."""
    rss: int  # Resident Set Size
    vms: int  # Virtual Memory Size
    shared: int  # Shared Memory
    objects: int  # Python Objects Count
    
class MemoryTracker:
    """Utility for tracking memory usage."""
    
    @staticmethod
    def get_process_memory() -> MemoryStats:
        """Get current process memory statistics."""
        process = psutil.Process(os.getpid())
        meminfo = process.memory_info()
        return MemoryStats(
            rss=meminfo.rss,
            vms=meminfo.vms,
            shared=meminfo.shared,
            objects=len(gc.get_objects())
        )
    
    @contextmanager
    def track_memory(self, label: str = ""):
        """Context manager for tracking memory changes."""
        gc.collect()  # Clean up before measurement
        before = self.get_process_memory()
        yield
        gc.collect()  # Clean up after operations
        after = self.get_process_memory()
        
        print(f"Memory Change ({label}):")
        print(f"RSS: {(after.rss - before.rss) / 1024 / 1024:.2f} MB")
        print(f"Objects: {after.objects - before.objects}")
```

### 3. Resource Management

#### Resource Pool
```python
# resources/pool.py
from typing import TypeVar, Generic, Callable, List, Optional
from contextlib import contextmanager
import threading
import queue
import time

T = TypeVar('T')

class ResourcePool(Generic[T]):
    """Generic resource pool for managing reusable resources."""
    
    def __init__(self, 
                 factory: Callable[[], T],
                 max_size: int = 10,
                 min_size: int = 2,
                 max_idle_time: float = 300):
        self.factory = factory
        self.max_size = max_size
        self.min_size = min_size
        self.max_idle_time = max_idle_time
        self.pool: queue.Queue = queue.Queue()
        self.size = 0
        self.lock = threading.Lock()
        self._initialize()
    
    def _initialize(self) -> None:
        """Initialize the minimum number of resources."""
        for _ in range(self.min_size):
            self._add_resource()
    
    def _add_resource(self) -> None:
        """Create and add a new resource to the pool."""
        with self.lock:
            if self.size < self.max_size:
                resource = self.factory()
                self.pool.put((time.time(), resource))
                self.size += 1
    
    @contextmanager
    def acquire(self) -> T:
        """Acquire a resource from the pool."""
        resource = None
        try:
            while True:
                try:
                    timestamp, resource = self.pool.get_nowait()
                    # Check if resource has been idle too long
                    if time.time() - timestamp > self.max_idle_time:
                        self.size -= 1
                        continue
                    break
                except queue.Empty:
                    self._add_resource()
            yield resource
        finally:
            if resource is not None:
                self.pool.put((time.time(), resource))
```

## Performance Optimization Techniques

### 1. Computation Optimization

#### Memoization
```python
# optimization/memoization.py
from typing import TypeVar, Callable, Dict, Any
from functools import wraps

T = TypeVar('T')

def memoize(func: Callable[..., T]) -> Callable[..., T]:
    """Memoization decorator with cache size limit."""
    cache: Dict[str, Any] = {}
    max_size = 1000
    
    @wraps(func)
    def wrapper(*args: Any, **kwargs: Any) -> T:
        # Create cache key from arguments
        key = str(args) + str(sorted(kwargs.items()))
        
        # Implement LRU-style cache
        if key in cache:
            value, _ = cache[key]
            cache[key] = (value, time.time())
            return value
            
        # Calculate new value
        result = func(*args, **kwargs)
        
        # Manage cache size
        if len(cache) >= max_size:
            # Remove oldest entry
            oldest_key = min(cache.keys(), key=lambda k: cache[k][1])
            del cache[oldest_key]
            
        cache[key] = (result, time.time())
        return result
        
    return wrapper
```

### 2. Data Structure Optimization

#### Efficient Collections
```python
# optimization/collections.py
from typing import TypeVar, Generic, Iterator, Optional
from dataclasses import dataclass
from collections import deque

T = TypeVar('T')

@dataclass
class Node(Generic[T]):
    """Node for custom data structures."""
    value: T
    next: Optional['Node[T]'] = None
    prev: Optional['Node[T]'] = None

class EfficientQueue(Generic[T]):
    """Memory-efficient queue implementation."""
    
    def __init__(self, maxsize: int = 0):
        self.maxsize = maxsize
        self._head: Optional[Node[T]] = None
        self._tail: Optional[Node[T]] = None
        self._size = 0
    
    def push(self, value: T) -> None:
        """Add item to queue."""
        if self.maxsize and self._size >= self.maxsize:
            raise ValueError("Queue is full")
            
        node = Node(value)
        if not self._head:
            self._head = self._tail = node
        else:
            node.prev = self._tail
            self._tail.next = node  # type: ignore
            self._tail = node
        self._size += 1
    
    def pop(self) -> T:
        """Remove and return item from queue."""
        if not self._head:
            raise IndexError("Queue is empty")
            
        value = self._head.value
        self._head = self._head.next
        if self._head:
            self._head.prev = None
        else:
            self._tail = None
        self._size -= 1
        return value
```

### 3. I/O Optimization

#### Efficient File Handling
```python
# optimization/io.py
from typing import Iterator, Any, BinaryIO
import mmap
from contextlib import contextmanager
import os

class EfficientFileReader:
    """Memory-efficient file reading utilities."""
    
    @staticmethod
    @contextmanager
    def mmap_reader(filename: str) -> Iterator[mmap.mmap]:
        """Memory-mapped file reader."""
        with open(filename, 'rb') as f:
            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as m:
                yield m
    
    @staticmethod
    def chunk_reader(file: BinaryIO, chunk_size: int = 8192) -> Iterator[bytes]:
        """Efficient chunk-based file reader."""
        while True:
            chunk = file.read(chunk_size)
            if not chunk:
                break
            yield chunk
```

## Resource Management Best Practices

### 1. Memory Management

#### Best Practices Implementation
```python
# management/memory.py
from typing import TypeVar, Generic, Optional
import weakref

T = TypeVar('T')

class ResourceManager(Generic[T]):
    """Resource manager with automatic cleanup."""
    
    def __init__(self):
        self._resources = weakref.WeakSet()
    
    def register(self, resource: T) -> T:
        """Register a resource for management."""
        self._resources.add(resource)
        return resource
    
    def cleanup(self) -> None:
        """Clean up all registered resources."""
        for resource in self._resources:
            if hasattr(resource, 'close'):
                resource.close()
```

### 2. Thread Management

#### Thread Pool Implementation
```python
# management/threads.py
from typing import Callable, Any, List
import threading
from queue import Queue
import time

class WorkerThread(threading.Thread):
    """Worker thread for thread pool."""
    
    def __init__(self, tasks: Queue):
        super().__init__(daemon=True)
        self.tasks = tasks
        self.running = True
    
    def run(self) -> None:
        while self.running:
            try:
                task = self.tasks.get(timeout=1)
                task()
                self.tasks.task_done()
            except Queue.Empty:
                continue

class ThreadPool:
    """Thread pool for parallel task execution."""
    
    def __init__(self, num_threads: int):
        self.tasks: Queue = Queue()
        self.workers: List[WorkerThread] = []
        for _ in range(num_threads):
            worker = WorkerThread(self.tasks)
            worker.start()
            self.workers.append(worker)
    
    def submit(self, func: Callable[..., Any], *args: Any, **kwargs: Any) -> None:
        """Submit task to thread pool."""
        self.tasks.put(lambda: func(*args, **kwargs))
    
    def shutdown(self) -> None:
        """Shutdown thread pool."""
        for worker in self.workers:
            worker.running = False
        for worker in self.workers:
            worker.join()
```

## Performance Monitoring and Profiling

### 1. Performance Metrics Collection

#### Metrics Collector
```python
# monitoring/metrics.py
from typing import Dict, List, Any
import time
import statistics
from dataclasses import dataclass
from contextlib import contextmanager

@dataclass
class MetricPoint:
    """Single metric measurement point."""
    timestamp: float
    value: float

class MetricsCollector:
    """Collect and analyze performance metrics."""
    
    def __init__(self):
        self.metrics: Dict[str, List[MetricPoint]] = {}
    
    def record(self, metric: str, value: float) -> None:
        """Record a metric value."""
        if metric not in self.metrics:
            self.metrics[metric] = []
        self.metrics[metric].append(
            MetricPoint(time.time(), value)
        )
    
    @contextmanager
    def measure_time(self, metric: str) -> None:
        """Measure execution time of a block."""
        start = time.time()
        try:
            yield
        finally:
            duration = time.time() - start
            self.record(metric, duration)
    
    def get_statistics(self, metric: str) -> Dict[str, float]:
        """Calculate statistics for a metric."""
        values = [point.value for point in self.metrics[metric]]
        return {
            'mean': statistics.mean(values),
            'median': statistics.median(values),
            'std_dev': statistics.stdev(values) if len(values) > 1 else 0,
            'min': min(values),
            'max': max(values)
        }
```

## Best Practices Summary

### 1. Performance Optimization
- Profile before optimizing
- Focus on bottlenecks
- Monitor memory usage
- Optimize critical paths
- Use appropriate data structures

### 2. Resource Management
- Implement proper cleanup
- Use context managers
- Pool reusable resources
- Monitor resource usage
- Handle resource exhaustion

### 3. Memory Management
- Minimize object creation
- Use weak references
- Implement cleanup handlers
- Monitor memory leaks
- Profile memory usage

### 4. Threading and Concurrency
- Use thread pools
- Manage thread lifecycles
- Handle thread safety
- Monitor thread usage
- Implement proper synchronization