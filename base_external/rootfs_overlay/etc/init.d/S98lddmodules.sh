#! /bin/sh
case "$1" in
    start)
        echo "Loading modules"
        scull_load
        module_load faulty
        modprobe hello
        ;;
    stop)
        echo "Unloading modules"
        scull_unload
        module_unload faulty
        rmmod hello
        ;;
    *)
        echo "Usage $0 {start|stop}"
    exit 1
esac
exit 0
