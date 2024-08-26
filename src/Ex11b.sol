// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex11b is ExerciseTemplate {
    uint public secretValue;
    bool private firstSudent;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {
        secretValue = 31020;
    }

    function setSecretValue(uint _newSecretValue) public onlyTeachers {
        secretValue = _newSecretValue;
    }

    function fastestStudentReward() public {
        require(firstSudent == false, "Function already called.");

        firstSudent = true;

        // Credit points to the student who discovered this function
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
