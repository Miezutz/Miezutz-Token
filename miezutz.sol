// SPDX-License-Identifier: MIT
// This is The Goat coin
// https://twitter.com/Miezutz
// https://www.youtube.com/@miezutz
// https://t.me/+t2Udo8aXU-djZjNk
// https://github.com/miezutz
// https://linktr.ee/miezutz
// https://www.facebook.com/miezutz

pragma solidity ^0.8.2;

contract MiezutzToken {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalSupply = 100000000 * 10 ** 18;
    string public name = "Miezutz Token";
    string public symbol = "MTZ";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, "balance too low");
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, "balance too low");
        require(allowance[from][msg.sender] >= value, "allowance too low");
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;   
    }
    
    function approve(address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;   
    }
}
