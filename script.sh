LOGS_DIR=${1:-/root/.pm2/logs}
echo "Moving to logs dir: $LOGS_DIR"
cd $LOGS_DIR

rg --line-number --color=never . | fzf --delimiter=':' --with-nth=1,2,3 --preview='tail -n +{2} {1}' --bind='enter:execute(less -n +{2} {1} </dev/tty >/dev/tty 2>&1)'

#rg --line-number --color=never . | fzf --delimiter=':' --with-nth=1,2,3 --preview='batcat -r {2}: {1}' --bind='enter:execute(less -n +{2} {1} </dev/tty >/dev/tty 2>&1)'

#rg --line-number --color=never . | fzf --delimiter=':' --with-nth=1,2,3 --preview-window '+{2}-/2' --preview='batcat -A -n {1}' --bind='enter:execute(batcat -A -n {1} </dev/tty >/dev/tty 2>&1)'
