# Solidity-101

## Introduction

Welcome! This is an automated workshop that will on using Solidity Smart contracts. It is aimed at developers who are not familiar with Solidity, or smart contracts.

## How to work on this TD

### Introduction

- network : [Sepolia Testnet](https://chainlist.org/chain/11155111)

The workshop has two components:

- An ERC20 token, ticker `ERC20TD`, that is used to keep track of points
- A set of 13 exercises that are able to mint and distribute ERC20TD points

Your objective is to gather as many ERC20TD points as possible. Please note :

- You will need testnet ETH to do this workshop. Get Sepolia ETH from faucets like [Google Cloud Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia).
- The 'transfer' function of ERC20TD has been disabled to encourage you to finish the TD with only one address

### Getting to work

- There is no instructions for each exercice try to understand read the smart contracts exercise and find the solution, in [/src](/src).
- Each exercice contract inherits from the [ExerciseTemplate](src/ExerciseTemplate.sol), which holds common functions to validate students and credit points
- Each exercice is deployed on the Sepolia testnet (chainID: 11155111). You can interact with them through [Etherscan](https://sepolia.etherscan.io/).
- In order to receive points, you will have to call function that execute code in each smart contract, such that the function `creditStudent(n, msg.sender);` is triggered, and distributes n points.

### Setting up

- Fork this repository.
- Create an env file with `cp .env.example .env` and fill in the variables:
  - _*SEPOLIA_TESTNET_RPC_URL*_: Get from [Alchemy](https://www.alchemy.com/) or [Infura](https://www.infura.io/)
  - _*DEPLOYER*_: Your wallet private key (without 0x prefix)
  - _*ETHERSCAN_API_KEY*_: Get from [Etherscan](https://etherscan.io/myapikey)

## Exercises addresses

| Topic                                      | Contract code                           | Contract on Etherscan                                                                   |
| ------------------------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------- |
| Points counter ERC20                       | [Points counter ERC20](src/ERC20TD.sol) | [link](https://sepolia.etherscan.io/address/0x434C224F509487B2FccA4AF3A4fc62589344a18A) |
| Calling a function                         | [Ex01](src/Ex01.sol)                    | [link](https://sepolia.etherscan.io/address/0x921793f44700bf234B1e1edB65BBe7dBFCF837C0) |
| Payable function                           | [Ex02](src/Ex02.sol)                    | [link](https://sepolia.etherscan.io/address/0x5AAb01aCE065Cf561c2EefDEcD99047071527944) |
| Requires                                   | [Ex03](src/Ex03.sol)                    | [link](https://sepolia.etherscan.io/address/0x6cF06139F46D1903C41dCcDA656BdeF6cc50e354) |
| Storage variables                          | [Ex04](src/Ex04.sol)                    | [link](https://sepolia.etherscan.io/address/0x3FeF8Be8c13A700739A3cfDfbAb64C8Ee4dD75d0) |
| Mappings                                   | [Ex05](src/Ex05.sol)                    | [link](https://sepolia.etherscan.io/address/0xEfADd6C94Ba9b8a60A35b0363BC4f3D8B7397C97) |
| Variable visibility                        | [Ex06](src/Ex06.sol)                    | [link](https://sepolia.etherscan.io/address/0x480F059F7d84dA49C2A423516a5cD80506636f17) |
| Events                                     | [Ex07](src/Ex07.sol)                    | [link](https://sepolia.etherscan.io/address/0xF1f3ceeFCFB14385065405e4999f7aa94eD46BB9) |
| Structures                                 | [Ex08](src/Ex08.sol)                    | [link](https://sepolia.etherscan.io/address/0x1669845805C0B9476481a87f33C619143E759fDb) |
| Code history                               | [Ex09](src/Ex09.sol)                    | [link](https://sepolia.etherscan.io/address/0x776397E0e24E89F31d1E0bb4decee10B827a19a8) |
| Past transactions                          | [Ex10](src/Ex10.sol)                    | [link](https://sepolia.etherscan.io/address/0xFB2324662dB17a72635b8892dfCAfF29bA1a7597) |
| Composability                              | [Ex11](src/Ex11.sol)                    | [link](https://sepolia.etherscan.io/address/0x3c0F46B7D8bf9892372888b81442C1Af88575fCA) |
| Blockchain forensics                       | [Ex12](src/Ex12.sol)                    | [link](https://sepolia.etherscan.io/address/0xABCDbd811c89814D68A1E3307Bb20499bAddfE61) |
| Deploy your contract to validate exercices | [Ex13](src/Ex13.sol)                    | [link](https://sepolia.etherscan.io/address/0xAf66d65cB049a2721B560007E09F253C59C6E3D5) |
