#!/bin/bash

# Prompt for GitHub repo URL
read -p "Enter your GitHub repo URL (e.g. https://github.com/yourname/repo.git): " REPO_URL

# Optional: show current directory
echo "📁 Working directory: $(pwd)"

# Init Git repository with explicit config
echo "🔧 Initializing Git..."
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false init

# Add all files with ignore-errors and explicit flags
echo "📦 Staging all files..."
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false add --ignore-errors -A -- .

# Optional: Add specific file (if needed)
# git -c credential.helper= -c core.quotepath=false -c log.showSignature=false add --ignore-errors -A -- github_init_script_with_ssh.sh

# Add forced files (like .idea config)
echo "📂 Forcing add of .idea and other config files..."
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false add --ignore-errors -A -f -- ImportantScript.iml .idea/dbnavigator.xml .idea/modules.xml .idea/.gitignore github_init_script_with_ssh.sh .idea/misc.xml .idea/vcs.xml

# Commit
echo "✅ Making initial commit..."
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false commit -m "1st commit"

# Add remote origin
echo "🔗 Adding remote origin: $REPO_URL"
git remote add origin "$REPO_URL"

# Push to remote
echo "🚀 Pushing to main..."
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false push --progress --porcelain origin refs/heads/main:refs/heads/main --set-upstream