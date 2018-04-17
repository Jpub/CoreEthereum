pragma solidity ^0.4.18;

contract Calculator {
	function add(uint a,uint b) public pure returns (uint){
		return a + b;
	}

	function addWithInternalCall(uint a,uint b) internal pure returns (uint){
		return a + b;
	}

	function addWithExternalCall(uint a,uint b) external pure returns (uint){
		return a + b;
	}

	function sum1(uint a,uint b,uint c) external view returns (uint) {
		// addWithExternalCall(a,b) ⇒ 컴파일 오류 발생(가시성이 external이기 때문에 내부 호출 불가)
		// this.addWithInternalCall(a,b) ⇒ 컴파일 오류 발생(가시성이 internal이기 때문에 외부 호출 불가)
		return this.addWithExternalCall(addWithInternalCall(a,b),c);
	}

	function sum2(uint a,uint b,uint c) external view returns (uint) {
		return this.add(add(a,b),c);
	}
}
