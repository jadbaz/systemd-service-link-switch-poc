DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

SERVICE_NAME=testswitch.service

rm -f $DIR/testswitch && ln -sf $DIR/releases/v1 $DIR/testswitch

rm -f /usr/lib/systemd/system/$SERVICE_NAME
cp -f $SERVICE_NAME /usr/lib/systemd/system/

sed -i "s|<BASE_DIR>|$DIR|g" /usr/lib/systemd/system/$SERVICE_NAME

echo Created systemd service: $SERVICE_NAME
