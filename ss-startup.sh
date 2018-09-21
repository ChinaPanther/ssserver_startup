#!/usr/bin/env bash

RETVAL=0
prog="vpn-server"
confpath="/etc/shadowsocks/config.json"
pid_file="/tmp/ss.pid"
log_file="/tmp/ss.log"

start()
{
    ssserver -c $confpath --pid-file $pid_file --log-file $log_file -d start
    RETVAL=$?
}
stop
{
    ssserver -c $confpath --pid-file $pid_file --log-file $log_file -d stop
    RETVAL=$?
}

restart()
{
    ssserver -c $confpath --pid-file $pid_file --log-file $log_file -d restart
    RETVAL=$?
}

case "$1" in    
    start)
        start
        if [ $RETVAL -eq 0 ]; then
            echo "start ssserver sucessed !!"
        else
            echo "start ssserver failed !!"
        fi
        ;;
    stop)
        stop
        if [ $RETVAL -eq 0 ]; then
            echo "stop ssserver sucessed !!"
        else
            echo "stop ssserver failed !!"
        fi
        ;;
    restart)
        restart
        if [ $RETVAL -eq 0 ]; then
            echo "restart ssserver sucessed !!"
        else
            echo "restart ssserver failed !!"
        fi
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|try-restart|force-reload|status}"
        exit 1
esac

exit $RETVAL
