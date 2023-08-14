# CryzalisETH2.0

This is a beginner Solidity Smart Contract to demonstrate error handling functions including revert, assert and require. 

## Description

This contract was built upon my previous project CryzalisETH which lets you burn or mint tokens. 

CryzalisETH lacked error handling which is what this project aims to solve by integrating all the three error handling functions into the project.

Using error handling functions require, the contract lets only the account owner to mint or burn tokens from their account and you can't mint/burn tokens from someone elses account. 

The revert function assures that the amount of token you're burning does not exceed your account balance. 

Assert function is used to set a minimum limit on burn transactions (99 tokens).

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. Go to https://remix.ethereum.org/.

Once you are on the website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Test.sol). Copy and paste the following code into the file:

```javascript// SPDX-License-Identifier: MIT
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile Test.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint or burn function. Click on the "MyToken" contract in the left-hand sidebar, and then click on the "mint" function. 

## Help

Make sure to have the compiler option set to 0.8.18 to avoid version depenedency errors. 
```
pragma solidity ^0.8.18
```

## Authors

  
[Dunking](https://twitter.com/dunkjn3022)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
