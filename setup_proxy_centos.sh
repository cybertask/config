#!/bin/bash

# First make the script executable and run it:
# chmod +x setup_proxy.sh
# ./setup_proxy.sh

# Set proxy environment variables in /etc/environment
echo 'http_proxy="http://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'https_proxy="https://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'ftp_proxy="ftp://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'no_proxy="localhost,127.0.0.1"' | sudo tee -a /etc/environment

# Set proxy for the yum package manager (or dnf for newer CentOS versions)
echo 'proxy=http://10.0.0.5:3128/' | sudo tee -a /etc/yum.conf
# If you're using dnf (CentOS 8 and above), you might also want to add it to /etc/dnf/dnf.conf

# Set proxy for Git
git config --global http.proxy http://10.0.0.5:3128
git config --global https.proxy https://10.0.0.5:3128

# Set proxy environment variables for all interactive bash sessions
echo 'export http_proxy="http://10.0.0.5:3128/"' >> ~/.bashrc
echo 'export https_proxy="https://10.0.0.5:3128/"' >> ~/.bashrc
echo 'export ftp_proxy="ftp://10.0.0.5:3128/"' >> ~/.bashrc
echo 'export no_proxy="localhost,127.0.0.1"' >> ~/.bashrc

# Set proxy environment variables system-wide for all users
echo 'export http_proxy="http://10.0.0.5:3128/"' | sudo tee -a /etc/profile.d/proxy.sh
echo 'export https_proxy="https://10.0.0.5:3128/"' | sudo tee -a /etc/profile.d/proxy.sh
echo 'export ftp_proxy="ftp://10.0.0.5:3128/"' | sudo tee -a /etc/profile.d/proxy.sh
echo 'export no_proxy="localhost,127.0.0.1"' | sudo tee -a /etc/profile.d/proxy.sh

echo "Proxy setup completed."
