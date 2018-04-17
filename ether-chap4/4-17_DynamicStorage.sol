pragma solidity ^0.4.18;

contract DynamicStorage {
	uint[] scores;

	function DynamicStorage() public {
		scores.push(1);
		scores[0] = 2;
	}

	function score(uint index) public view returns (uint) {
		return scores[index];
	}

	function length(uint len) public returns (uint) {
		uint i = scores.length;
		scores.length = len;

		for ( ; i < scores.length ; i++ ) {
			scores[i] = i;
		}
		return scores.length;
	}
}
