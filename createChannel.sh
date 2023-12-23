export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/hiam.hal/orderers/orderer1.hiam.hal/msp/tlscacerts/tlsca.hiam.hal-cert.pem
export PEER0_ORG0_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/peers/peer0.org0.hiam.hal/tls/ca.crt
export PEER0_ORG1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/peers/peer0.org1.hiam.hal/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/peers/peer0.org2.hiam.hal/tls/ca.crt
export PEER0_ORG3_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/peers/peer0.org3.hiam.hal/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/peers/peer0.org4.hiam.hal/tls/ca.crt
export PEER0_ORG5_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/peers/peer0.org5.hiam.hal/tls/ca.crt


export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export CHANNEL_NAME=mychannel
export CHANNEL_NAME1=channel1
export CHANNEL_NAME2=channel2



# setGlobalsForOrderer(){
#     export CORE_PEER_LOCALMSPID="OrdererMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/hiam.hal/orderers/orderer1.hiam.hal/msp/tlscacerts/tlsca.hiam.hal-cert.pem
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/hiam.hal/users/Admin@hiam.hal/msp
    
# }

setGlobalsForPeer0org0(){
    export CORE_PEER_LOCALMSPID="org0MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG0_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/users/Admin@org0.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1org0(){
    export CORE_PEER_LOCALMSPID="org0MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG0_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/users/Admin@org0.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:8051    
}

setGlobalsForPeer0org1(){
    export CORE_PEER_LOCALMSPID="org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/users/Admin@org1.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:9051    
}

setGlobalsForPeer1org1(){
    export CORE_PEER_LOCALMSPID="org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/users/Admin@org1.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:10051    
}

setGlobalsForPeer0org2(){
    export CORE_PEER_LOCALMSPID="org2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/users/Admin@org2.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:11051
}

setGlobalsForPeer1org2(){
    export CORE_PEER_LOCALMSPID="org2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/users/Admin@org2.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:12051    
}

setGlobalsForPeer0org3(){
    export CORE_PEER_LOCALMSPID="org3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/users/Admin@org3.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:13051
}

setGlobalsForPeer1org3(){
    export CORE_PEER_LOCALMSPID="org3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/users/Admin@org3.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:14051    
}

setGlobalsForPeer0org4(){
    export CORE_PEER_LOCALMSPID="org4MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG4_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/users/Admin@org4.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:15051
}

setGlobalsForPeer1org4(){
    export CORE_PEER_LOCALMSPID="org4MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG4_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/users/Admin@org4.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:16051    
}


setGlobalsForPeer0org5(){
    export CORE_PEER_LOCALMSPID="org5MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG5_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/users/Admin@org5.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:17051
}

setGlobalsForPeer1org5(){
    export CORE_PEER_LOCALMSPID="org5MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG5_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/users/Admin@org5.hiam.hal/msp
    export CORE_PEER_ADDRESS=localhost:18051    
}


createChannel(){
    rm -rf ./channel-artifacts/*
    setGlobalsForPeer0org0
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer1.hiam.hal \
    -f ./artifacts/channel/${CHANNEL_NAME}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel1(){
    setGlobalsForPeer0org0
    peer channel create -o localhost:7050 -c $CHANNEL_NAME1 \
    --ordererTLSHostnameOverride orderer1.hiam.hal \
    -f ./artifacts/channel/${CHANNEL_NAME1}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME1}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel2(){
    setGlobalsForPeer0org0
    peer channel create -o localhost:7050 -c $CHANNEL_NAME2 \
    --ordererTLSHostnameOverride orderer1.hiam.hal \
    -f ./artifacts/channel/${CHANNEL_NAME2}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME2}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

removeOldCrypto(){
    rm -rf ./api-1.4/crypto/*
    rm -rf ./api-1.4/fabric-client-kv-org1/*
    rm -rf ./api-2.0/org1-wallet/*
    rm -rf ./api-2.0/org2-wallet/*
}


joinChannel(){
    setGlobalsForPeer0org0 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer1org0
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer0org1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1org1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0org4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1org4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
}

joinChannel1(){
    setGlobalsForPeer0org0 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer1org0
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer0org1 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1org1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0org4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1org4
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block

    setGlobalsForPeer0org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
    
    setGlobalsForPeer1org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME1.block
}

joinChannel2(){
    setGlobalsForPeer0org0 
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1org0
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1org3
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

    setGlobalsForPeer0org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block
    
    setGlobalsForPeer1org5
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME2.block

}


updateAnchorPeers(){
    setGlobalsForPeer0org0
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org4
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org5
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

updateAnchorPeers1(){
    setGlobalsForPeer0org0
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org4
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0org5
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME1 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME1}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
   
}

updateAnchorPeers2(){
    setGlobalsForPeer0org0
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org3
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0org5
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal -c $CHANNEL_NAME2 -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors_${CHANNEL_NAME2}.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}


# removeOldCrypto

# createChannel
createChannel1
createChannel2

# joinChannel
joinChannel1
joinChannel2

# updateAnchorPeers
updateAnchorPeers1
updateAnchorPeers2
