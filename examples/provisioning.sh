#!/bin/bash
apt update
apt install -y docker.io
apt install -y git tmux
pip install ansible netaddr
systemctl start docker
