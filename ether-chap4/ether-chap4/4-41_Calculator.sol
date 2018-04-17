pragma solidity ^0.4.17;

library Adder {
	function sum(uint a,uint b,uint c) public pure returns (uint) {
		return add(a,add(b,c)); // EVM의 JUMP를 이용해서 내부 호출로 처리
	}

	function add(uint a,uint b) public pure returns (uint) {
		return a + b;
	}
}

contract Calculator {
	function sum(uint a,uint b,uint c) public pure returns (uint) {
		return Adder.sum(a,b,c); // EVM의 DELEGATECALL 호출
	}
}
