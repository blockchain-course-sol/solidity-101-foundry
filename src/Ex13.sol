// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ExerciseTemplate.sol";
import "./Iex13Solution.sol";

contract Ex13 is ExerciseTemplate {
    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function askForPoints(address ex13Solution) public {
        uint256 initialBalance = TDERC20.balanceOf(ex13Solution);
        require(initialBalance == 0, "Solution should start with 0 points");

        Iex13Solution callerSolution = Iex13Solution(ex13Solution);
        callerSolution.completeWorkshop();

        uint256 finalBalance = TDERC20.balanceOf(ex13Solution);
        uint256 decimals = TDERC20.decimals();
        require(
            finalBalance >= 6 ** decimals * 2,
            "Solution should end with at least than 6 points"
        );

        // Validating exercice
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
