#!/bin/bash
# Kill all processes using specified port (default: 5997)
PORT=${1:-5997}

# Find PIDs using lsof (preferred) or ss
if ! PIDS=$(lsof -ti :$PORT 2>/dev/null); then
    PIDS=$(ss -ltnp | awk -v port=":$PORT" '$4 ~ port {split($6,a,"[,=]"); print a[2]}' | sort -u)
fi

# Terminate processes
if [[ -z "$PIDS" ]]; then
    echo "✅ No processes found using port $PORT"
    exit 0
fi

echo "🔫 Killing processes on port $PORT (PIDs: ${PIDS//$'\n'/, })"
kill -9 $PIDS 2>/dev/null

# Verify results
if ss -tuln | grep -q ":$PORT"; then
    echo "❌ Failed to kill processes on port $PORT"
    exit 1
else
    echo "✅ Successfully freed port $PORT"
    exit 0
fi
