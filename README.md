# Solidity-101

## Introduction

Welcome! This is an automated workshop that will on using Solidity Smart contracts. It is aimed at developers who are not familiar with Solidity, or smart contracts.

## How to work on this TD

### Introduction

- network : [BNB Smart chain Testnet](https://chainlist.org/chain/97)

The workshop has two components:

- An ERC20 token, ticker `ERC20TD`, that is used to keep track of points
- A set of 13 exercises that are able to mint and distribute ERC20TD points

Your objective is to gather as many ERC20TD points as possible. Please note :

- You will need testnet Bnb to do this workshop. Lookup "Bnb testnet faucet" on google or section #testnet-faucet in [BNB Chain discord](https://discord.com/invite/bnbchain).
- The 'transfer' function of ERC20TD has been disabled to encourage you to finish the TD with only one address

### Getting to work

- There is no instructions for each exercice try to understand read the smart contracts exercise and find the solution, in [/src](/src).
- Each exercice contract inherits from the [ExerciseTemplate](src/ExerciseTemplate.sol), which holds common functions to validate students and credit points
- Each exercice is deployed on the Bnb testnet (chainID: 97). You can interact with them through [scan](https://testnet.bscscan.com/).
- In order to receive points, you will have to call function that execute code in each smart contract, such that the function `creditStudent(n, msg.sender);` is triggered, and distributes n points.

### Setting up

- Fork this repository.
- Create an env file with `cp .env.copy .env` and fill in the variables _*BSC_TESTNET_RPC_URL*_ and _*PRIVATE_KEY*_.

## Exercises addresses

| Topic                                      | Contract code                           | Contract on Etherscan                                                                  |
| ------------------------------------------ | --------------------------------------- | -------------------------------------------------------------------------------------- |
| Points counter ERC20                       | [Points counter ERC20](src/ERC20TD.sol) | [Link](https://testnet.bscscan.com/address/0x5AAb01aCE065Cf561c2EefDEcD99047071527944) |
| Calling a function                         | [Ex01](src/Ex01.sol)                    | [Link](https://testnet.bscscan.com/address/0x6cF06139F46D1903C41dCcDA656BdeF6cc50e354) |
| Payable function                           | [Ex02](src/Ex02.sol)                    | [Link](https://testnet.bscscan.com/address/0x3FeF8Be8c13A700739A3cfDfbAb64C8Ee4dD75d0) |
| Requires                                   | [Ex03](src/Ex03.sol)                    | [Link](https://testnet.bscscan.com/address/0xEfADd6C94Ba9b8a60A35b0363BC4f3D8B7397C97) |
| Storage variables                          | [Ex04](src/Ex04.sol)                    | [Link](https://testnet.bscscan.com/address/0x480F059F7d84dA49C2A423516a5cD80506636f17) |
| Mappings                                   | [Ex05](src/Ex05.sol)                    | [Link](https://testnet.bscscan.com/address/0x2775A1aC2715708A20185aA530639C1EfD6F60ef) |
| Variable visibility                        | [Ex06](src/Ex06.sol)                    | [Link](https://testnet.bscscan.com/address/0xF1f3ceeFCFB14385065405e4999f7aa94eD46BB9) |
| Events                                     | [Ex07](src/Ex07.sol)                    | [Link](https://testnet.bscscan.com/address/0x1669845805C0B9476481a87f33C619143E759fDb) |
| Structures                                 | [Ex08](src/Ex08.sol)                    | [Link](https://testnet.bscscan.com/address/0xFB2324662dB17a72635b8892dfCAfF29bA1a7597) |
| Code history                               | [Ex09](src/Ex09.sol)                    | [Link](https://testnet.bscscan.com/address/0xCc74d67b48C50e99d209c26ce97C7ddA410Ef280) |
| Past transactions                          | [Ex10](src/Ex10.sol)                    | [Link](https://testnet.bscscan.com/address/0x9DCA882bdf76C9Ad4a690763B22332cca36a14Af) |
| Composability                              | [Ex11](src/Ex11.sol)                    | [Link](https://testnet.bscscan.com/address/0xAf66d65cB049a2721B560007E09F253C59C6E3D5) |
| Blockchain forensics                       | [Ex12](src/Ex12.sol)                    | [Link](https://testnet.bscscan.com/address/0x4359B3fcc725094543C6a1b12795EC0D5E6B11E6) |
| Deploy your contract to validate exercices | [Ex13](src/Ex13.sol)                    | [Link](https://testnet.bscscan.com/address/0xDD3260B8e8EFB07087fD78BFcFbfEbF8f8974C6d) |
