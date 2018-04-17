pragma solidity ^0.4.11;

contract FunctionType {
	function (uint,uint) internal pure returns (uint) processor;

	function changeProcessorToAdd() public {
		processor = add;
	}

	function calculate(uint a,uint b) external view returns (uint) {
		return processor(a,b);
	}

	function add(uint a,uint b) internal pure returns (uint) {
		return a + b;
	}
}
