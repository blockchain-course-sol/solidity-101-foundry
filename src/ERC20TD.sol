// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ERC20TD is ERC20, AccessControl {
    bytes32 public constant TEACHER_ROLE = keccak256("TEACHER_ROLE");

    event DenyTransfer(address indexed recipient, uint256 amount);
    event DenyTransferFrom(
        address indexed sender,
        address indexed recipient,
        uint256 amount
    );

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _mint(_msgSender(), initialSupply);
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _grantRole(TEACHER_ROLE, _msgSender());
    }

    function distributeTokens(
        address tokenReceiver,
        uint256 amount
    ) public onlyRole(TEACHER_ROLE) {
        _mint(tokenReceiver, amount * (10 ** decimals()));
    }

    function setTeacher(
        address teacherAddress,
        bool isTeacher
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        if (isTeacher) {
            grantRole(TEACHER_ROLE, teacherAddress);
        } else {
            revokeRole(TEACHER_ROLE, teacherAddress);
        }
    }

    function setTeachers(
        address[] calldata teacherAddresses
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        for (uint i = 0; i < teacherAddresses.length; i++) {
            grantRole(TEACHER_ROLE, teacherAddresses[i]);
        }
    }

    function transfer(
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        emit DenyTransfer(recipient, amount);
        return false;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        emit DenyTransferFrom(sender, recipient, amount);
        return false;
    }
}
