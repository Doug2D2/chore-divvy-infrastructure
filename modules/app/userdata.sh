#! /bin/bash
sudo yum update -y
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_13.x | sudo -E bash -
sudo yum install nodejs -y
sudo npm install -g pm2
export NODE_ENV=qa
echo "export NODE_ENV=qa" >> /etc/environment
cd /home/ec2-user
aws s3 cp s3://chore-divvy/chore-divvy-backend.tar .
tar -xvf chore-divvy-backend.tar
rm chore-divvy-backend.tar
cd chore-divvy-backend
npm install
sudo pm2 start server.js -u ec2-user --name chore-divvy-app
