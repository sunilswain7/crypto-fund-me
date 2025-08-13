// SPDX License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script{

    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8; // 2000

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed adr
    }

    constructor() {
        if (block.chainid == 11155111) { // Sepolia
            activeNetworkConfig = getSepoliaEthConfig();
        }
        else if (block.chainid == 1) { // Mainnet
            activeNetworkConfig = getMainnetEthConfig();
        }
        else {
            activeNetworkConfig = getOrCreateAnvilConfig(); // Default to Anvil
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory){
        //price feed adr
        NetworkConfig memory sepoliaConifg = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
            });
            return sepoliaConifg;
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory){
        //price feed adr
        NetworkConfig memory mainnetConifg = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
            });
            return mainnetConifg;
    }

    function getOrCreateAnvilConfig() public returns (NetworkConfig memory){
        if (activeNetworkConfig.priceFeed != address(0)){
            return activeNetworkConfig;
        }
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE); // 2000 USD
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfig;
    }
}