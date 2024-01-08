'use strict';

var { Gateway, Wallets } = require('fabric-network');
const path = require('path');
const FabricCAServices = require('fabric-ca-client');
const fs = require('fs');

const util = require('util');

const getCCP = async (org) => {
    let ccpPath;
    if (org == "org0") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org0.json');
    } 
    else if (org == "org1") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org1.json');
    } 
    else if (org == "org2") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org2.json');
    }
    else if (org == "org3") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org3.json');
    }
    else if (org == "org4") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org4.json');
    }
    else if (org == "org5") {
        ccpPath = path.resolve(__dirname, '..', 'config', 'connection-org5.json');
    }
    else
        return null
    const ccpJSON = fs.readFileSync(ccpPath, 'utf8')
    const ccp = JSON.parse(ccpJSON);
    return ccp
}

const getCaUrl = async (org, ccp) => {
    let caURL;
    if (org == "org0") {
        caURL = ccp.certificateAuthorities['ca.org0.hiam.hal'].url;
    } 
    else if (org == "org1") {
        caURL = ccp.certificateAuthorities['ca.org1.hiam.hal'].url;
    } 
    else if (org == "org2") {
        caURL = ccp.certificateAuthorities['ca.org2.hiam.hal'].url;
    }
    else if (org == "org3") {
        caURL = ccp.certificateAuthorities['ca.org3.hiam.hal'].url;
    }
    else if (org == "org4") {
        caURL = ccp.certificateAuthorities['ca.org4.hiam.hal'].url;
    }
    else if (org == "org5") {
        caURL = ccp.certificateAuthorities['ca.org5.hiam.hal'].url;
    }  
    else
        return null
    return caURL

}

const getWalletPath = async (org) => {
    let walletPath;
    if (org == "org0") {
        walletPath = path.join(process.cwd(), 'org0-wallet');
    } 
    else if (org == "org1") {
        walletPath = path.join(process.cwd(), 'org1-wallet');
    } 
    else if (org == "org2") {
        walletPath = path.join(process.cwd(), 'org2-wallet');
    }
    else if (org == "org3") {
        walletPath = path.join(process.cwd(), 'org3-wallet');
    }
    else if (org == "org4") {
        walletPath = path.join(process.cwd(), 'org4-wallet');
    } 
    else if (org == "org5") {
        walletPath = path.join(process.cwd(), 'org5-wallet');
    }  
    else
        return null
    return walletPath

}


const getAffiliation = async (org) => {
    return org == "Org1" ? 'org1.department1' : 'org2.department1'
}

const getRegisteredUser = async (username, userOrg, isJson) => {
    let ccp = await getCCP(userOrg)

    const caURL = await getCaUrl(userOrg, ccp)
    const ca = new FabricCAServices(caURL);

    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} already exists in the wallet`);
        var response = {
            success: true,
            message: username + ' enrolled Successfully',
        };
        return response
    }

    // Check to see if we've already enrolled the admin user.
    let adminIdentity = await wallet.get('admin');
    if (!adminIdentity) {
        console.log('An identity for the admin user "admin" does not exist in the wallet');
        await enrollAdmin(userOrg, ccp);
        adminIdentity = await wallet.get('admin');
        console.log("Admin Enrolled Successfully")
    }

    // build a user object for authenticating with the CA
    const provider = wallet.getProviderRegistry().getProvider(adminIdentity.type);
    const adminUser = await provider.getUserContext(adminIdentity, 'admin');
    let secret;
    try {
        // Register the user, enroll the user, and import the new identity into the wallet.
        secret = await ca.register({ affiliation: await getAffiliation(userOrg), enrollmentID: username, role: 'client' }, adminUser);
        // const secret = await ca.register({ affiliation: 'org1.department1', enrollmentID: username, role: 'client', attrs: [{ name: 'role', value: 'approver', ecert: true }] }, adminUser);

    } catch (error) {
        return error.message
    }

    const enrollment = await ca.enroll({ enrollmentID: username, enrollmentSecret: secret });
    // const enrollment = await ca.enroll({ enrollmentID: username, enrollmentSecret: secret, attr_reqs: [{ name: 'role', optional: false }] });

    let x509Identity;
    if (userOrg == "org0") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org0MSP',
            type: 'X.509',
        };
    } 
    else if (userOrg == "org1") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org1MSP',
            type: 'X.509',
        };
    } 
    else if (userOrg == "org2") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org2MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "org3") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org3MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "org4") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org4MSP',
            type: 'X.509',
        };
    }
    else if (userOrg == "org5") {
        x509Identity = {
            credentials: {
                certificate: enrollment.certificate,
                privateKey: enrollment.key.toBytes(),
            },
            mspId: 'org5MSP',
            type: 'X.509',
        };
    }
    await wallet.put(username, x509Identity);
    console.log(`Successfully registered and enrolled admin user ${username} and imported it into the wallet`);

    var response = {
        success: true,
        message: username + ' enrolled Successfully',
    };
    return response
}

const isUserRegistered = async (username, userOrg) => {
    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} exists in the wallet`);
        return true
    }
    return false
}


