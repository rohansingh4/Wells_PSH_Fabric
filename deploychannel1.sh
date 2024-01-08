export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/hiam.hal/orderers/orderer1.hiam.hal/msp/tlscacerts/tlsca.hiam.hal-cert.pem
export PEER0_ORG0_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/peers/peer0.org0.hiam.hal/tls/ca.crt
export PEER0_ORG1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/peers/peer0.org1.hiam.hal/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/peers/peer0.org2.hiam.hal/tls/ca.crt
export PEER0_ORG3_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/peers/peer0.org3.hiam.hal/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/peers/peer0.org4.hiam.hal/tls/ca.crt
export PEER0_ORG5_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/peers/peer0.org5.hiam.hal/tls/ca.crt

export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/
export PRIVATE_DATA_CONFIG=${PWD}/artifacts/private-data/collections_config_1.json

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


CHANNEL_NAME1="channel1"
CC_RUNTIME_LANGUAGE="node"
VERSION="1"
CC_SRC_PATH="./artifacts/src/github.com/assetMonetizationContract"
CC_NAME="agreement"


packageChaincode() {
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0org0
    peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on peer0.org1 ===================== "
}


installChaincode() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org0 ===================== "

    setGlobalsForPeer0org1
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org1 ===================== "

    setGlobalsForPeer0org2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org2 ===================== "

    setGlobalsForPeer0org3
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org3 ===================== "

    setGlobalsForPeer0org4
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org4 ===================== "

    setGlobalsForPeer0org5
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org5 ===================== "
}

queryInstalled0() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org0 on channel ===================== "
}


queryInstalled1() {
    setGlobalsForPeer0org1
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org1 on channel ===================== "
}


queryInstalled2() {
    setGlobalsForPeer0org2
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org2 on channel ===================== "
}


queryInstalled3() {
    setGlobalsForPeer0org3
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org3 on channel ===================== "
}

queryInstalled4() {
    setGlobalsForPeer0org4
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org4 on channel ===================== "
}

queryInstalled5() {
    setGlobalsForPeer0org5
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.org5 on channel ===================== "
}

approveForMyOrg0() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls \
        --collections-config $PRIVATE_DATA_CONFIG \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
    echo "===================== chaincode approved from org0 ===================== "
}

checkCommitReadyness() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode checkcommitreadiness \
        --collections-config $PRIVATE_DATA_CONFIG \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} --version ${VERSION} \
        --sequence ${VERSION} --output json 
    echo "===================== checking commit readyness from org0 ===================== "
}

approveForMyOrg1() {
    setGlobalsForPeer0org1
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION}  --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from org1 ===================== "
}



approveForMyOrg2() {
    setGlobalsForPeer0org2
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from org2 ===================== "
}


approveForMyOrg3() {
    setGlobalsForPeer0org3
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from org3 ===================== "
}

approveForMyOrg4() {
    setGlobalsForPeer0org4
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from org4 ===================== "
}

approveForMyOrg5() {
    setGlobalsForPeer0org5
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}

    echo "===================== chaincode approved from org5 ===================== "
}
checkCommitReadyness() {

    setGlobalsForPeer0org0
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME1 \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG0_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json 
    echo "===================== checking commit readyness from orgs ===================== "
}

commitChaincodeDefination() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer1.hiam.hal \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        --channelID $CHANNEL_NAME1 --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG0_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_ORG2_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_ORG5_CA \
        --version ${VERSION} --sequence ${VERSION} 
}

queryCommitted0() {
    setGlobalsForPeer0org0
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}

queryCommitted1() {
    setGlobalsForPeer0org1
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}


queryCommitted2() {
    setGlobalsForPeer0org2
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}


queryCommitted3() {
    setGlobalsForPeer0org3
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}

queryCommitted4() {
    setGlobalsForPeer0org4
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}

queryCommitted5() {
    setGlobalsForPeer0org5
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME1 --name ${CC_NAME}
}


