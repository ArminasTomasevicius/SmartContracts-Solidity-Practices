pragma solidity ^0.4.0;

contract Factorial {
    Calculator calc = Calculator(0x05); // hash of instance in blockchain, instance of Calculator (new Calculator)

    function operation() constant returns(int) {
        return calc.add(1, 2);
    }
}

contract Calculator {
    function add(int a, int b) returns(int) {
        return a+b;
    }

    function multiply(int a, int b) returns(int) {
        return a*b;
    }
}