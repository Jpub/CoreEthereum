pragma solidity ^0.4.18;

contract ScopeTest {
	function drive(uint age) public pure returns (string) {
		if ( canDrive ) {
			return "can drive";
		}

		canDrive = false;

		if ( age > 20 ) {
			bool canDrive = true;
		}

		if ( canDrive ) {
			return "I can drive";
		}

		return "I can't drive";
	}
}
