## Prepare Ethereum

**1. create ethereum directory**
```
mkdir ethereum
```

**2. create a shell script for starting geth**
```
vim start-geth.sh
chmod +x start-geth.sh
```

this is an example of start-geth.sh on testnet (for test)
```
#!/bin/bash
eth --testnet --ws --wsaddr=127.0.0.1 --wsport 8546 --datadir /path/to/ethereum/ --wsapi web3,eth,net,personal --rpcapi personal,net,eth,web3 --allow-insecure-unlock
```
