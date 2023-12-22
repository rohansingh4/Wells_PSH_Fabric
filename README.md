# Wells_PSH_Fabric


Project Name: wells_psh
# org0 = Wells PSH Company 
# org1 = Investor Company
# org2 = Asset/Service Owner (SC Partners)
# org3 = PSH Electric Customer 
# org4 = Banks/Payment Company (Token to $$ )
# org5 = Auditor/Regulator (CO2 )
# 
# Channel 1 : org0,org1,org2,org3,org4,org5
# Channel 2 : org0,or2,org3,org5

fabric:
  cas:
  - "ca1.org0.hiam.hal"
  - "ca1.org1.hiam.hal"
  - "ca1.org2.hiam.hal"
  - "ca1.org3.hiam.hal"
  - "ca1.org4.hiam.hal"
  - "ca1.org5.hiam.hal"
  peers:
  - "peer1.org0.hiam.hal"
  - "peer2.org0.hiam.hal"
  - "peer1.org1.hiam.hal"
  - "peer2.org1.hiam.hal"
  - "peer1.org2.hiam.hal"
  - "peer2.org2.hiam.hal"
  - "peer1.org3.hiam.hal"
  - "peer2.org3.hiam.hal"
  - "peer1.org4.hiam.hal"
  - "peer2.org4.hiam.hal"
  - "peer1.org5.hiam.hal"
  - "peer2.org5.hiam.hal"
  orderers:
  - "orderer1.hiam.hal"
  - "orderer2.hiam.hal"
  - "orderer3.hiam.hal"
  settings:
    ca:
      FABRIC_LOGGING_SPEC: DEBUG
    peer:
      FABRIC_LOGGING_SPEC: DEBUG
    orderer:
      FABRIC_LOGGING_SPEC: DEBUG


1. cryto-config.yaml
2. configtx.yaml
3. create-artifacts.sh
4. docker-compose.yaml
5. createChannel.sh

