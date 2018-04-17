pragma solidity ^0.4.18;

contract Greeter {
	mapping (uint8 => string) helloByLang;
	string goodbyeKorean = "잘가!";
	string goodbyeEnglish = "Goodbye!";

	enum Lang { Korean, English }

	function Greeter() public {
		helloByLang[uint8(Lang.Korean)] = "안녕?";
		helloByLang[uint8(Lang.English)] = "Hello";
	}

	function sayHello(uint8 lang) public view returns (string) {
		return helloByLang[lang];
	}

	function changeHello(uint8 lang, string _hello) public {
		helloByLang[lang] = _hello;
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
