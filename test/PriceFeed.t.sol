// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {PriceFeed} from "../src/PriceFeed.sol";

contract PriceFeedTest is Test {
    PriceFeed priceFeed;
    address dai = 0x57a8f8b6eD04e92f053C19EFbF1ab8C0314Fe7b0;
    address public USDC = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;

    function setUp() public {
        vm.startBroadcast();
        priceFeed = PriceFeed(0x665c8DB8BF8cae9241032A6b52f1ae0F69b832AE);
        vm.stopBroadcast();
    }

    function test_getUsdValue() public {
        vm.prank(0x380Bff4e8847F9A8F7698569B45EeFb0b41fEd61);
        bytes[] memory priceUpdateArray = new bytes[](1);
        priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue{value: 6}(
            USDC,
            10000000000000000000000000,
            priceUpdateArray
        );
        console.log(total);
        assert(total > 0);
    }
}
