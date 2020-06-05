If you use neutrino mode of LND, You don't have to build bitcoin node.

## Setup LND
1. create lnd directory
```bash
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

2. create a shell script for starting lnd
```bash
vim start-lnd.sh
chmod +x start-lnd.sh
```

this is an example of start-lnd.sh on testnet in neutrino mode(for test)
```bash
lnd --bitcoin.active --bitcoin.testnet --debuglevel=debug --bitcoin.node=neutrino --neutrino.connect=faucet.lightning.community --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

this is an example of start-lnd.sh on mainnet in neutrino mode(for production)
```bash
lnd --bitcoin.active --bitcoin.mainnet --debuglevel=debug --bitcoin.node=neutrino --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

3. register alias of lncli in .bash_profile

* for test
```bash
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/testnet/admin.macaroon"
```

* for production
```bash
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/mainnet/admin.macaroon"
```

## Start LND
```bash
./start-lnd.sh
```

## Start LND in background
```bash
nohup ./start-lnd.sh &
```

### Stop LND process in background
```bash
mylncli stop
```

### Create your Lightning Network Wallet
```bash
mylncli create
```

### When move coin from LND to your bitcoin wallet
```bash
mylncli unlock
mylncli sendcoins --addr <your bitcoin address> --amt <amount satoshi> --conf_target 19
```
