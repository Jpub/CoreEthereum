pragma solidity ^0.4.16;

import {SafeMath as Math} from "Math.sol";

contract Contract {
	function sub() public pure {
		Math.sub(10,20);
		UnsafeMath.sub(10,20);
	}
}
