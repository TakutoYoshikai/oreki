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
geth --ropsten --datadir /path/to/ethereum/ --syncmode fast --ws --ws.addr=127.0.0.1 --ws.port 8546 --ws.api web3,eth,net,personal --http.api personal,net,eth,web3 --allow-insecure-unlock
```

this is an example of start-geth.sh on mainnet (for production)
```bash
#!/bin/bash
geth --ws --ws.addr=127.0.0.1 --ws.port 8546 --ws.api web3,eth,net,personal --datadir /path/to/ethereum/ --http.api personal,net,eth,web3 --allow-insecure-unlock --syncmode fast
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

## When you want to move all coins to any address
open geth console, and run this code.
```
function moveCoin(to, password) {
	for (var i = 0; i < eth.accounts.length; i++) {
		var from = eth.accounts[i];
		personal.unlockAccount(from, password);
		eth.sendTransaction({
			from:from,
      to:to,
			value:eth.getBalance(from)-21000*eth.gasPrice-1,
			gas:21000,
			gasPrice:eth.gasPrice
		});
		
	}
}
moveCoin("<destination address>", "<password>");
```
