## PYTH ORACLE PRICE FEED

- **testnet-coredoa**: https://rpc.test.btcs.network

## PYTH DOCUMENTATION

**PYTH DOCS**:https://docs.pyth.network/price-feeds/use-real-time-data/evm

## Setting Up and Deploying

```sh
# To build the project and install missing dependency
forge build
# Add RPC
export RPC_URL=https://rpc.test.btcs.network
# ADD PrivateKey
export PRIVATE_KEY=YOUR_PRIVATE_KEY
# To deploy the project
forge script script/PriceFeed.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --legacy
```

## Testing And Interacting With Contract
```sh
#To get pythUpdateData bytes
node getPriceUpdate.js
#Add PRICE_UPDATE bytes to env
export PRICE_UPDATE="0x`cat price_update.txt`"
# Then you can run any of the following
forge test --rpc-url https://rpc.test.btcs.network  -vvvvvv
#or
forge script script/Interaction.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --legacy
```

## Deployed Addresses

- _Peer Token `0x8947D467Cd82AdC456C06027C4bD6f78eC3162cA`_
- _Price Feed `0x665c8DB8BF8cae9241032A6b52f1ae0F69b832AE`_

New Addresses
- _Peer Token `0x8947D467Cd82AdC456C06027C4bD6f78eC3162cA`_
- _Price Feed `0x665c8DB8BF8cae9241032A6b52f1ae0F69b832AE`_
