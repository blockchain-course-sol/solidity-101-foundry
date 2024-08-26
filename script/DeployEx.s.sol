// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../lib/forge-std/src/Script.sol";
import "../src/ERC20TD.sol";
import "../src/Ex01.sol";
import "../src/Ex02.sol";
import "../src/Ex03.sol";
import "../src/Ex04.sol";
import "../src/Ex05.sol";
import "../src/Ex06.sol";
import "../src/Ex07.sol";
import "../src/Ex08.sol";
import "../src/Ex09.sol";
import "../src/Ex10.sol";

contract DeployEx is Script {
    ERC20TD public erc20td;
    address public erc20tdAddress;
    mapping(string => address) public deployedContracts;
    string[] public deployedExercises;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        erc20tdAddress = address(0x37f853ff379001E426cAa08d14bb467A5e3122F7);

        vm.startBroadcast(deployerPrivateKey);

        deployERC20TD();
        deployExercises();
        setTeachers();

        vm.stopBroadcast();

        logDeployments(deployerAddress);
    }

    function deployERC20TD() internal {
        if (erc20tdAddress == address(0)) {
            erc20td = new ERC20TD("TD Token", "TDT", 0);
            erc20tdAddress = address(erc20td);
            console.log("New ERC20TD deployed at:", erc20tdAddress);
        } else {
            erc20td = ERC20TD(erc20tdAddress);
            console.log("Using existing ERC20TD at:", erc20tdAddress);
        }
    }

    function deployExercises() internal {
        // deployEx01();
        // deployEx02();
        // deployEx03();
        // deployEx04();
        // deployEx05();
        // deployEx06();
        // deployEx07();
        deployEx08();
        deployEx09();
        deployEx10();
    }

    function deployEx01() internal {
        Ex01 ex01 = new Ex01(ERC20TD(erc20tdAddress));
        deployedContracts["Ex01"] = address(ex01);
        deployedExercises.push("Ex01");
    }

    function deployEx02() internal {
        Ex02 ex02 = new Ex02(ERC20TD(erc20tdAddress));
        deployedContracts["Ex02"] = address(ex02);
        deployedExercises.push("Ex02");
    }

    function deployEx03() internal {
        Ex03 ex03 = new Ex03(ERC20TD(erc20tdAddress));
        deployedContracts["Ex03"] = address(ex03);
        deployedExercises.push("Ex03");
    }

    function deployEx04() internal {
        Ex04 ex04 = new Ex04(ERC20TD(erc20tdAddress));
        deployedContracts["Ex04"] = address(ex04);
        deployedExercises.push("Ex04");
    }

    function deployEx05() internal {
        Ex05 ex05 = new Ex05(ERC20TD(erc20tdAddress));
        deployedContracts["Ex05"] = address(ex05);
        deployedExercises.push("Ex05");
    }

    function deployEx06() internal {
        Ex06 ex06 = new Ex06(ERC20TD(erc20tdAddress));
        deployedContracts["Ex06"] = address(ex06);
        deployedExercises.push("Ex06");

        uint[40] memory randomValuesEx06;
        for (uint i = 0; i < 40; i++) {
            randomValuesEx06[i] =
                uint(keccak256(abi.encodePacked(block.timestamp, i, "Ex06"))) %
                1000;
        }
        ex06.setRandomValueStore(randomValuesEx06);
    }

    function deployEx07() internal {
        Ex07 ex07 = new Ex07(ERC20TD(erc20tdAddress));
        deployedContracts["Ex07"] = address(ex07);
        deployedExercises.push("Ex07");

        uint[40] memory randomValuesEx07;
        for (uint i = 0; i < 40; i++) {
            randomValuesEx07[i] =
                uint(keccak256(abi.encodePacked(block.timestamp, i, "Ex07"))) %
                1000;
        }
        ex07.setRandomValueStore(randomValuesEx07);
    }

    function deployEx08() internal {
        Ex08 ex08 = new Ex08(ERC20TD(erc20tdAddress));
        deployedContracts["Ex08"] = address(ex08);
        deployedExercises.push("Ex08");
    }

    function deployEx09() internal {
        Ex09 ex09 = new Ex09(ERC20TD(erc20tdAddress));
        deployedContracts["Ex09"] = address(ex09);
        deployedExercises.push("Ex09");
    }

    function deployEx10() internal {
        Ex10 ex10 = new Ex10(ERC20TD(erc20tdAddress));
        deployedContracts["Ex10"] = address(ex10);
        deployedExercises.push("Ex10");

        uint[40] memory randomValuesEx10;
        for (uint i = 0; i < 40; i++) {
            randomValuesEx10[i] =
                uint(keccak256(abi.encodePacked(block.timestamp, i, "Ex10"))) %
                1000;
        }
        ex10.setRandomValueStore(randomValuesEx10);
    }

    function setTeachers() internal {
        address[] memory teacherAddresses = new address[](
            deployedExercises.length
        );
        for (uint i = 0; i < deployedExercises.length; i++) {
            teacherAddresses[i] = deployedContracts[deployedExercises[i]];
        }
        ERC20TD(erc20tdAddress).setTeachers(teacherAddresses);
    }

    function logDeployments(address deployerAddress) internal view {
        console.log("Deployer address:", deployerAddress);
        console.log("-----------------");
        console.log("ERC20TD address:", erc20tdAddress);

        for (uint i = 0; i < deployedExercises.length; i++) {
            console.log(
                string(abi.encodePacked(deployedExercises[i], " deployed at:")),
                deployedContracts[deployedExercises[i]]
            );
        }
        console.log("-----------------");
    }
}
