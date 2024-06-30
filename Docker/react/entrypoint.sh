#!/bin/sh

# Check if the React app is not initialized
if [ ! -f /app/package.json ]; then
  # Ensure the directory is clean before initializing a new React app
  rm -rf /app/*

  # Initialize React app without TypeScript template
  npx create-react-app /app --template typescript
fi

# If the app is already initialized, just install dependencies
  cd /app
  npm install

# Start the React application
npm start
