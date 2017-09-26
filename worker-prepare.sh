#!/usr/bin/env bash
sudo apt-get -qq install -y jq
mainNodeID="ubuntu"

thisIP=$(./common/docker/utils/swarm.sh getNodeIP $mainNodeID)

CONFIGTX_nfs="/home/david/Documents/nfs/CONFIGTX"
MSPROOT_nfs="/home/david/Documents/nfs/MSPROOT"
CONFIGTX_DIR=$(./common/docker/utils/swarm.sh getNodeLabels| jq -r ".CONFIGTX")

MSPROOT_DIR=$(./common/docker/utils/swarm.sh getNodeLabels| jq -r ".MSPROOT")
./common/docker/utils/nfs.sh udpate $thisIP $MSPROOT_DIR $MSPROOT_nfs
./common/docker/utils/nfs.sh udpate $thisIP $CONFIGTX_DIR $CONFIGTX_nfs
