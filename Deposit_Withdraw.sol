pragma solidity ^0.4.0;

// Example of Deposit/Withdraw with permission

contract CustodialContract{
    address client;
    bool public _switch = false;
    function CustodialContract(){
        client = msg.sender;
    }
    
    modifier ifClient(){
        if(msg.sender != client){
            throw;
        }
        _;
    }
    
    function depositFunds() payable{
        
    }
    
    function withdrawFunds(uint amount) ifClient{
        if(client.send(amount)){
            _switch = true;
        }else{
            _switch = false;
        }
        
    }
    
    function getFunds() constant returns(uint){
        return this.balance;
    }
}