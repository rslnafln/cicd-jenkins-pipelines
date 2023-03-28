sudo apt update
sudo apt install default-jdk -y
sudo apt install curl -y
sudo apt install git -y
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /tmp
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-9.0.73.tar.gz -C /opt/tomcat --strip-components=1
cd /opt/tomcat
sudo chown -RH tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/bin/*.sh'
echo "Need to create tomcat.service file (step 7)"