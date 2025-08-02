// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract FundTransfer{
    event FundsTransferred(address indexed from, address indexed to, uint256 amount);

    function transferFunds(address payable _to) public payable{
        require(_to != address(0), "Invalid recipient address");
        require(msg.value > 0, "You must send some Ether");

        _to.transfer(msg.value);

        emit FundsTransferred(msg.sender, _to, msg.value);
    }

}