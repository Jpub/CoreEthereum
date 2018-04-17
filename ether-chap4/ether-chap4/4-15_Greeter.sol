pragma solidity ^0.4.18;

contract Greeter {
	mapping (uint8 => Greeting) greetingByLang;
	mapping (string => uint8) langMap;

	struct Greeting {
		string hello;
		string goodbye;
	}

	enum Lang { Korean, English }

	function Greeter() public {
		greetingByLang[uint8(Lang.Korean)] = Greeting("안녕?","잘가!");
		greetingByLang[uint8(Lang.English)] = Greeting({goodbye:"Goodbye!",hello: "Hello"});
		langMap["Korean"] = uint8(Lang.Korean);
		langMap["English"] = uint8(Lang.English);
	}

	function sayHello(string _lang) public view returns (string) {
		uint8 lang = langMap[_lang];
		return greetingByLang[lang].hello;
	}

	function changeHello(string _lang,string _hello) public {
		uint8 lang = langMap[_lang];
		greetingByLang[lang].hello = _hello;
	}

	function sayGoodbye(string _lang) public view returns (string) {
		uint8 lang = langMap[_lang];
		return greetingByLang[lang].goodbye;
	}

	function changeGoodbye(string _lang,string _goodbye) public {
		uint8 lang = langMap[_lang];
		greetingByLang[lang].goodbye = _goodbye;
	}
}
