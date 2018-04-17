var constant = require('./constant.js');
//------------------------
// Web3 연결
//------------------------
var Web3 = require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));

const mainAddress = constant.mainAddress;
const makerAddress = constant.makerAddress;
const eoaAddress = constant.eoaAddress;
const TokenContractAddress = constant.TokenContractAddress;
const crowdFundContractAddress = constant.crowdFundContractAddress;

//------------------------
// 스마트 컨트랙트 연결
//------------------------
// Token Contract
// [주의] 현재 연결된 Geth 네트워크에 배포된 ABI로 업데이트 하세요.
var walletTokenAbi = [
  {
    "constant": true,
    "inputs": [],
    "name": "symbol",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "name",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "decimals",
    "outputs": [
      {
        "name": "",
        "type": "uint8"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "",
        "type": "address"
      }
    ],
    "name": "balanceOf",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "_from",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "_to",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "_value",
        "type": "uint256"
      }
    ],
    "name": "Transfer",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "_to",
        "type": "address"
      },
      {
        "name": "_value",
        "type": "uint256"
      }
    ],
    "name": "transfer",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "name": "tokenName",
        "type": "string"
      },
      {
        "name": "tokenSymbol",
        "type": "string"
      },
      {
        "name": "decimalUnits",
        "type": "uint8"
      },
      {
        "name": "initialSupply",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  }
];
var TokenContract = web3.eth.contract(walletTokenAbi).at(TokenContractAddress);

// crowdFund Contract
// [주의] 현재 연결된 Geth 네트워크에 배포된 ABI로 변경해야 합니다.
var crowdFundAbi = [
  {
    "constant": true,
    "inputs": [],
    "name": "tokenReward",
    "outputs": [
      {
        "name": "",
        "type": "address"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "price",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "fundingGoalReached",
    "outputs": [
      {
        "name": "",
        "type": "bool"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "fundingGoal",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "deadline",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "crowdsaleClosed",
    "outputs": [
      {
        "name": "",
        "type": "bool"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "amountRaised",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "",
        "type": "address"
      }
    ],
    "name": "balanceOf",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "beneficiary",
    "outputs": [
      {
        "name": "",
        "type": "address"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "checkGoalReached",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "backer",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "amount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "name": "isContribution",
        "type": "bool"
      }
    ],
    "name": "FundTransfer",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "beneficiaryAddress",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "amountRaisedValue",
        "type": "uint256"
      }
    ],
    "name": "GoalReached",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "safeWithdrawal",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "payable": true,
    "stateMutability": "payable",
    "type": "fallback"
  },
  {
    "inputs": [
      {
        "name": "ifSuccessfulSendTo",
        "type": "address"
      },
      {
        "name": "fundingGoalInEthers",
        "type": "uint256"
      },
      {
        "name": "durationInMinutes",
        "type": "uint256"
      },
      {
        "name": "etherCostOfEachToken",
        "type": "uint256"
      },
      {
        "name": "addressOfTokenUsedAsReward",
        "type": "address"
      }
    ],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  }
];
var CrowdFundContract = web3.eth.contract(crowdFundAbi).at(crowdFundContractAddress);

web3.eth.defaultAccount = web3.eth.accounts[0];

//----------------------------
// 토큰 명부 조회 (BalanceOf)
//----------------------------
exports.getTokenAmount = function (address) {
    //+++++++  STEP 4. Get 실습 ++++++++++++
    return TokenContract.balanceOf(address);
};

//----------------------------
// 펀딩 명부 조회 (BalanceOf)
//----------------------------
exports.getFundAmount = function (address) {
    //+++++++  STEP 4. Get 실습 ++++++++++++
    return CrowdFundContract.balanceOf(address);
};

//----------------------------
// 이더 잔액 조회
//----------------------------
exports.getBalance = function (address) {
    //+++++++  STEP 4. Get 실습 ++++++++++++
    return web3.fromWei(web3.eth.getBalance(address), 'ether');
};

//----------------------------
// 계정 언락
//----------------------------
exports.unlockAccount = function (from, passphase, callback) {
    web3.personal.unlockAccount(from, passphase, function (err, hash) {
        if (err) {
            console.log(err);
            return callback(err, '');
        } else {
            console.log("* unlock : " + from + ', ' + passphase );
            return callback(null, hash);
        }
    });
};

//----------------------------
// 이더 트랜잭션 수행
//----------------------------
exports.sendTransaction = function(from, to, value, gas, callback) {
    //+++++++  STEP 4. SET 실습 ++++++++++++
    web3.eth.sendTransaction({
        to: to,
        from: from,
        value: web3.toWei(value,'ether'),
        gas: gas}, function (err, hash) {
        if (err) {
            console.log(err);
            return callback(err, '');
        } else {
            console.log("* sendTransaction txhash : " + hash );
            return callback(null, hash);
        }
    });
};

//----------------------------
// 이벤트 모니터링
//----------------------------
exports.fundTransferEvent = function( callback ) {
    //+++++++  STEP 5. Event Watch 실습 ++++++++++++

    CrowdFundContract.FundTransfer().watch(function(error, res){
        if (error)
        {
            console.log(error);
            return callback(err, '');
        } else
        {
            console.log(res);
            return callback(null, res);
        }
    });
};
