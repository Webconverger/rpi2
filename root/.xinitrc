. /etc/webc/webc.conf
while true
do
	xsetroot -name "$webc_id $webc_version"
	sleep 5
done &
exec dwm
