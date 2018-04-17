pragma solidity ^0.4.18;

contract Calculator {
	address creator;

	function Calculator() public {
		creator = msg.sender;
	}

	function kill() external {
		if ( msg.sender == creator )
		selfdestruct(creator);
	}
}
