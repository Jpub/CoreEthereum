var constant = require('../dapp/constant.js');
var eth = require('../dapp/eth.js');

var express = require('express');
var router = express.Router();

/* GET users listing. */
//----------------------------
// 펀드 참여하기 입력화면
//----------------------------
router.get('/new', function(req, res, next) {

    var fund_balance = eth.getBalance(constant.crowdFundContractAddress);
    var fund_tamount = eth.getTokenAmount(constant.crowdFundContractAddress);  // token balanceof

    res.render('new', {fund : constant.crowdFundContractAddress, fund_balance : fund_balance, fund_tamount:fund_tamount});
});

//----------------------------
// 메인화면, 유저상세화면
//----------------------------
router.get(['/', '/:id'], function(req, res, next) {
    var id = req.params.id;

    var fund_balance = eth.getBalance(constant.crowdFundContractAddress);
    var fund_tamount = eth.getTokenAmount(constant.crowdFundContractAddress);  // token balanceof

    if(id) {
        // if id exists,
        var user_balance = eth.getBalance(id);
        var user_famount = eth.getFundAmount(id);  // fund balanceof
        var user_tamount = eth.getTokenAmount(id);  // token balanceof

        res.render('view', {display:'',
            fund : constant.crowdFundContractAddress,fund_balance:fund_balance, fund_tamount:fund_tamount,
            user:id, user_balance : user_balance, user_famount:user_famount, user_tamount:user_tamount});
    } else {
        // if id doesn't exist,
        res.render('view', {display:'display:none',
            fund : constant.crowdFundContractAddress,fund_balance:fund_balance, fund_tamount:fund_tamount});
    }
});

//----------------------------
// 펀드 참여하기 액션화면
//----------------------------
router.post('/join', function(req, res, next) {
    var from = req.body.user;
    var famount = req.body.famount;
    var passphase = req.body.passphase;

    eth.unlockAccount(from, passphase, checkUnlock);

    function checkUnlock(err, result) {
        if (err) {
            console.log(err);
            return callback(err);
        } else {
            eth.sendTransaction(from, constant.crowdFundContractAddress, famount, 2000000, checkTransaction);
        }
    }

    function checkTransaction( err, result) {
        if(err) {
            console.log(err);
            return callback(err);
        } else {
            eth.fundTransferEvent(checkEvent);
        }
    }

    function checkEvent(err, result) {
        if(err) {
            console.log(err);
            return res.send(400);
        } else {
            try {
                res.redirect('/users/' + from);
            } catch(e) {
            }
        }
    }
});

module.exports = router;
