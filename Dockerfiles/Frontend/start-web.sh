echo "called sucsessfully"
cp monit-web.conf /etc/monitrc
chmod 700 /etc/monitrc
mkdir /var/run/monit/
echo $CI
if [ $CI ] ; then
    echo "test mode"
    monit
    sleep 3
    wget localhost:80
    if [ &? -eq 0 ]
    then
        echo "SUCCESS"
    else
        echo "unabe to reach port 80 FALILED"
        exit 1
    fi    
    exit 0
fi
monit -I
exit 0