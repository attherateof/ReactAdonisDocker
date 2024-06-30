#!/bin/sh

# Check if the app exists, if not, create it
if [ ! -f /app/package.json ]; then
  # Ensure the directory is clean before creating a new app
  rm -rf /app/*
  npx create-next-app@latest /app
fi

cd /app
npm install

# Start the React application
npm start
