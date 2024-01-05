# The purpose of this script is to create a dynamic status bar in X11?
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
	sleep 1
done &
