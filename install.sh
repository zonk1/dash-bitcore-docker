#!/bin/bash -eu

CONFIG="/opt/satoshilabs/dash-bitcore-runtime/bitcore-node-dash.json"

if [ -e "$CONFIG" ]; then
	echo "Overwrite current config: $CONFIG"
	echo -n "[Y]es/[N]o: "
	read REPLY
	echo
	if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]; then
		cp `dirname "$0"`/config.json "$CONFIG"
	else
		echo "Not installing new config to $CONFIG"
	fi
fi

cp satoshilabs-dash.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable satoshilabs-dash.service

cd `dirname "$0"`
chmod +x dashd
docker build --rm -t satoshilabs-dash .

echo "Start service with: systemctl start satoshilabs-dash.service"
echo "Restart service (if it was running already): systemctl restart satoshilabs-dash.service"
echo "View logs with: journalctl -f -u satoshilabs-dash.service"

