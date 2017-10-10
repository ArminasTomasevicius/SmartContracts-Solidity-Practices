pragma solidity ^0.4.0;

contract ERC20{
    
    mapping(address => uint) balances;
    mapping(address => mapping(address=>uint)) approved; //double mapping
    uint supply;
    
    function totalSupply() constant returns(uint totalSupply){
        return supply;
    }
    
    function balanceOf(address _owner) constant returns (uint balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) returns(bool success){
        if(balances[msg.sender] >= _value && _value > 0){
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            return true;
            
        }else{
            //failed transaction
            return false;
        }
    }
    
    function approve(address _spender, uint _value) returns (bool success){ // owner can approve someone to spend coins
        
        if(balances[msg.sender] > _value){
        approved[msg.sender][_spender] = _value;
        return true;
        }
        
        return false;
    }
    
    function allowance(address _owner, address _spender) constant returns(uint remaining){
        
        return approved[_owner][_spender];
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success){
        if(balances[_from] >= _value && approved[_from][msg.sender]>=_value && _value > 0){
            balances[_from] -= _value;
            approved[_from][msg.sender] -= _value;
            balances[_to] += _value;
            
            return true;
        }else{
            return false;
        }
    }
    
    //not part of ERC20
    function mint(uint numberOfCoins){
        balances[msg.sender] += numberOfCoins;
        supply += numberOfCoins;
    }
    
    function getMyBalance() returns (uint){
        return balances[msg.sender];
    }
}