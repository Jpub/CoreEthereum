pragma solidity ^0.4.18;

contract Calculator {
	function multiply(uint multiplier, uint multiplicand) public pure returns (uint){
		return multiplier * multiplicand;
	}

	function calculate(uint a, uint b) public pure returns (uint){
		return multiply({multiplicand:a, multiplier:b});
	}
}
