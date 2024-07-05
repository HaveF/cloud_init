#!/bin/bash

# Fetch the latest release version from GitHub API
LATEST_URL=$(curl -s https://api.github.com/repos/hetznercloud/cli/releases/latest | grep "browser_download_url.*hcloud-linux-amd64.tar.gz" | cut -d '"' -f 4)

# Download the latest release
wget $LATEST_URL -O /tmp/hcloud-linux-amd64.tar.gz

# Extract the tarball
tar -xzf /tmp/hcloud-linux-amd64.tar.gz -C /tmp

# Ensure the ~/go/bin directory exists
mkdir -p ~/go/bin

# Move the binary to ~/go/bin
mv /tmp/hcloud ~/go/bin/

# Make the binary executable
chmod +x ~/go/bin/hcloud

# Add ~/go/bin to PATH if not already there
if ! echo $PATH | grep -q "$HOME/go/bin"; then
  echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
  source ~/.bashrc
fi

# Verify installation
echo "Installation complete. Verifying installation..."
if command -v hcloud &> /dev/null; then
  echo "hcloud installed successfully."
else
  echo "hcloud installation failed."
fi

