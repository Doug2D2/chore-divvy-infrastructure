#! /bin/bash
sudo yum update -y
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_13.x | sudo -E bash -
sudo yum install nodejs -y
sudo npm install -g serve
cd /home/ec2-user
aws s3 cp s3://chore-divvy/chore-divvy-frontend.tar .
tar -xvf chore-divvy-frontend.tar
rm chore-divvy-frontend.tar
cd chore-divvy-frontend
npx npm-force-resolutions
npm install
npm run build
serve -s build -l 80
