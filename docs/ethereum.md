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

**3. open 30303 port to the world**

## Start Ethereum
```bash
./start-geth.sh
```
## Start Ethereum in background
```bash
nohup ./start-geth.sh &
```

## When you check geth syncing
open console of geth
```bash
cd /path/to/ethereum
geth attach geth.ipc
```
enter this on the console
```
eth.syncing
```
if this response is false, sync is completed.
## When you want to stop Ethereum in background
Find process pid and kill it.
example
```
ps aux | grep geth
kill -INT <pid>
```
