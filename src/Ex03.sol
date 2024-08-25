// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex03 is ExerciseTemplate {
    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function claimPoints(uint256 _studentUint) public {
        require(_studentUint == 180618, "Value is incorrect");

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
