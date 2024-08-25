// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex06 is ExerciseTemplate {
    mapping(address => uint) private privateValues;
    mapping(address => uint) public publicValues;
    mapping(address => bool) public exerciseWasStarted;

    uint[40] private randomValuesStore;
    uint public nextValueStoreRank;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function setRandomValueStore(
        uint[40] memory _randomValuesStore
    ) public onlyTeachers {
        randomValuesStore = _randomValuesStore;
        nextValueStoreRank = 0;
    }

    function startExercise() public {
        privateValues[msg.sender] = randomValuesStore[nextValueStoreRank];
        nextValueStoreRank =
            (nextValueStoreRank + 1) %
            randomValuesStore.length;
        exerciseWasStarted[msg.sender] = true;
    }

    function duplicatePrivateValueInPublic() public {
        publicValues[msg.sender] = privateValues[msg.sender] + 85;
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
