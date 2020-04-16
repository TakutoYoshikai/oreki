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
./install-btcd.sh
```

## Quick Start
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
  //increment api point from payment.point and payment.user_id
})
```
start
```
oreki.start()
```
register payment
```
oreki.addPayment(<user_id>, <endpoint_id>, <point>, <bitcoin amount>).then(function(payment) {
  //payment.address: bitcoin address
})
//oreki.addPayment("user_id", "endpoint_id", 100, 1000)

```

## License
MIT License
