// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {PriceFeed} from "../src/PriceFeed.sol";

contract PriceFeedTest is Test {
    PriceFeed priceFeed;
    address dai = 0x57a8f8b6eD04e92f053C19EFbF1ab8C0314Fe7b0;
    address public USDC = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;
    address public LINK = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;
    address public WBTC = 0x45d341D33624Cc53B1E61f73C076f8A545DA191D;

    function setUp() public {
        vm.startBroadcast();
        priceFeed = PriceFeed(0xb37e1bdaCbaC06C212b4D65Af2b4464DE671c220);
        vm.stopBroadcast();
    }

    function test_getUsdValueDai() public {
        vm.prank(0x380Bff4e8847F9A8F7698569B45EeFb0b41fEd61);
        // bytes[] memory priceUpdateArray = new bytes[](1);
        // priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue(dai, 10);
        console.log("10 DAI = ", total);
        assert(total > 0);
    }

    function test_getUsdValueUSDC() public {
        vm.prank(0x380Bff4e8847F9A8F7698569B45EeFb0b41fEd61);
        bytes[] memory priceUpdateArray = new bytes[](1);
        priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue(
            USDC,
            10
            // priceUpdateArray
        );
        console.log("10 USDC = ", total);
        assert(total > 0);
    }

    function test_getUsdValueWBTC() public {
        vm.prank(0x380Bff4e8847F9A8F7698569B45EeFb0b41fEd61);
        bytes[] memory priceUpdateArray = new bytes[](1);
        priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue(
            WBTC,
            10
            // priceUpdateArray
        );
        console.log("10 WBTC = ", total);
        assert(total > 0);
    }

    function test_getUsdValueLINK() public {
        vm.prank(0x380Bff4e8847F9A8F7698569B45EeFb0b41fEd61);
        bytes[] memory priceUpdateArray = new bytes[](1);
        priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");
        uint256 total = priceFeed.getUsdValue(
            LINK,
            10
            // priceUpdateArray
        );
        console.log("10 LINK = ", total);
        assert(total > 0);
    }
}
