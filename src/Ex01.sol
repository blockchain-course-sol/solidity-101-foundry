// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex01 is ExerciseTemplate {
    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    /**
     * @notice Validates the exercise and credits the student
     */
    function ping() public {
        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
