pragma solidity ^0.4.18;

contract Calculator {
	string message;

	function addExternal(string _message,uint a,uint b) external returns (uint) {
		message = _message;
		return a + b;
	}

	function addPublic(string _message,uint a,uint b) public returns (uint) {
		message = _message;
		return a + b;
	}
}
