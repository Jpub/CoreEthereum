pragma solidity ^0.4.18;

contract Greeter {
	string helloKorean = "안녕?";
	string goodbyeKorean = "잘가!";
	string helloEnglish = "Hello";
	string goodbyeEnglish = "Goodbye!";

	enum Lang { Korean, English }

	function sayHello(uint8 lang) public view returns (string) {
		if ( lang == uint8(Lang.Korean) )
			return helloKorean;
		if ( Lang(lang) == Lang.English )
			return helloEnglish;
		return "";
	}

	function changeHello(uint8 lang,string _hello) public {
		if ( lang == uint8(Lang.Korean) )
			helloKorean = _hello;
		if ( Lang(lang) == Lang.English )
			helloEnglish = _hello;
	}

	function sayGoodbye(uint8 lang) public view returns (string) {
		if ( lang == uint8(Lang.Korean) )
			return goodbyeKorean;
		if ( Lang(lang) == Lang.English )
			return goodbyeEnglish;
		return "";
	}

	function changeGoodbye(uint8 lang,string _goodbye) public {
		if ( lang == uint8(Lang.Korean) )
			goodbyeKorean = _goodbye;
		if ( Lang(lang) == Lang.English )
			goodbyeEnglish = _goodbye;
	}
}
