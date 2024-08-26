pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";
// attention

contract Ex09 is ExerciseTemplate {
    event ALazyStudent(address _lazyStudent);

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function collectYourPoints(uint _aValueToInput) public {
        require(_aValueToInput == 982738, "Incorrect value");
        emit ALazyStudent(msg.sender);

        validateExercise(msg.sender);
    }
}
