# Solidity-101

## Introduction

Welcome! This is an automated workshop that will on using Solidity Smart contracts. It is aimed at developers who are not familiar with Solidity, or smart contracts.

## How to work on this TD

### Introduction

The workshop has two components:

- An ERC20 token, ticker `ERC20TD`, that is used to keep track of points
- A set of 13 exercises that are able to mint and distribute ERC20TD points

Your objective is to gather as many ERC20TD points as possible. Please note :

- You will need testnet Bnb to do this workshop. Lookup "Bnb testnet faucet" on google.
- The 'transfer' function of ERC20TD has been disabled to encourage you to finish the TD with only one address

### Getting to work

- There is no instructions for each exercice try to understand read the smart contracts exercise and find the solution, in [/src](/src).
- Each exercice contract inherits from the [ExerciseTemplate](src/ExerciseTemplate.sol), which holds common functions to validate students and credit points
- Each exercice is deployed on the Bnb testnet (chainID: 97). You can interact with them through [scan](https://testnet.bscscan.com/).
- In order to receive points, you will have to call function that execute code in each smart contract, such that the function `creditStudent(n, msg.sender);` is triggered, and distributes n points.

## Exercises addresses

| Topic                                      | Contract code                           | Contract on Etherscan                                                                  |
| ------------------------------------------ | --------------------------------------- | -------------------------------------------------------------------------------------- |
| Points counter ERC20                       | [Points counter ERC20](srx/ERC20TD.sol) | [Link](https://testnet.bscscan.com/address/0x52ce45fb9603B2AA6af0E456ee38130B2c1A35F7) |
| Calling a function                         | [Ex01](srx/Ex01.sol)                    | [Link](https://testnet.bscscan.com/address/0x9166BD9dc4F22745A3C4e54760059C4AF22198E6) |
| Payable function                           | [Ex02](srx/Ex02.sol)                    | [Link](https://testnet.bscscan.com/address/0x2caaA6e42778cA5886AD4a630675dF5C851c5FC3) |
| Requires                                   | [Ex03](srx/Ex03.sol)                    | [Link](https://testnet.bscscan.com/address/0x8D2429da7817c44759D35C51E25814cdaa020C9c) |
| Storage variables                          | [Ex04](srx/Ex04.sol)                    | [Link](https://testnet.bscscan.com/address/0xF5813c0BA3a78Af913b1831E5EBdb16eaC7e8824) |
| Mappings                                   | [Ex05](srx/Ex05.sol)                    | [Link](https://testnet.bscscan.com/address/0xf2531A7861Dc74235Ca6646B5843Ec80B3C9B8FF) |
| Variable visibility                        | [Ex06](srx/Ex06.sol)                    | [Link](https://testnet.bscscan.com/address/0x4d6d12Ca157146b99aF19c0Bd093e925247c5859) |
| Events                                     | [Ex07](srx/Ex07.sol)                    | [Link](https://testnet.bscscan.com/address/0x8A7DF2641b7Fe88E767B5e7AEFc4ed5914DC2069) |
| Structures                                 | [Ex08](srx/Ex08.sol)                    | [Link](https://testnet.bscscan.com/address/0x3b968D46035feA417f2a25A5A478c7b9cb6B7D0A) |
| Code history                               | [Ex09](srx/Ex09.sol)                    | [Link](https://testnet.bscscan.com/address/0x8eADA924E6048913A0a977236265b4bE90f4B0Ef) |
| Past transactions                          | [Ex10](srx/Ex10.sol)                    | [Link](https://testnet.bscscan.com/address/0x44fc9d8FC0104e52f2FfF211c331996E4998C3Ec) |
| Composability                              | [Ex11](srx/Ex11.sol)                    | [Link](https://testnet.bscscan.com/address/0xAa13Edb5b4fE957f804c72e9c49D11849aC911Ed) |
| Blockchain forensics                       | [Ex12](srx/Ex12.sol)                    | Undisclosed                                                                            |
| Deploy your contract to validate exercices | [Ex13](srx/Ex13.sol)                    | [Link](https://testnet.bscscan.com/address/0x5074DD0dc5dc66Ffafd0B3EF96fE3CC29dB94D52) |
