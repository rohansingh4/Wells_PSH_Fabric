
chmod -R 0755 ./crypto-config
# Delete existing artifacts
rm -rf ./crypto-config
rm genesis.block mychannel.tx
rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/



# System channel
SYS_CHANNEL="sys-channel"

#channel name defaults to "mychannel"
# CHANNEL_NAME="mychannel"

# echo $CHANNEL_NAME

# Generate System Genesis block
configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis.block


# # Generate channel configuration block
# configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./mychannel.tx -channelID $CHANNEL_NAME

# echo "#######    Generating anchor peer update for org0MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org0MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org0MSP

# echo "#######    Generating anchor peer update for org1MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org1MSP

# echo "#######    Generating anchor peer update for org2MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org2MSP

# echo "#######    Generating anchor peer update for org3MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org3MSP

# echo "#######    Generating anchor peer update for org4MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org4MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org4MSP

# echo "#######    Generating anchor peer update for org5MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./org5MSPanchors.tx -channelID $CHANNEL_NAME -asOrg org5MSP


# channel name defaults to "channel1"
CHANNEL_NAME1="channel1"

echo $CHANNEL_NAME1

# # Generate channel configuration block
configtxgen -profile channel1 -configPath . -outputCreateChannelTx ./channel1.tx -channelID $CHANNEL_NAME1

echo "#######    Generating anchor peer update for org0MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org0MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org0MSP

echo "#######    Generating anchor peer update for org1MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org1MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org1MSP

echo "#######    Generating anchor peer update for org2MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org2MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org2MSP

echo "#######    Generating anchor peer update for org3MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org3MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org3MSP

echo "#######    Generating anchor peer update for org4MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org4MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org4MSP

echo "#######    Generating anchor peer update for org5MSP  ##########"
configtxgen -profile channel1 -configPath . -outputAnchorPeersUpdate ./org5MSPanchors_$CHANNEL_NAME1.tx -channelID $CHANNEL_NAME1 -asOrg org5MSP

# channel name defaults to "channel2"
CHANNEL_NAME2="channel2"

echo $CHANNEL_NAME2

# # Generate channel configuration block
configtxgen -profile channel2 -configPath . -outputCreateChannelTx ./channel2.tx -channelID $CHANNEL_NAME2

echo "#######    Generating anchor peer update for org0MSP  ##########"
configtxgen -profile channel2 -configPath . -outputAnchorPeersUpdate ./org0MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg org0MSP

echo "#######    Generating anchor peer update for org2MSP  ##########"
configtxgen -profile channel2 -configPath . -outputAnchorPeersUpdate ./org2MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg org2MSP

echo "#######    Generating anchor peer update for org3MSP  ##########"
configtxgen -profile channel2 -configPath . -outputAnchorPeersUpdate ./org3MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg org3MSP

echo "#######    Generating anchor peer update for org5MSP  ##########"
configtxgen -profile channel2 -configPath . -outputAnchorPeersUpdate ./org5MSPanchors_$CHANNEL_NAME2.tx -channelID $CHANNEL_NAME2 -asOrg org5MSP
