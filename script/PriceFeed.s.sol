// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PriceFeed} from "../src/PriceFeed.sol";
import {PeerToken} from "../src/PeerToken.sol";

contract PriceFeedScript is Script {
    bytes32[] priceFeeds;
    address[] tokens;
    bytes32 public DAIUSD =
        bytes32(
            0xb0948a5e5313200c632b51bb5ca32f6de0d36e9950a942d19751e833f70dabfd
        );
    bytes32 public LINKUSD =
        bytes32(
            0x8ac0c70fff57e9aefdf5edf44b51d62c2d433653cbb2cf5cc06bb115af04d221
        );
    bytes32 public WBTCUSD =
        bytes32(
            0xc9d8b075a5c69303365ae23633d4e085199bf5c520a3b90fed1322a0342ffc33
        );
    bytes32 public USDCUSD =
        bytes32(
            0xeaa020c61cc479712813461ce153894a96a6c00b21ed0cfc2798d1f9a9e9c94a
        );
    address public DAI = 0x57a8f8b6eD04e92f053C19EFbF1ab8C0314Fe7b0;
    address public LINK = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;
    address public WBTC = 0x45d341D33624Cc53B1E61f73C076f8A545DA191D;
    address public USDC = 0x1Fb9EEe6DF9cf79968D2b558AeDE454384498e2a;

    function setUp() public {
        priceFeeds.push(DAIUSD);
        priceFeeds.push(LINKUSD);
        priceFeeds.push(WBTCUSD);
        priceFeeds.push(USDCUSD);
        tokens.push(DAI);
        tokens.push(LINK);
        tokens.push(WBTC);
        tokens.push(USDC);
    }

    function run() public {
        vm.startBroadcast();
        PeerToken peer = new PeerToken(msg.sender);
        PriceFeed feed = new PriceFeed(
            0x8D254a21b3C86D32F7179855531CE99164721933,
            priceFeeds,
            tokens
        );

        console.log("Peer Token deployed at address: ", address(peer));
        console.log("PriceFeed deployed at address: ", address(feed));
        vm.stopBroadcast();
    }
}
