FROM=v2
TO=v1

SERVICE_NAME=testswitch.service

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

main_dir=$(dirname $DIR)

for i in `seq 1 5`; do
	msg="`date +'%Y-%m-%d %H:%M:%S'` $FROM"
	echo "$msg" >> $main_dir/$SERVICE_NAME.log
	echo "$msg"
	sleep 1
done
rm -f $main_dir/testswitch && ln -sf $main_dir/releases/$TO $main_dir/testswitch
systemctl restart $SERVICE_NAME
