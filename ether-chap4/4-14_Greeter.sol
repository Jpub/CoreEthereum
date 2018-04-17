pragma solidity ^0.4.18;

contract Greeter {
	mapping (uint8 => Greeting) greetingByLang;

	struct Greeting {
		string hello;
		string goodbye;
	}

	enum Lang { Korean, English }

	function Greeter() public {
		greetingByLang[uint8(Lang.Korean)] = Greeting("안녕?","잘가!");
		greetingByLang[uint8(Lang.English)] = Greeting({goodbye:"Goodbye!", hello:"Hello"});
	}

	function sayHello(uint8 lang) public view returns (string) {
		return greetingByLang[lang].hello;
	}

	function changeHello(uint8 lang,string _hello) public {
		greetingByLang[lang].hello = _hello;
	}

	function sayGoodbye(uint8 lang) public view returns (string) {
		return greetingByLang[lang].goodbye;
	}

	function changeGoodbye(uint8 lang,string _goodbye) public {
		greetingByLang[lang].goodbye = _goodbye;
	}
}
