pragma solidity ^0.4.16;

import * as Math from "Math.sol";

contract Contract {
	function sub() public pure {
		Math.SafeMath.sub(10,20);
		Math.UnsafeMath.sub(10,20);
	}
}
