// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";
import "./Ex11b.sol";

contract Ex11 is ExerciseTemplate {
    address public immutable ex11bAddress;

    constructor(
        ERC20TD _TDERC20,
        address _ex11bAddress
    ) ExerciseTemplate(_TDERC20) {
        ex11bAddress = _ex11bAddress;
    }

    function askForPoints(
        uint _aValueToInput,
        uint _nextValueForSecret
    ) public {
        Ex11b ex11bInstance = Ex11b(ex11bAddress);

        uint retrievedSecretValue = ex11bInstance.secretValue();

        require(
            _aValueToInput == retrievedSecretValue,
            "Incorrect secret value"
        );

        ex11bInstance.setSecretValue(_nextValueForSecret);

        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
