#!/bin/bash

# Install Redhat Cluster Suite
yum groupinstall "High Availability"
yum install ricci luci

passwd ricci

service luci start

