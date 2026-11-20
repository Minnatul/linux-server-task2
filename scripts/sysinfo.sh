LOG_FILE="$HOME/sysinfo.log"

{
  echo "===== System Report ====="
  echo "Hostname : $(hostname)"
  echo "Date     : $(date)"
  echo "--- Disk Usage ---"
  df -h /
  echo "--- Memory Usage ---"
  free -h
  echo "Uptime   : $(uptime -p)"
  echo
} | tee -a "$LOG_FILE"
