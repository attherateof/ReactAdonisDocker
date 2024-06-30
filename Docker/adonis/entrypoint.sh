#!/bin/sh

# Check if the Adonis app is not initialized
if [ ! -f /app/package.json ]; then
  # Ensure the directory is clean before initializing a new Adonis app
  rm -rf /app/*

  # Initialize Adonis app with API kit and auth-guard access_tokens
  npm init adonisjs@latest /app -- --kit=api --auth-guard=access_tokens --db=mysql
  cd /app
else
  # If the app is already initialized, just start the server
  cd /app
fi

npm install

# Start the Adonis application
npm run dev
