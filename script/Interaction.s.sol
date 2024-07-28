// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PriceFeed} from "../src/PriceFeed.sol";

contract Interaction is Script {
    PriceFeed priceFeed;
    address dai = 0x57a8f8b6eD04e92f053C19EFbF1ab8C0314Fe7b0;
    address public USDC = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;

    function setUp() public {
        priceFeed = PriceFeed(0x665c8DB8BF8cae9241032A6b52f1ae0F69b832AE);
    }

    function run() public {
        vm.startBroadcast();
        // bytes[] memory priceUpdateArray = new bytes[](1);
        // priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue{value: 20}(
            dai,
            10
            // priceUpdateArray
        );

        console.log("Trying to get value: ", total);
        vm.stopBroadcast();
    }
}
