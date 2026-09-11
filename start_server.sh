#!/usr/bin/env bash
# Growth Dashboard hosting script
PORT=8080

echo "Starting local server on port $PORT..."
python3 -m http.server $PORT --directory "$(dirname "$0")" &
SERVER_PID=$!

echo "Opening public secure HTTPS tunnel..."
ssh -o StrictHostKeyChecking=no -R 80:localhost:$PORT nokey@localhost.run

kill $SERVER_PID 2>/dev/null || true
