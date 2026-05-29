// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex11b is ExerciseTemplate {
    uint public secretValue;
    uint public rewardedStudents;
    uint public constant MAX_REWARDED_STUDENTS = 5;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {
        secretValue = 31020;
    }

    function setSecretValue(uint _newSecretValue) public onlyTeachers {
        secretValue = _newSecretValue;
    }

    function fastestStudentReward() public {
        require(
            rewardedStudents < MAX_REWARDED_STUDENTS,
            "MAX_REWARDED_STUDENTS cap reached."
        );

        rewardedStudents++;

        // Credit points to the first students who discovered this function
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
