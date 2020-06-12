## Prepare Ethereum

**1. create ethereum directory**
```bash
mkdir ethereum
```

**2. create a shell script for starting geth**
```bash
vim start-geth.sh
chmod +x start-geth.sh
```

this is an example of start-geth.sh on testnet (for test)
```bash
#!/bin/bash
geth --testnet --ws --wsaddr=127.0.0.1 --wsport 8546 --datadir /path/to/ethereum/ --wsapi web3,eth,net,personal --rpcapi personal,net,eth,web3 --allow-insecure-unlock --syncmode fast
```

this is an example of start-geth.sh on mainnet (for production)
```bash
#!/bin/bash
geth --ws --wsaddr=127.0.0.1 --wsport 8546 --datadir /path/to/ethereum/ --wsapi web3,eth,net,personal --rpcapi personal,net,eth,web3 --allow-insecure-unlock --syncmode fast
```

## Start Ethereum
First start of geth have to wait sync of blockchain.
You can know blockchain sync finished by checking log and comparing to [latest block number](https://etherscan.io/blocks)
```bash
./start-geth.sh
```
## Start Ethereum in background
```bash
nohup ./start-geth.sh &
```

## When you want to stop Ethereum in background
Find process pid and kill it.
example
```
ps aux | grep geth
kill -INT <pid>
```
