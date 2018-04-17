pragma solidity ^0.4.0;

contract owned {
	function owned() public { owner = msg.sender; }

	address owner;
}

contract mortal is owned {
	function kill() public {
		if (msg.sender == owner) selfdestruct(owner);
	}
}

contract Base1 is mortal {
	function kill() public { /* do cleanup 1 */ mortal.kill(); }
}

contract Base2 is mortal {
	function kill() public { /* do cleanup 2 */ mortal.kill(); }
}

contract Final is Base1, Base2 {
}
