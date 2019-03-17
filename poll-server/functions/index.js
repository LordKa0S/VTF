const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
 let id = parseInt(request.get('ids'));
 var mysql = require('mysql');
 var pubkey = "";
 var pubky = "";
 var success = false;

var con = mysql.createConnection({
  host: "sql12.freemysqlhosting.net:3306",
  user: "sql12280463",
  password: "QiCdU6XAks",
   database: "sql12280463"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT pubkey FROM pub where id="+id, function (err, result, fields) {
    if (err) throw err;
    pubky=(result[0].pubkey);
  });
});
let encrypted = request.get('encr');
const NodeRSA = require('node-rsa');
const key = new NodeRSA(pubky);
const decrypted = key.decrypt(encrypted, 'utf8');
if(true)
res.status(200).send(decrypted);
else
res.status(200).send("some error"); 
if (decrypted == '1' || decrypted == '2'){
	let candidateId = decrypted;
	const Web3 = require('web3');
	success = true;
const web3 = new Web3('https://ropsten.infura.io/v3/fdb652e2684b496b872226157449171b');
const contractAddress = '0x1a1e1aB9210d0884DFE30535e0989C98b37DfCc6'
const contractABI = [
  {
    "constant": false,
    "inputs": [
      {
        "name": "_pubkey",
        "type": "string"
      },
      {
        "name": "_candidateId",
        "type": "uint256"
      }
    ],
    "name": "vote",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "candidates",
    "outputs": [
      {
        "name": "id",
        "type": "uint256"
      },
      {
        "name": "name",
        "type": "string"
      },
      {
        "name": "voteCount",
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
    "name": "candidatesCount",
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
        "name": "_candidateId",
        "type": "uint256"
      }
    ],
    "name": "disp",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
]

 var contract = new web3.eth.Contract(contractABI, contractAddress);

 contract.methods.disp(candidateId).call({
from: '0xf54eeafd8a9b4E5b13FF4A51206648764bf5029f',
}, function(error, result){
console.log ( result);
});

  var transfer = contract.methods.vote(pubkey, candidateId);
  var encodedABI = transfer.encodeABI();

  var tx = {
    from: "0xf54eeafd8a9b4E5b13FF4A51206648764bf5029f",
    to: contractAddress,
    gas: 0x20000,
    data: encodedABI
  }; 

  web3.eth.accounts.signTransaction(tx, '0xD0094F68419E98F3E40E6CFA2E2B7A6A546E326B3ABA534EA4F25B20CBE479A4').then(signed => {
    var tran = web3.eth.sendSignedTransaction(signed.rawTransaction);

    tran.on('confirmation', (confirmationNumber, receipt) => {
      console.log('confirmation: ' + confirmationNumber);
    });

    tran.on('transactionHash', hash => {
      console.log('hash');
      console.log(hash);
    });

    tran.on('receipt', receipt => {
      console.log('reciept');
      console.log(receipt);
    });

    tran.on('error', console.error);
  });

}
if(success)
  res.status(200).send("You voted");
else
  res.status(200).send("some error"); 
});
