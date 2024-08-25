// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex04 is ExerciseTemplate {
    mapping(address => uint) public studentsCounter;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function resetCounter() public {
        studentsCounter[msg.sender] = 0;
    }

    function incrementCounter() public {
        studentsCounter[msg.sender] += 2;
    }

    function decrementCounter() public {
        require(
            studentsCounter[msg.sender] > 1,
            "Counter must be greater than 1"
        );
        studentsCounter[msg.sender] -= 1;
    }

    function validateCounter() public {
        require(studentsCounter[msg.sender] == 5, "Counter is not at 5");

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
