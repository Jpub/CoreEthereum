pragma solidity ^0.4.16;

contract MinimumViableToken {
	mapping (address => uint256) public balanceOf;

	function MinimumViableToken(uint256 initialSupply) public {
		balanceOf[msg.sender] = initialSupply;
	}

	function transfer(address _to, uint256 _value) public {
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
	}
}
