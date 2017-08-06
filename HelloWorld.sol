pragma solidity ^0.4.0;
// Solidity example of the simple authorization + setting string value

contract HelloWorldContract{

    string word = "Hello World";
    address issuer;
    
    function HelloWorldContract(){
            issuer = msg.sender;
    }

    function getWord() constant returns(string){
        return word;
    }

    function setWord(string newWord) returns(string){
        if(issuer != msg.sender){
            return "this is not the creator!";
        }
        else{
            word = newWord;
            return "Creator";
        }
    }
}