chaincodeInvoke() {
    setGlobalsForPeer0org0
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG0_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_ORG2_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_ORG5_CA \
        -c '{"function": "CreateContract","Args":["{\"prj_id\":\"project11\",\"prj_company\":\"Systaldyn\",\"prj_company_details\":\"Blockchain\",\"prj_description\":\"System Analysis Dynamic\",\"prj_sba_id\":\"SBA139\",\"prj_sba_address\":\"Noida\",\"prj_sba_landmark\":\"63 Metro Station\",\"prj_sba_lat\":36.123456,\"prj_sba_long\":-109.123177,\"prj_sba_details\":\"Details Sys\",\"prj_sba_media_list\":[\"<url=url of uploaded photo>,<type=photo>,<file-hash>\"],\"prj_status\":1,\"asset_services_list\":[\"<PRJ0001A0002>\",\"<PRJ0001A0003>\",\"<PRJ0001A0004>\",\"<PRJ0001S0001>\"],\"prj_nft_id\":\"ERC 3525 NFT ID\",\"prj_valuation\":1230000,\"prj_last_update_dttime\":\"last_update from BC\",\"prj_lastupdate_user\":\"user-id that last updated data\"}"]}'
}


chaincodeQueryGetAssetByID() {
    setGlobalsForPeer0org0
    peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "getAssetByID","Args":["project100"]}'
}



chaincodeQueryGetAllAssets() {
    setGlobalsForPeer0org0
    peer chaincode query -C $CHANNEL_NAME1 -n ${CC_NAME} -c '{"function": "getAllAssets","Args":[]}'
}


chaincodeInvokeUpdateAsset() {
    setGlobalsForPeer0org0
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer1.hiam.hal \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME1 -n ${CC_NAME} \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG0_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG1_CA \
        --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_ORG2_CA \
        --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_ORG3_CA \
        --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_ORG4_CA \
        --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_ORG5_CA \
         -c '{"function": "updateAsset","Args":["project143", "{\"asset_services_list\":[\"<PRJ0001A0005>\",\"<PRJ0001A0003>\",\"<PRJ0001A0004>\",\"<PRJ0001S0001>\"],\"prj_company\":\"UpdatedCompanyXYZ\",\"prj_company_details\":\"UpdatedDetailsXYZ\",\"prj_description\":\"UpdatedDescriptionXYZ\",\"prj_last_update_dttime\":\"new_last_update from BC\",\"prj_lastupdate_user\":\"new_user-id that last updated data\",\"prj_nft_id\":\"UpdatedERC3525NFTID\",\"prj_sba_address\":\"NewAddressXYZ\",\"prj_sba_details\":\"NewSBADetails\",\"prj_sba_id\":\"UpdatedSBA456\",\"prj_sba_landmark\":\"NewLandmarkXYZ\",\"prj_sba_lat\":40.987654,\"prj_sba_long\":-110.987654,\"prj_sba_media_list\":[\"<url=new-url of uploaded photo>,<type=new-photo>,<file-hash=new-file-hash>\"],\"prj_status\":2,\"prj_valuation\":1500000}"]}'
        # -c '{"function": "updateAsset","Args":["project99", "{\"prj_sba_address\":\"Delhi\"}"]}'
}
# chaincodeInvokeUpdateAsset

# packageChaincode
# installChaincode
# queryInstalled0
# queryInstalled1
# queryInstalled2
# queryInstalled3
# queryInstalled4
# approveForMyOrg0
# checkCommitReadyness
# approveForMyOrg1
# approveForMyOrg2
# approveForMyOrg3
# approveForMyOrg4
# approveForMyOrg5
# checkCommitReadyness
# commitChaincodeDefination
# queryCommitted0
# queryCommitted1
# queryCommitted2
# queryCommitted3
# queryCommitted4
# queryCommitted5
chaincodeInvoke
# sleep 3
# chaincodeQueryGetAssetByID
# sleep 3
# chaincodeQueryGetAllAssets
# sleep 3
# chaincodeInvokeUpdateAsset