# Automated-Server-Provisioning-Script
In this project I created a Bash script that automatically installs and configures DevOps tools on a fresh Linux server

# 🛠️ Automated DevOps Environment Setup

A Bash script that provisions and configures a full DevOps environment with:
- Docker & Docker Compose
- Jenkins
- Node.js
- Git

## 🧩 Features
- Fully automated setup
- Customisable environment variables via `config.env`
- Error handling and colored output for clarity

## 🚀 Usage
```bash
git clone https://github.com/larissa-siy/server-setup.git
cd server-setup
chmod +x setup_devops_env.sh
./setup_devops_env.sh
