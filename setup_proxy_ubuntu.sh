#!/bin/bash

# First make the script executable and run it:
# chmod +x setup_proxy_ubuntu.sh
# ./setup_proxy_ubuntu.sh


# Set proxy environment variables in /etc/environment
echo 'http_proxy="http://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'https_proxy="https://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'ftp_proxy="ftp://10.0.0.5:3128/"' | sudo tee -a /etc/environment
echo 'no_proxy="localhost,127.0.0.1"' | sudo tee -a /etc/environment

# Set proxy for the apt package manager
echo 'Acquire::http::Proxy "http://10.0.0.5:3128/";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy "https://10.0.0.5:3128/";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::ftp::Proxy "ftp://10.0.0.5:3128/";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf

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