const getCaInfo = async (org, ccp) => {
    let caInfo
    if (org == "org0") {
        caInfo = ccp.certificateAuthorities['ca.org0.hiam.hal'];
    } 
    else if (org == "org1") {
        caInfo = ccp.certificateAuthorities['ca.org1.hiam.hal'];
    } 
    else if (org == "org2") {
        caInfo = ccp.certificateAuthorities['ca.org2.hiam.hal'];
    }
    else if (org == "org3") {
        caInfo = ccp.certificateAuthorities['ca.org3.hiam.hal'];
    }
    else if (org == "org4") {
        caInfo = ccp.certificateAuthorities['ca.org4.hiam.hal'];
    } 
    else if (org == "org5") {
        caInfo = ccp.certificateAuthorities['ca.org5.hiam.hal'];
    } 
    else
        return null
    return caInfo

}

const enrollAdmin = async (org, ccp) => {

    console.log('calling enroll Admin method')

    try {

        const caInfo = await getCaInfo(org, ccp) //ccp.certificateAuthorities['ca.org1.hiam.hal'];
        const caTLSCACerts = caInfo.tlsCACerts.pem;
        const ca = new FabricCAServices(caInfo.url, { trustedRoots: caTLSCACerts, verify: false }, caInfo.caName);

        // Create a new file system based wallet for managing identities.
        const walletPath = await getWalletPath(org) //path.join(process.cwd(), 'wallet');
        const wallet = await Wallets.newFileSystemWallet(walletPath);
        console.log(`Wallet path: ${walletPath}`);

        // Check to see if we've already enrolled the admin user.
        const identity = await wallet.get('admin');
        if (identity) {
            console.log('An identity for the admin user "admin" already exists in the wallet');
            return;
        }

        // Enroll the admin user, and import the new identity into the wallet.
        const enrollment = await ca.enroll({ enrollmentID: 'admin', enrollmentSecret: 'adminpw' });
        let x509Identity;

        if (org == "org0") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org0MSP',
                type: 'X.509',
            };
        } 
        else if (org == "org1") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org1MSP',
                type: 'X.509',
            };
        } 
        else if (org == "org2") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org2MSP',
                type: 'X.509',
            };
        }
        else if (org == "org3") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org3MSP',
                type: 'X.509',
            };
        }
        else if (org == "org4") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org4MSP',
                type: 'X.509',
            };
        }
        else if (org == "org5") {
            x509Identity = {
                credentials: {
                    certificate: enrollment.certificate,
                    privateKey: enrollment.key.toBytes(),
                },
                mspId: 'org5MSP',
                type: 'X.509',
            };
        }
        await wallet.put('admin', x509Identity);
        console.log('Successfully enrolled admin user "admin" and imported it into the wallet');
        return
    } catch (error) {
        console.error(`Failed to enroll admin user "admin": ${error}`);
    }
}

const registerAndGerSecret = async (username, userOrg) => {
    let ccp = await getCCP(userOrg)

    const caURL = await getCaUrl(userOrg, ccp)
    const ca = new FabricCAServices(caURL);

    const walletPath = await getWalletPath(userOrg)
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    console.log(`Wallet path: ${walletPath}`);

    const userIdentity = await wallet.get(username);
    if (userIdentity) {
        console.log(`An identity for the user ${username} already exists in the wallet`);
        var response = {
            success: true,
            message: username + ' enrolled Successfully',
        };
        return response
    }

    // Check to see if we've already enrolled the admin user.
    let adminIdentity = await wallet.get('admin');
    if (!adminIdentity) {
        console.log('An identity for the admin user "admin" does not exist in the wallet');
        await enrollAdmin(userOrg, ccp);
        adminIdentity = await wallet.get('admin');
        console.log("Admin Enrolled Successfully")
    }

    // build a user object for authenticating with the CA
    const provider = wallet.getProviderRegistry().getProvider(adminIdentity.type);
    const adminUser = await provider.getUserContext(adminIdentity, 'admin');
    let secret;
    try {
        // Register the user, enroll the user, and import the new identity into the wallet.
        secret = await ca.register({ affiliation: await getAffiliation(userOrg), enrollmentID: username, role: 'client' }, adminUser);
        // const secret = await ca.register({ affiliation: 'org1.department1', enrollmentID: username, role: 'client', attrs: [{ name: 'role', value: 'approver', ecert: true }] }, adminUser);

    } catch (error) {
        return error.message
    }

    var response = {
        success: true,
        message: username + ' enrolled Successfully',
        secret: secret
    };
    return response

}

exports.getRegisteredUser = getRegisteredUser

module.exports = {
    getCCP: getCCP,
    getWalletPath: getWalletPath,
    getRegisteredUser: getRegisteredUser,
    isUserRegistered: isUserRegistered,
    registerAndGerSecret: registerAndGerSecret

}