export SERVE_PORT=5997
export LOGS_DIR=/root/.pm2/logs

echo "Serving at port: $SERVE_PORT"
echo "Logs directory: $LOGS_DIR"

bash killport.sh $SERVE_PORT
SCRIPT_PATH=$(realpath script.sh)
ttyd -p $SERVE_PORT -W bash $SCRIPT_PATH $LOGS_DIR
