# Use Node.js LTS as base image
FROM node:20-bullseye

# Install essential packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Install Oh My Zsh for better terminal experience
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install global npm packages
RUN npm install -g \
    @angular/cli \
    create-react-app \
    create-next-app \
    typescript \
    ts-node \
    nodemon \
    prettier \
    eslint \
    nx \
    serve \
    http-server \
    npm-check-updates \
    yarn

# Create workspace directory
WORKDIR /workspace

# Create a package.json with commonly used dependencies
COPY <<EOF /workspace/package.json
{
  "name": "js-dev-environment",
  "version": "1.0.0",
  "description": "JavaScript Development Environment",
  "scripts": {
    "test": "jest"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "next": "^14.0.0",
    "@angular/core": "^17.0.0",
    "@angular/common": "^17.0.0",
    "d3": "^7.8.5",
    "three.js": "^0.158.0",
    "chart.js": "^4.4.0",
    "lodash": "^4.17.21",
    "axios": "^1.6.0",
    "express": "^4.18.2",
    "zod": "^3.22.4",
    "date-fns": "^2.30.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "@types/node": "^20.0.0",
    "@types/d3": "^7.4.0",
    "@types/lodash": "^4.14.200",
    "@types/jest": "^29.5.0",
    "typescript": "^5.2.0",
    "jest": "^29.7.0",
    "ts-jest": "^29.1.0",
    "@testing-library/react": "^14.0.0",
    "@testing-library/jest-dom": "^6.1.0",
    "cypress": "^13.0.0",
    "eslint": "^8.45.0",
    "eslint-config-next": "^14.0.0",
    "eslint-plugin-react": "^7.33.0",
    "eslint-plugin-react-hooks": "^4.6.0",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "prettier": "^3.0.0",
    "tailwindcss": "^3.3.0",
    "postcss": "^8.4.0",
    "autoprefixer": "^10.4.0"
  }
}
EOF

# Create a basic ESLint configuration
COPY <<EOF /workspace/.eslintrc.json
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "plugins": ["react", "@typescript-eslint"],
  "rules": {
    "react/react-in-jsx-scope": "off"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
EOF

# Create a basic Prettier configuration
COPY <<EOF /workspace/.prettierrc
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
EOF

# Create a tsconfig.json
COPY <<EOF /workspace/tsconfig.json
{
  "compilerOptions": {
    "target": "es2022",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true
  },
  "include": ["**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
EOF

# Create a basic test file
COPY <<EOF /workspace/test.tsx
import React from 'react';
import { render, screen } from '@testing-library/react';

const App = () => <div>Hello JavaScript Development Environment!</div>;

test('renders welcome message', () => {
  render(<App />);
  expect(screen.getByText(/hello javascript/i)).toBeInTheDocument();
});
EOF

# Install dependencies
RUN npm install

# Set default command
CMD ["/bin/zsh"]