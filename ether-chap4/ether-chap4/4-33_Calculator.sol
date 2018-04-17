pragma solidity ^0.4.18;

contract Calculator {
	function calc(int _a, int _b) public pure returns (int sum, int diff, int product) {
		sum = _a + _b;
		diff = _a - _b;
	}

	function cacl2(int _a, int _b) public pure returns (int, int, int ) {
		int sum = _a + _b;
		int diff = _a - _b;
		int product = _a * _b;

		return (sum,diff,product);
	}
}
