sudo apt update -y
sudo apt install apache2
sudo service apache2 start
sudo service apache2 status 
timestamp=$(date '+%d%m%Y-%H%M%S')  
sudo tar cvf "Nisha-httpd-logs${timestamp}.tar" "ubuntu\var\log\apache2\access"

myname=nisha
s3_bucket=upgrad-nishanimesh
timestamp=$(date '+%d%m%Y-%H%M%S') 
aws s3 \
cp /tmp/${myname}-httpd-logs${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs${timestamp}.tar


timestamp=$(date '+%d%m%Y-%H%M%S')
file="Nisha-httpd-logs${timestamp}.tar"
fileName="/tmp/$file"
size=`du -k "$fileName" | cut -f1`
sudo echo "httpd-logs ${timestamp} tar ${size}K">> /var/www/html/inventory.html 


