// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    string tokenName = "Crizalys 2.0";
    string tokenAbbr = "CZ";
    uint public totalSupply = 500;

    modifier requireOwner(address add){
        require (add == msg.sender, "Only account owner can mint ");
        _;
    }


    // mapping variable here
    mapping (address => uint) public balances;

    // mint function
    function mint(address _address, uint _value) public requireOwner(_address){
        totalSupply = totalSupply + _value;
        balances[_address] += _value; 
    } 

    
    uint minimumBurn = 99;

    
    // burn function

    function burn(address _address, uint _value) public requireOwner(_address){
        if(balances[_address] < _value){
            revert();
        }
        assert(_value > minimumBurn);
        totalSupply -= _value;
        balances[_address] -= _value;
    }


}
