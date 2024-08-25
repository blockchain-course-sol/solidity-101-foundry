// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../lib/forge-std/src/Script.sol";
import "../src/ERC20TD.sol";
import "../src/Ex01.sol";
import "../src/Ex02.sol";
import "../src/Ex03.sol";

contract DeployEx is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        ERC20TD erc20td = new ERC20TD("TD Token", "TDT", 0); // 1 million tokens with 18 decimals

        Ex01 ex01 = new Ex01(erc20td);
        Ex02 ex02 = new Ex02(erc20td);
        Ex03 ex03 = new Ex03(erc20td);

        address[] memory teachers = new address[](2);
        teachers[0] = address(ex01);
        teachers[1] = address(ex02);
        teachers[2] = address(ex03);
        erc20td.setTeachers(teachers);

        vm.stopBroadcast();

        console.log("Deployer address:", deployerAddress);
        console.log("-----------------");
        console.log("ERC20TD deployed at:", address(erc20td));
        console.log("Ex01 deployed at:", address(ex01));
        console.log("Ex02 deployed at:", address(ex02));
        console.log("Ex03 deployed at:", address(ex03));
        console.log("-----------------");
    }
}
