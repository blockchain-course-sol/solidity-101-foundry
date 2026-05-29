// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../lib/forge-std/src/Script.sol";
import "../src/ERC20TD.sol";
import "../src/Ex11.sol";
import "../src/Ex11b.sol";

// Redeploys only Ex11b + Ex11 against the EXISTING ERC20TD, then grants
// both the TEACHER_ROLE. Much cheaper than the full DeployEx suite.
// Ex11 stores ex11bAddress as immutable, so a new Ex11b requires a new Ex11.
contract DeployEx11 is Script {
    address public constant ERC20TD_ADDRESS =
        0x434C224F509487B2FccA4AF3A4fc62589344a18A;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER");
        address deployerAddress = vm.addr(deployerPrivateKey);

        console.log("Deployer address:", deployerAddress);
        console.log(
            string.concat(
                "Deployer balance (ETH): ",
                vm.toString(deployerAddress.balance)
            )
        );

        vm.startBroadcast(deployerPrivateKey);

        Ex11b ex11b = new Ex11b(ERC20TD(ERC20TD_ADDRESS));
        Ex11 ex11 = new Ex11(ERC20TD(ERC20TD_ADDRESS), address(ex11b));

        address[] memory teacherAddresses = new address[](2);
        teacherAddresses[0] = address(ex11b);
        teacherAddresses[1] = address(ex11);
        ERC20TD(ERC20TD_ADDRESS).setTeachers(teacherAddresses);

        vm.stopBroadcast();

        console.log("-----------------");
        console.log("ERC20TD address:", ERC20TD_ADDRESS);
        console.log("Ex11b deployed at:", address(ex11b));
        console.log("Ex11 deployed at:", address(ex11));
        console.log("-----------------");
    }
}
