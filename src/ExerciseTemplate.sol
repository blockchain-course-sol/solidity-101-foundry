// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ERC20TD.sol";

contract ExerciseTemplate {
    ERC20TD public immutable TDERC20;

    mapping(address => bool) public hasCompletedExercise;

    event ConstructedCorrectly(address erc20Address);

    constructor(ERC20TD _TDERC20) {
        TDERC20 = _TDERC20;
        emit ConstructedCorrectly(address(TDERC20));
    }

    function creditStudent(uint256 _points, address _studentAddress) internal {
        if (!hasCompletedExercise[_studentAddress]) {
            TDERC20.distributeTokens(_studentAddress, _points);
        }
    }

    function validateExercise(address _studentAddress) internal {
        hasCompletedExercise[_studentAddress] = true;
    }

    function isTeacher() public view returns (bool) {
        return TDERC20.hasRole(TDERC20.TEACHER_ROLE(), msg.sender);
    }

    modifier onlyTeachers() {
        require(isTeacher(), "Caller is not a teacher");
        _;
    }
}
