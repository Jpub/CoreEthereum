pragma solidity ^0.4.15;
contract MyToken {
	mapping (address => uint) public balanceOf;
	/*컨트랙트 생성자에게 일련의 토큰을 할당하여 컨트랙트을 초기화 */
	function MyToken(uint initialSupply)  public  {
		balanceOf[msg.sender] = initialSupply;
	}
	/* 코인 보내기*/
	function transfer(address _to, uint256 _value)  public {
		require(balanceOf[msg.sender] >= _value);
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
	}
	/* 현재 잔액을 가져옴  */
	function getBalance(address _account)  public constant returns(uint) {
		return balanceOf[_account];
	}
}
