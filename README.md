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

## Quick Start
download rpc.proto
```
curl -o rpc.proto -s https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/rpc.proto 
```
import
```
const Oreki = require("oreki-node").Oreki
```
initialize
```
const oreki = new Oreki("config file path")
oreki.init().then(function(success) {
  if (!success) {
    //It failed
  }
})
```

add payment event
```
oreki.on("paid", function(payment) {
  //increment api point from payment.point and payment.user_id and payment.endpoint_id
})
```
start
```
oreki.start()
```
register payment
```
oreki.addPayment(<user_id: string>, <endpoint_id: string>, <point: int>, <bitcoin amount: int>).then(function(payment) {
  //payment.address: bitcoin address
})
//oreki.addPayment("user_id", "endpoint_id", 100, 1000)

```

## License
MIT License
