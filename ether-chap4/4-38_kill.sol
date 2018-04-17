pragma solidity ^0.4.16;

contract owned {
	function owned() public { owner = msg.sender; }
	address owner;
}

contract mortal is owned {
	function kill() public {
		if (msg.sender == owner) selfdestruct(owner);
	}
}

contract Config {
	function lookup(uint id) public returns (address adr);
}

contract NameReg {
	function register(bytes32 name) public;
	function unregister() public;
}

contract named is owned, mortal {
	function named(bytes32 name) public {
		Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
		NameReg(config.lookup(1)).register(name);
	}

	function kill() public {
		if (msg.sender == owner) {
			Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
			NameReg(config.lookup(1)).unregister();

			mortal.kill();
		}
	}
}

contract PriceFeed is owned, mortal, named("GoldFeed") {
	function updateInfo(uint newInfo) public {
		if (msg.sender == owner) info = newInfo;
	}

	function get() public view returns(uint r) { return info; }

	uint info;
}
