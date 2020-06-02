# oreki

original endpoint sales kit

## Prerequisites
OS: Amazon Linux2
Storage: about 500GB

## To check
### 1. bitcoin or ethereum
If you want to use ethereum, read [here](https://github.com/gaiax/oreki/blob/master/docs/ethereum.md)
### 2. btcd or bitcoind or neutrino(case of bitcoin)
If you want to build bitcoin fullnode, use **btcd**, and read [here](https://github.com/gaiax/oreki/blob/master/docs/btcd.md).

If you want to save storage, use **bitcoind**, and read [here](https://github.com/gaiax/oreki/blob/master/docs/bitcoind.md).

If you don't want to build bitcoin node, use **neutrino mode of lnd**, and read [here](https://github.com/gaiax/oreki/blob/master/docs/neutrino.md).
This solution is to trust other server. It's easy, but you don't get real benefit of blockchain.


## Installation
```
cd /path/to/oreki

cd install-script
./install-yum.sh
./install-golang.sh
#set up GOPATH and golang etc
./install-glide.sh
./install-lnd.sh
#install btcd or bitcoind(optional)
#./install-btcd.sh
#./install-bitcoind.sh
#install geth for using ethereum(optional)
#./install-geth.sh
```
# Quick Start

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


this is an example of run-lnd.sh on mainnet with btcd
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.testnet
```

this is an example of run-lnd.sh on mainnet in neutrino mode
```
lnd --bitcoin.active --bitcoin.mainnet --debuglevel=debug --bitcoin.node=neutrino --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

this is an example of run-lnd.sh on testnet with btcd
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=btcd --bitcoin.active --btcd.rpcuser=alice --btcd.rpcpass=alicepassword --bitcoin.testnet
```

this is an example of run-lnd.sh on testnet in neutrino mode
```
lnd --bitcoin.active --bitcoin.testnet --debuglevel=debug --bitcoin.node=neutrino --neutrino.connect=faucet.lightning.community --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data
```

3. run run-lnd.sh using nohup
```
nohup ./run-lnd.sh &
```

### prepare to use oreki
1. copy rpc.proto from this repository to your project

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
