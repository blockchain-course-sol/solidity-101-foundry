// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex02 is ExerciseTemplate {
    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    fallback() external payable {
        _handlePayment();
    }

    receive() external payable {
        _handlePayment();
    }

    function _handlePayment() internal {
        require(msg.value > 0, "Must send ETH to complete this exercise");

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
