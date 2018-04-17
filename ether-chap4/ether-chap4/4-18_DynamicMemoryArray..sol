pragma solidity ^0.4.18;

contract DynamicMemoryArray {
	function dynamicMemoryArray(uint len) public pure returns (uint[]){
		uint[] memory scores = new uint[](len);

		for ( uint i=0; i < scores.length ; i++ )
			scores[i] = i + 1;

		return scores;
	}
}
