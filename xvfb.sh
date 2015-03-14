XVFB=/usr/bin/Xvfb
XVFBARGS=":99 -screen 0 1920x1080x24 -fbdir /var/run -ac"
PIDFILE=/var/run/xvfb.pid
case "$1" in
  start)
  echo -n "Starting virtual X frame buffer: Xvfb"
  start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
  echo "."
  ;;
  stop)
  echo -n "Stopping virtual X frame buffer: Xvfb"
  start-stop-daemon --stop --quiet --pidfile $PIDFILE
  echo "."
  ;;
  restart)
  $0 stop
  $0 start
  ;;
  *)
  echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
  exit 1
esac

exit 0
