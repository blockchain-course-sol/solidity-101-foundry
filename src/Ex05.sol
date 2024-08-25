// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex05 is ExerciseTemplate {
    mapping(address => address) public helpersRegister;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function declareHelper(address _helperAddress) public {
        require(
            _helperAddress != msg.sender,
            "Cannot declare yourself as helper"
        );
        helpersRegister[msg.sender] = _helperAddress;
    }

    function helpColleague(address _helpedColleague) public {
        require(
            !hasCompletedExercise[_helpedColleague],
            "Colleague has already completed the exercise"
        );
        require(
            helpersRegister[_helpedColleague] == msg.sender,
            "You are not registered as this colleague's helper"
        );

        // Validating exercise
        creditStudent(2, _helpedColleague);
        validateExercise(_helpedColleague);
    }
}
