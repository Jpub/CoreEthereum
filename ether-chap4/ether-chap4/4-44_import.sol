pragma solidity ^0.4.16;

import "Math.sol";

contract Contract {
	function sub() public pure {
		SafeMath.sub(10,20);
		UnsafeMath.sub(10,20);
	}
}
