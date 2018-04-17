pragma solidity ^0.4.18;

contract Adder {
	function add(uint a,uint b) external payable returns (uint) {
		return a + b;
	}
}

contract Calculator {
	Adder adder;

	function Calculator(address _adderAddress) {
		adder = Adder(_adderAddress);
	}

	function add(uint a,uint b) external returns (uint) {
		return adder.add.value(10).gas(500)(a,b);
	}
}
