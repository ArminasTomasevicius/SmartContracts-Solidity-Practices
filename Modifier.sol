pragma solidity ^0.4.0;

// Example of using modifier for functions activation

contract HelloWorldContract{

    string word = "Hello World";
    address issuer;
    
    function HelloWorldContract(){
            issuer = msg.sender;
    }
    
    modifier ifIssuer(){
        if(issuer != msg.sender){
            throw;
        }
        else{
            _;
        }
    }

    function getWord() constant returns(string){
        return word;
    }

    function setWord(string newWord) ifIssuer returns(string){
            word = newWord;
            return "Creator";
        }
    }