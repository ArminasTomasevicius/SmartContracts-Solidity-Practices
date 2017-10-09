pragma solidity ^0.4.0;

contract TestCoin {
    
    address deployer;
    mapping(address=>uint) balances; //gives balance of address
    
    function TestCoin(){
        
        deployer = msg.sender;
        
    }
    
    function giveCoins(uint amount, address receiver){
        
        if(msg.sender == deployer){
            balances[receiver] += amount;
        }else{
            throw;
        }
    }
    
    function viewBalance() returns(uint){
        return balances[msg.sender];
    }
    
}

//Function - creator can send unlimited amount of coins for all addresses