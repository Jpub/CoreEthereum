pragma solidity ^0.4.18;

contract Greeter {
	mapping (uint8 => string) helloByLang;
	mapping (uint8 => string) goodbyeByLang;

	enum Lang { Korean, English }

	function Greeter() public {
		helloByLang[uint8(Lang.Korean)] = "안녕?";
		helloByLang[uint8(Lang.English)] = "Hello";

		goodbyeByLang[uint8(Lang.Korean)] = "잘가!";
		goodbyeByLang[uint8(Lang.English)] = "Goodbye!";
	}

	function sayHello(uint8 lang) public view returns (string) {
		return helloByLang[lang];
	}

	function changeHello(uint8 lang,string _hello) public {
		helloByLang[lang] = _hello;
	}

	function sayGoodbye(uint8 lang) public view returns (string) {
		return goodbyeByLang[lang];
	}

	function changeGoodbye(uint8 lang,string _goodbye) public {
		goodbyeByLang[lang] = _goodbye;
	}
}
