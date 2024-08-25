pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "../src/ERC20TD.sol";

contract DeployERC20TD is Script {
    function run() external {
        string memory privateKeyString = vm.envString("PRIVATE_KEY");
        uint256 deployerPrivateKey = vm.parseUint(privateKeyString);

        vm.startBroadcast(deployerPrivateKey);

        ERC20TD token = new ERC20TD("ERC20 TD Token", "TD", 1000000 * 10 ** 18);

        vm.stopBroadcast();

        console.log("ERC20TD deployed at:", address(token));
    }
}
