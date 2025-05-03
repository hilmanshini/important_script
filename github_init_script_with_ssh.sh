#!/bin/bash

# Prompt for email and repo
read -p "Enter your GitHub email: " EMAIL
read -p "Enter your GitHub repo (e.g. hilmanshini/css_learn): " REPO

# Generate SSH key
echo "Generating SSH key for $EMAIL..."
ssh-keygen -t ed25519 -C "$EMAIL"

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add private key to ssh-agent
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub
echo "✅ SSH public key copied to clipboard."

# Open GitHub SSH keys settings page
echo "🔗 Opening GitHub SSH settings..."
open "https://github.com/settings/keys"

# Wait for user to add key
read -p "Press Enter after you've added the SSH key to your GitHub account..."

# Set remote to SSH
echo "🔁 Setting Git remote to SSH..."
git remote set-url origin git@github.com:$REPO.git

# Push to main
echo "🚀 Pushing to main branch..."
git push -u origin main