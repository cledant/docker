export LD_LIBRARY_PATH=/opt/teamspeak3-server_linux_amd64

TS3ARGS=""
if [ -e /opt/teamspeak3-server_linux_amd64/ts3server.ini ]; then
	  TS3ARGS="inifile=/opt/teamspeak3-server_linux_amd64/ts3server.ini"
  else
	  TS3ARGS="createinifile=1"
fi
	
exec /opt/teamspeak3-server_linux_amd64/ts3server $TS3ARGS
