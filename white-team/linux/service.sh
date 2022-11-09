#!/bin/bash

cat >> /etc/systemd/system/service.service << EOF
[Unit]
Description
Wants=network.target
After=network.target

[Service]
User=
WorkingDirectory=
ExecStart=
Restart=always

[Install]
WantedBy=multi-user.target
EOF