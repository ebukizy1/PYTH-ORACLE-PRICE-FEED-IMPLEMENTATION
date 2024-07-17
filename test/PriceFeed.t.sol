// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {PriceFeed} from "../src/PriceFeed.sol";

contract PriceFeedTest is Test {
    PriceFeed public priceFeed =
        PriceFeed(0x4417E9B86Be5d09331eF8B5a98Af4589228F476E);
    address dai = 0x57a8f8b6eD04e92f053C19EFbF1ab8C0314Fe7b0;
    address public USDC = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;

    function test_getUsdValue() public {
        uint256 total = priceFeed.getUsdValue(USDC, 10000000000000000000000000);
        console.log(total);
        assert(total > 0);
    }
}
