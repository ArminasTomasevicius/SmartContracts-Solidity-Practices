pragma solidity ^0.4.0;

contract Tickets {

    address owner;
    uint public tickets;
    uint constant price = 1 ether;
    mapping(address => uint) public buyers;

    function Tickets(uint t) {
        owner = msg.sender;
        tickets = t;
    }

    function () payable {
        buyTickets(1);
    }

    function buyTickets(uint amount) payable {
        if(msg.value != (amount * price) || amount > tickets) {
            throw;
        }

        buyers[msg.sender] += amount;
        tickets -= amount;

        if(tickets == 0) {
            selfdestruct(owner); //send back collected money to the seller
        }
    }

    function website() returns (string);
}

interface Refundable{
    function refund(uint numTickets) returns (bool);
}

contract AnotherTickets is Tickets(10), Refundable {

    function refund(uint numTickets) returns(bool) {
        if(buyers[msg.sender] < numTickets) {
            return false;
        }
        msg.sender.transfer(numTickets * price);
        buyers[msg.sender] -= numTickets;
        tickets += numTickets;
        return true;
    }

    function website() returns (string) {
        return "http://google.com";
    }
}