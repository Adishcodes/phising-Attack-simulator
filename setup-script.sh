#!/bin/bash
set -euo pipefail

# EDIT THESE: put emails you control
EMAIL1="alice@gmail.com" 
EMAIL2="jonsnow@gmail.com" 

WORKDIR="$HOME/phishing-sim"
GOPHISH_VERSION="v0.12.1"
GOPHISH_ZIP="gophish-${GOPHISH_VERSION}-linux-64bit.zip"
GOPHISH_URL="https://github.com/gophish/gophish/releases/download/${GOPHISH_VERSION}/${GOPHISH_ZIP}"

# create folder
mkdir -p "$WORKDIR"
cd "$WORKDIR"

# minimal tools
sudo apt update -y
sudo apt install -y wget unzip curl

# install MailHog
wget -qO /tmp/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.1/MailHog_linux_amd64
sudo mv /tmp/mailhog /usr/local/bin/mailhog
sudo chmod +x /usr/local/bin/mailhog
nohup mailhog > ~/mailhog.log 2>&1 &
echo "MailHog started (UI: http://127.0.0.1:8025)."

# download GoPhish
cd ~
mkdir -p ~/gophish
wget -qO /tmp/gophish.zip "$GOPHISH_URL"
unzip -o /tmp/gophish.zip -d ~/gophish
GOPHISH_DIR=$(find ~/gophish -maxdepth 1 -type d -name "gophish*" | head -n1)
cd "$GOPHISH_DIR"
nohup sudo ./gophish > ~/gophish.log 2>&1 &
echo "GoPhish started (admin UI: http://127.0.0.1:3333). Check ~/gophish.log for credentials."

# create files
cat > "$WORKDIR/landing_page.html" <<'HTML'
<!doctype html><html><head><meta charset="utf-8"><title>University Portal - Login</title>...
(Use the landing_page.html content from the repo)
HTML

cat > "$WORKDIR/email_template.html" <<'HTML'
(Use the email_template.html content from the repo)
HTML

cat > "$WORKDIR/recipients.csv" <<CSV
email,first,last,position
$EMAIL1,Test,One,Student
$EMAIL2,Test,Two,Student
CSV

cat > "$WORKDIR/phishing-report.md" <<'MD'
(Use the phishing-report.md content from the repo)
MD

echo "Files created in $WORKDIR. Next: open GoPhish admin UI and create campaign using these files."
ChatGPT said:
