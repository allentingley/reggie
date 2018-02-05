let retrys=0
while : ; do
    STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" https://reggie-confluence.azurewebsites.net/heroku/keepalive)
    echo $STATUSCODE
    [[ $retrys -ne 5 ]] || break
    echo $retrys
    ((retrys++))
    [[ $STATUSCODE -ne 200 ]] || break
done