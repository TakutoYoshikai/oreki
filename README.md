# oreki
original endpoint sales kit

oreki is a package for sale API that you developed. You can choose bitcoin or ethereum.

## 🌴 Prerequisites

|||
|:----|:----|
| OS  | Amazon Linux2 |
| Storage | about 500GB|

## 🚀 Installation

```bash
cd /path/to/oreki

cd install-script
./install-yum.sh
./install-golang.sh
# set up GOPATH and golang etc
./install-glide.sh
./install-lnd.sh
# install btcd or bitcoind(optional)
# ./install-btcd.sh
# ./install-bitcoind.sh
# install geth for using ethereum(optional)
# ./install-geth.sh
```


## ✅ To check

### 1. bitcoin or ethereum
If you want to use ethereum, read [here](https://github.com/gaiax/oreki/blob/master/docs/ethereum.md)

### 2. btcd or bitcoind or neutrino(case of bitcoin)
If you want to build bitcoin fullnode, use **btcd**, and read [here](https://github.com/gaiax/oreki/blob/master/docs/btcd.md).

If you want to use **bitcoind**, read [here](https://github.com/gaiax/oreki/blob/master/docs/bitcoind.md).

If you don't want to build bitcoin node, use **neutrino mode of lnd**, and read [here](https://github.com/gaiax/oreki/blob/master/docs/neutrino.md).
This solution is to trust other server. It's easy, but you don't get real benefit of blockchain.


# 🚀 Quick Start

### create your LND Wallet

check [here](#To-check)

### prepare to use oreki

**1. install oreki-node to your project**

```bash
npm install oreki-node
```

**2. copy [rpc.proto](https://github.com/gaiax/oreki/blob/master/rpc.proto) from this repository to your project**

**3. make "config.json" from [example(bitcoin)](https://github.com/gaiax/oreki/blob/master/example/config.json) or [example(ethereum)](https://github.com/gaiax/oreki/blob/master/example/ethereum-config.json)**

**4. import oreki module**

**5. initialize oreki object and call init function**

**6. set event handler that notices payment**

**7. register payment reservation**

**8. call start function to check transactions**

## When move coin from LND to your bitcoin wallet

```bash
mylncli unlock
mylncli sendcoins --addr <your bitcoin address> --amt <amount satoshi> --conf_target 19
```

## 📚 Documentation

### import

```javascript
const Oreki = require("oreki-node").Oreki
```

### initialize

```javascript
const oreki = new Oreki("config file path")
oreki.init().then(function(success) {
  if (!success) {
    //It failed
  }
})
```

### add payment event

```javascript
oreki.on("paid", function(payment) {
  //increment api point from payment.point and payment.user_id and payment.endpoint_id
})
```

### start

```javascript
oreki.start()
```

### register payment reservation

```javascript
oreki.addPayment(<user_id: string>, <endpoint_id: string>, <point: int>, <bitcoin amount: int>).then(function(payment) {
  //payment.address: bitcoin address
})
//oreki.addPayment("user_id", "endpoint_id", 100, 1000)
```

## ✅ How to test

1. Create 2 processes of lnd(as Alice and Bob)
2. Set password "HelloWorld" to Alice and Bob
3. Get coins with 2 accounts by testnet faucet more than 10000
4. Run "npm test"

## 🔧 Contribution

1. Fork oreki-node
2. Create your feature branch (git checkout -b my-new-feature)
3. Implement it and check it runs(npm test)
4. Commit your changes (git commit -am 'Add some feature')
5. Push to the branch (git push origin my-new-feature)
6. Create new Pull Request

## 📔 License

MIT License
