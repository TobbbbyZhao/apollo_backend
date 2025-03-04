#!/bin/bash

PROJECT_DIR="../"

cd $PROJECT_DIR || { echo "❌ Project directory not found! Exiting..."; exit 1; }

git fetch origin main

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/main)

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
    echo "🔄 Changes detected! Pulling latest updates..."

    git pull origin main

    npm install

    echo "🛑 Stopping existing Node.js server..."
    sudo pkill -f "sudo nohup node server.js"

    echo "🚀 Starting Node.js server..."
    sudo nohup node server.js > server.log 2>&1 &

    echo "✅ Server restarted successfully!"
else
    echo "✅ No updates found. Server is up to date!"
fi
