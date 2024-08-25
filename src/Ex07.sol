// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex07 is ExerciseTemplate {
    mapping(address => uint) private privateValues;
    mapping(address => bool) public exerciseWasStarted;
    uint[40] private randomValuesStore;
    uint public nextValueStoreRank;

    event ShowPrivateVariableInEvent(uint myVariable);

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function setRandomValueStore(
        uint[40] memory _randomValuesStore
    ) public onlyTeachers {
        randomValuesStore = _randomValuesStore;
        nextValueStoreRank = 0;
    }

    function assignRank() public {
        privateValues[msg.sender] = randomValuesStore[nextValueStoreRank];
        nextValueStoreRank =
            (nextValueStoreRank + 1) %
            randomValuesStore.length;
        exerciseWasStarted[msg.sender] = true;
    }

    function fireEvent() public {
        emit ShowPrivateVariableInEvent(privateValues[msg.sender] + 32);
    }

    function showYouKnowPrivateValue(uint _privateValue) public {
        require(
            privateValues[msg.sender] == _privateValue,
            "Incorrect private value"
        );
        require(exerciseWasStarted[msg.sender], "Exercise not started");

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
