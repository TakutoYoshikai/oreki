If you use neutrino mode of LND, You don't have to build bitcoin node.

## Setup LND
1. create lnd directory
```
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

2. create a shell script for starting lnd
```
vim start-lnd.sh
chmod +x start-lnd.sh
```

this is an example of start-lnd.sh on testnet in neutrino mode(for test)
```
lnd --bitcoin.active --bitcoin.testnet --debuglevel=debug --bitcoin.node=neutrino --neutrino.connect=faucet.lightning.community --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

this is an example of start-lnd.sh on mainnet in neutrino mode(for production)
```
lnd --bitcoin.active --bitcoin.mainnet --debuglevel=debug --bitcoin.node=neutrino --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

3. register alias of lncli in .bash_profile

* for test
```
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/testnet/admin.macaroon"
```

* for production
```
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/mainnet/admin.macaroon"
```

## Start LND
```
./start-lnd.sh
```

## Start LND in background
```
nohup ./start-lnd.sh &
```

### Stop LND process in background
```
mylncli stop
```

### Create your Lightning Network Wallet
```
mylncli create
```
