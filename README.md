# oreki

original endpoint sales kit

## Prerequisites
OS: Amazon Linux2
Storage: about 500GB

## Installation
```
cd /path/to/oreki

cd install-script
./install-yum.sh
./install-golang.sh
#set up GOPATH and golang etc
./install-glide.sh
./install-lnd.sh
#install btcd or bitcoind
#./install-btcd.sh
#./install-bitcoind.sh
```
# Quick Start
activate bitcoind or btcd and run it
### set up bitcoind or btcd
#### bitcoind
1. create bitcoin directory and config file
```
mkdir bitcoin
cd bitcoin
vim bitcoin.conf
```

this is an example of bitcoin.conf on mainnet
```
rest=1
server=1
txindex=1
rpcuser=alice
rpcpassword=alicepassword
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```
this is an example of bitcoin.conf on testnet
```
testnet=3
rest=1
server=1
txindex=1
rpcuser=alice
rpcpassword=alicepassword
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```

2. run bitcoind
```
bitcoind -datadir=/path/to/bitcoin -daemon
```

### set up lnd, and run it
1. create lnd directory
```
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

2. create a shell script for running lnd
```
vim run-lnd.sh
chmod +x run-lnd.sh
```
this is an example of run-lnd.sh on mainnet with bitcoind

```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.mainnet
```

this is an example of run-lnd.sh on mainnet with btcd
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.testnet
```

this is an example of run-lnd.sh on testnet with bitcoind
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.testnet --bitcoin.active
```

this is an example of run-lnd.sh on testnet with btcd
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=btcd --bitcoin.active --btcd.rpcuser=alice --btcd.rpcpass=alicepassword --bitcoin.testnet
```

3. run run-lnd.sh using nohup
```
nohup ./run-lnd.sh &
```

### prepare to use oreki
1. download rpc.proto
```
curl -o rpc.proto -s https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/rpc.proto 
```
2. make config.json from example

3. import oreki module

4. initialize oreki object and call init function

5. set event handler that notices payment

6. register payment reservation

7. call start function to check transactions

## Documentation
### import
```
const Oreki = require("oreki-node").Oreki
```
### initialize
```
const oreki = new Oreki("config file path")
oreki.init().then(function(success) {
  if (!success) {
    //It failed
  }
})
```

### add payment event
```
oreki.on("paid", function(payment) {
  //increment api point from payment.point and payment.user_id and payment.endpoint_id
})
```
### start
```
oreki.start()
```
### register payment reservation
```
oreki.addPayment(<user_id: string>, <endpoint_id: string>, <point: int>, <bitcoin amount: int>).then(function(payment) {
  //payment.address: bitcoin address
})
//oreki.addPayment("user_id", "endpoint_id", 100, 1000)

```
## How to test
1. Create 2 processes of lnd(as Alice and Bob)
2. Set password "HelloWorld" to Alice and Bob
3. Get coins with 2 accounts by testnet faucet more than 10000
4. Run "npm test"

## Contribution
1. Fork oreki-node
2. Create your feature branch (git checkout -b my-new-feature)
3. Implement it and check it runs(npm test)
4. Commit your changes (git commit -am 'Add some feature')
5. Push to the branch (git push origin my-new-feature)
6. Create new Pull Request

## License
MIT License
