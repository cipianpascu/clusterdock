sudo docker exec -i `sudo docker ps | grep clusterdock | grep secondary | head -1 | awk '{print $1}'` bash -c "echo \"nameserver 8.8.8.8\" >> /etc/resolv.conf;wget -qO- https://raw.githubusercontent.com/academyofdata/clusterdock/master/get2hdfs.sh | bash -s"
