# Metacubes ETH Amsterdam

## Introduction
Metacubes is an NFT scavenger hunt where the winner has to find a "key" in the real world and enter it on chain to win an onchain prize. This idea has had a few iterations, but for the ETH Amsterdam Hackathon, the rules are below! 


## Metacube Scavenger Hunt
100 mint NFT @ 0.1ETH. 10 ETH total. NFT gets cube location. Find the cube, scan the key qr and enter it on chain (with NFT in wallet). First to enter correct password wins the pooled ETH.

### Details/Stages
1. Pool Generation
A contract will be created There is a 100 mint NFT where the contract has 100 NFTs available for mint. The minting fees are kept in the contract and are paid to finder of the cube.
2. Cube Preparation
The cube is prepared by engraving the password on the cube and then hiding it. The cube will be hidden within 10km of [Beurs van Berlage (52.3750235,4.8962766)](https://goo.gl/maps/wNDQfCyM3iuzxwq67) in Amsterdam
3. Scavenger Hunt Initialization
NFT holders will vote to start the scavenger hunt. Once a quorum (60%) is reached, anyone can call the start function, which enables the dapp to reveal the location of the cube.
4. Find the Cube
Once the start function is called, the hunt is on to find the cube! The first person to find the cube wins the prize. The cube will have a qr code encoded on it. The finder should type that code into the dapp and the prize will be given to them in that transaction. Each guess will cost 0.01 ETH to make it uneconomical to brute force (in case of low gas prices). The pooled cost of guessing is given to the winner as well.

## Cube Contract Functionality
The cube contract should have the following functions:
### Contest Functions
- `mint`: cost 0.1 ether
- `guess`: password string + 0.001 ETH. Guess is hashed and compared against the password hash. Correct match pays out prize and ends the scavenger hunt
- `vote to start`: token holder votes to start the contest. 1 vote per token. Once vote passes threshold, start function can be called. can be called once contest is ready.
- `start`: reveal cube location. can be callable by anyone once quorum is reached. 
- `set contest ready (owner`): set the contest to ready. set when cube is hidden.

### Refund Functions
- `set refund mode (owner)`: set the contest to refund mode. set if cube is missing.
- `refund token`: refunds the minting fee to the token holder.



## Dapp Functionality
There'll be a dapp that facilitates minting, voting, and guessing.

## Server Functionality
There'll be a server that handles serving secret data to token holders. The server will verify that the wallet address that is signed in with (using Sign in with Ethereum) is the same as the address of the token holder. Then it will serve the location data of the cube if the contest has started.

## FAQ
### What if the cube is not found?
If the cube is not found at the location (that someone unrelated found the cube) a refund mode can be enabled. This will enable the contract to refund the minting fee to the token holder in exchange for the token.

### Does the winner get all of the ETH?
The winner gets 90% of the pooled ETH. The other 10% goes to me! I'd like to use these funds to cover the cost of the cube + engraving, and to fund other projects. I also do not think I'll be eligible to win anything from the hackathon.
