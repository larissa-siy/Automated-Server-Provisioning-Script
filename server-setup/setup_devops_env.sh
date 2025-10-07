#!/bin/bash

# ============================
# Automated DevOps Environment Setup Script
# Author: Larissa Siyunyi
# ============================

set -e  # Exit on error
source ./config.env

# Colors for readability
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${GREEN}🚀 Starting DevOps environment setup...${RESET}"

# ---- System Update ----
echo -e "${YELLOW}📦 Updating system packages...${RESET}"
sudo apt update -y && sudo apt upgrade -y

# ---- Install Git ----
echo -e "${YELLOW}🔧 Installing Git...${RESET}"
sudo apt install -y git

# ---- Install Docker ----
echo -e "${YELLOW}🐳 Installing Docker...${RESET}"
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo usermod -aG docker "$USER_NAME"

# ---- Install Jenkins ----
echo -e "${YELLOW}⚙️ Installing Jenkins...${RESET}"
sudo apt install -y openjdk-11-jdk wget gnupg
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y && sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# ---- Install Node.js ----
echo -e "${YELLOW}💻 Installing Node.js (v${NODE_VERSION})...${RESET}"
curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -
sudo apt install -y nodejs

# ---- Verify Installations ----
echo -e "${YELLOW}🔍 Verifying installations...${RESET}"
docker --version
git --version
java -version
node -v
jenkins --version || echo "Jenkins installed, running as service."

# ---- Final Info ----
echo -e "${GREEN}✅ Setup complete!${RESET}"
echo -e "Jenkins is running at: http://localhost:${JENKINS_PORT}"
echo -e "Docker and Node.js installed successfully."
