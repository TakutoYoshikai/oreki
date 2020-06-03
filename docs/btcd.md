## Prepare btcd

1. create btcd directory
```
mkdir btcd
```

## Make startup script of btcd
```
vim start-btcd.sh
chmod +x start-btcd.sh
```

this is an example of start-btcd.sh on testnet(for test)
```
btcd --testnet --txindex --rpcuser=alice --rpcpass=alice01 --datadir=/mnt/storage/btcd-data/data
```

## Start btcd
```
./start-btcd.sh
```

## Start btcd in background
```
nohup ./start-btcd.sh &
```
