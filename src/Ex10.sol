// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex10 is ExerciseTemplate {
    mapping(address => uint) private privateValues;
    mapping(address => bool) public exerciseWasStarted;
    uint[40] private randomValuesStore;
    uint public nextValueStoreRank;

    event ShowPrivateVariableInEvent(uint i, uint myVariable);
    event ShowUserRank(uint i);

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function setRandomValueStore(
        uint[40] memory _randomValuesStore
    ) public onlyTeachers {
        randomValuesStore = _randomValuesStore;
        nextValueStoreRank = 0;
        for (uint i = 0; i < randomValuesStore.length; i++) {
            emit ShowPrivateVariableInEvent(i, randomValuesStore[i] + i);
        }
    }

    function assignRank() public {
        privateValues[msg.sender] = randomValuesStore[nextValueStoreRank];
        emit ShowUserRank(nextValueStoreRank);
        nextValueStoreRank =
            (nextValueStoreRank + 1) %
            randomValuesStore.length;
        exerciseWasStarted[msg.sender] = true;
    }

    function showYouKnowPrivateValue(uint _privateValue) public {
        require(exerciseWasStarted[msg.sender], "Exercise not started");
        require(
            privateValues[msg.sender] == _privateValue,
            "Incorrect private value"
        );

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
