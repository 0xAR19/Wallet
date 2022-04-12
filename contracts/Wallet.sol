// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Wallet {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    event Send(address from, uint256 amount);
    event Get(uint256 amount);

    function send() public payable {
        emit Send(msg.sender, msg.value);
    }

    function get(uint256 amount) public {
        require(msg.sender == owner);
        require(balance() >= amount);
        address payable Owner = payable(msg.sender);
        Owner.transfer(amount);
        emit Get(amount);
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
