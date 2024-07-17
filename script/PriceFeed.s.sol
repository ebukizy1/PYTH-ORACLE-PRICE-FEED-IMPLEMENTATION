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
            0x87a67534df591d2dd5ec577ab3c75668a8e3d35e92e27bf29d9e2e52df8de412
        );
    bytes32 public LINKUSD =
        bytes32(
            0x83be4ed61dd8a3518d198098ce37240c494710a7b9d85e35d9fceac21df08994
        );
    bytes32 public WBTCUSD =
        bytes32(
            0xea0459ab2954676022baaceadb472c1acc97888062864aa23e9771bae3ff36ed
        );
    bytes32 public USDCUSD =
        bytes32(
            0x41f3625971ca2ed2263e78573fe5ce23e13d2558ed3f2e47ab0f84fb9e7ae722
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
            0xA2aa501b19aff244D90cc15a4Cf739D2725B5729,
            priceFeeds,
            tokens
        );

        console.log("Peer Token deployed at address: ", address(peer));
        console.log("PriceFeed deployed at address: ", address(feed));
        vm.stopBroadcast();
    }
}
