// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex12 is ExerciseTemplate {
    uint256 private aValueToInput;
    uint256 public counter;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {
        aValueToInput = 33;
    }

    function askForPoints(address admin, uint256 _valueToInput) public {
        require(
            TDERC20.hasRole(TDERC20.DEFAULT_ADMIN_ROLE(), admin),
            "Wrong admin address"
        );
        require(_valueToInput == aValueToInput, "Incorrect value");
        aValueToInput = aValueToInput + counter;
        counter++;

        // Validating exercice
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
