introduction:
    this software provides a web interface for searching, browsing and viewing large files under a remote directory

configuration:
    in `serve.sh`, change `SERVE_PORT` (the port where you want to serve the webpage) and `LOGS_DIR` (the directory where you want to browse files, must not include subdirectories)

usage:
    serve it by running `bash serve.sh`
    optionally use pm2 to run it as service: `pm2 start -n log_viewer bash -- serve.sh; pm2 save`

requirements:
    os:
        unix-like
    software:
        rg (ripgrep)
        ttyd