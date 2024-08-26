// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ExerciseTemplate.sol";

contract Ex08 is ExerciseTemplate {
    struct StudentObject {
        address owner;
        address creator;
        string name;
        bool hasBeenModified;
    }

    StudentObject[] public studentObjects;

    event CreatedAnObject(uint objectNumber);

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function createObject(string memory _name) public {
        StudentObject memory _studentObject = StudentObject({
            owner: msg.sender,
            creator: msg.sender,
            name: _name,
            hasBeenModified: false
        });

        studentObjects.push(_studentObject);
        uint objectNumber = studentObjects.length - 1;

        emit CreatedAnObject(objectNumber);
    }

    function changeObjectName(uint _objectNumber, string memory _name) public {
        require(
            studentObjects[_objectNumber].owner == msg.sender,
            "Not the owner"
        );
        studentObjects[_objectNumber].name = _name;
        studentObjects[_objectNumber].hasBeenModified = true;
    }

    function transfer(uint _objectNumber, address _recipient) public {
        require(
            studentObjects[_objectNumber].owner == msg.sender,
            "Not the owner"
        );
        studentObjects[_objectNumber].owner = _recipient;
    }

    function claimPoints(uint _objectNumber) public {
        require(
            studentObjects[_objectNumber].creator == msg.sender,
            "Not the creator"
        );
        require(
            studentObjects[_objectNumber].hasBeenModified,
            "Object not modified"
        );
        require(
            TDERC20.hasRole(
                TDERC20.TEACHER_ROLE(),
                studentObjects[_objectNumber].owner
            ),
            "Owner is not a teacher"
        );

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
