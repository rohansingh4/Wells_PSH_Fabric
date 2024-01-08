#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local PP1=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s#\${PEERPEM1}#$PP1#" \
        -e "s#\${P0PORT1}#$7#" \
        ./ccp-template.json
}

ORG=1
P0PORT=7051
CAPORT=7054
P0PORT1=8051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/peers/peer0.org0.hiam.hal/msp/tlscacerts/tlsca.org0.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/peers/peer1.org0.hiam.hal/msp/tlscacerts/tlsca.org0.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org0.hiam.hal/msp/tlscacerts/tlsca.org0.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org0.json

ORG=2
P0PORT=9051
CAPORT=8054
P0PORT1=10051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/peers/peer0.org1.hiam.hal/msp/tlscacerts/tlsca.org1.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/peers/peer1.org1.hiam.hal/msp/tlscacerts/tlsca.org1.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.hiam.hal/msp/tlscacerts/tlsca.org1.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org1.json

ORG=3
P0PORT=11051
CAPORT=9054
P0PORT1=12051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/peers/peer0.org2.hiam.hal/msp/tlscacerts/tlsca.org2.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/peers/peer1.org2.hiam.hal/msp/tlscacerts/tlsca.org2.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.hiam.hal/msp/tlscacerts/tlsca.org2.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org2.json

ORG=4
P0PORT=13051
CAPORT=10054
P0PORT1=14051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/peers/peer0.org3.hiam.hal/msp/tlscacerts/tlsca.org3.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/peers/peer1.org3.hiam.hal/msp/tlscacerts/tlsca.org3.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.hiam.hal/msp/tlscacerts/tlsca.org3.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org3.json

ORG=5
P0PORT=15051
CAPORT=11054
P0PORT1=16051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/peers/peer0.org4.hiam.hal/msp/tlscacerts/tlsca.org4.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/peers/peer1.org4.hiam.hal/msp/tlscacerts/tlsca.org4.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org4.hiam.hal/msp/tlscacerts/tlsca.org4.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org4.json

ORG=6
P0PORT=17051
CAPORT=12054
P0PORT1=18051
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/peers/peer0.org5.hiam.hal/msp/tlscacerts/tlsca.org5.hiam.hal-cert.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/peers/peer1.org5.hiam.hal/msp/tlscacerts/tlsca.org5.hiam.hal-cert.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org5.hiam.hal/msp/tlscacerts/tlsca.org5.hiam.hal-cert.pem
echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org5.json

