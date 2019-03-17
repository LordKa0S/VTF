var util = require('util'),
	url = require('url'),
	http = require('http'),
	qs = require('querystring');

var mysql = require('mysql');

http.createServer(function (req, res) {
	var post, id;
	var pubkey = "";
	var pubky = "";
	var success = false;
	let encrypted;
	const NodeRSA = require('node-rsa');
	var key;
	var decrypted;
	const Web3 = require('web3');
	const web3 = new Web3('https://ropsten.infura.io/v3/fdb652e2684b496b872226157449171b');
	const contractAddress = '0x715f6f15515A7743F8A810bee147931CA3dF945e'
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

	if (req.method == 'POST') {
		var body = '';
		req.on('data', function (data) {
			body += data;
		});
		req.on('end', function () {
			post = qs.parse(body);
			id = parseInt(post.ids);
			encrypted = post.encr;
			var con = mysql.createConnection({
				host: "localhost",
				user: "root",
				password: "",
				database: "keys",
			});
			con.connect(function (err) {
				if (err) throw err;
				con.query("SELECT pubkey FROM pub where id=" + id, function (err, result, fields) {
					if (err) throw err;
					pubky = (result[0].pubkey);
					key = new NodeRSA(pubky);
					key.setOptions({encryptionScheme: 'pkcs1'});
					decrypted = key.decrypt(encrypted, 'utf8');
					if (decrypted == '1' || decrypted == '2') {
						let candidateId = parseInt(decrypted);
						success = true;

		 				contract.methods.disp(candidateId).call({
							from: '0xf54eeafd8a9b4E5b13FF4A51206648764bf5029f',
						}, function (error, result) {
							console.log(result);
						});

						var transfer = contract.methods.vote(pubky, candidateId);
						var encodedABI = transfer.encodeABI();

						// var tx = {
						// 	from: "0xf54eeafd8a9b4E5b13FF4A51206648764bf5029f",
						// 	to: contractAddress,
						// 	gas: 0x20000,
						// 	data: encodedABI
						// };

						web3.eth.accounts.signTransaction({
							from: "0xf54eeafd8a9b4E5b13FF4A51206648764bf5029f",
							to: contractAddress,
							gas: 0x20000,
							data: encodedABI
						}, '0xD0094F68419E98F3E40E6CFA2E2B7A6A546E326B3ABA534EA4F25B20CBE479A4').then(signed => {
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
					if (success) {
						res.writeHead(200, { 'Content-Type': 'text/html' });
						res.end('<script>alert("Your vote has been counted");</script>');

					}
					else {
						res.writeHead(200, { 'Content-Type': 'text/plain' });
						res.end('error');

					}
				});
			});



			// if (true) {
			// 	response.writeHead(200, { 'Content-Type': 'text/plain' });
			// 	response.end('ok');
			// }
			// else {
			// 	//res.status(200).send("some error"); 

			// 	response.writeHead(200, { 'Content-Type': 'text/plain' });
			// 	response.end('error');
			// }

		});

	}
}).listen(8081);

// Console will print the message
console.log('Server running at http://127.0.0.1:8081/');
