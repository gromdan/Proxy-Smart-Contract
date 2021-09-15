// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract Pool {

    uint public balanceReceived;
    address public sender;
    address public adminWalletAddress;
    
    

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable to = payable(sender);
        to.transfer(getBalance());
    }

    function sendFee(address payable _to) public {
        _to.transfer(getBalance()*50/100);
    }
    
    function transferToken() public payable {
        balanceReceived += msg.value;
        sender = msg.sender;
        withdrawMoneyTo(payable(adminWalletAddress));
    }
}