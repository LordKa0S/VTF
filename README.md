# VTF
Voting system using Blockchain

Modules :
 1.  Authentication server - Verify the voters and generate keys to maintain anonimity.
 2.  Poll server - Maintains the Blockchain accounts and services requests from the different voting stations.
 3.  Smart contract - Protocols for the blockchain with the transactions of the votes.
 4.  Minimalistic UI - Accounting for the extensive demographic, the UI has been kept as minimalistic as it can be for easy understanding.

Tools used:
•	Ethereum
•	Ropston
•	Infura
•	Web3.js
•	Remix (Smart Contract IDE)
•	Firebase
•	Xampp

## Developer Guidance

### Building the Code
This repository uses [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for some of its dependencies. To make sure submodules are restored or updated, be sure to run the following prior to building:

```shell
git submodule update --init --recursive
```
