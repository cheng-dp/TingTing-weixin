#!/bin/bash

PACKAGE="tingting-weixin-1.0-SNAPSHOT.jar"
SERVER="root@alicloud"
REMOTE_POSITION="~/WorkSpace/tingting-weixin/"
LOCAL_POSITION="/Users/cdp/Work/TingtingProj/TingTing/tingting-weixin/target/"
PACKAGE="tingting-weixin-1.0-SNAPSHOT.jar"
JAVA_REMOTE_ARGS="'-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005'"
RESTART_SCRIPT="restart_service.sh"

echo "Start Build $PAKAGE..."
mvn clean package

echo "Upload to server $SERVER..."
scp $LOCAL_POSITION$PACKAGE $SERVER:$REMOTE_POSITION
scp $RESTART_SCRIPT $SERVER:$REMOTE_POSITION

echo "Restart in server..."
ssh $SERVER "cd $REMOTE_POSITION ; chmod a+x $RESTART_SCRIPT ; ./$RESTART_SCRIPT $JAVA_REMOTE_ARGS $PACKAGE;"
echo "Restarted!"
