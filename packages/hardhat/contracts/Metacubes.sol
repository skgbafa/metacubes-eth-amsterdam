// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Metacubes is ERC721, ERC721Burnable, Ownable {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;
  Counters.Counter public votesToStart;

  bool public contestReady = false;
  bool public contestStarted = false;
  bool public refundMode = false;
  address public contestWinner;


  string private hashedPassword;
  string private quorum = 70;

  mapping(uint256 => bool) private _voteRecord;

  constructor(string memory _hashedPassword) ERC721("metacubes", "CUBES") {
    hashedPassword = _hashedPassword;
  }

  function _baseURI() internal pure override returns (string memory) {
      // TODO: implement
      return "metacubes.wtf";
  }

  function safeMint(address to) public onlyOwner {
      // TODO: implement
      uint256 tokenId = _tokenIdCounter.current();
      _tokenIdCounter.increment();
      _safeMint(to, tokenId);
  }

  function getContestReady() public view returns (bool) {
      return contestReady;
  }

  function getContestStarted() public view returns (bool) {
      return contestStarted;
  }

  function getRefundMode() public view returns (bool) {
      return refundMode;
  }

  function guessPassword(uint256 tokenID, string memory password) public returns (uint256) {
      // TODO: implement
      // require contest occuring
      require(isContestOccuring(), "The contest is not occuring");
      // require caller is owner of tokenid
      // require payment of 0.01 ether
      // require(hashedPassword == keccak256(password));
      
      // correct guess!
      // set contest over
      // transfer eth
      return 0;
  }

  function voteToStartContest(uint256 tokenID) public {
      // TODO: implement
      // require contest ready
      require(contestReady, "The contest is not ready to start");
      // requiure token in caller wallet
      // require _voteRecord[token] false
      require(_voteRecord[tokenID] == false, "This token has already voted");
      // increment votesToStart
      _voteRecord[tokenID] = true;
     votesToStart.increment();


  }

  function startContest() public {
      // require contest ready
      require(contestReady, "The contest is not ready to start");
      // require votesToStart > quorum
      require(current(votesToStart) > quorum, "Not enough votes to start. A quorum of 70 is needed to start");
      // require not refund mode
      require(!refundMode, "The contract is in refund mode and the contest can not be started.");
      // set contest started
      contestStarted = true;
  }

    function isContestOccuring() private view returns (bool) {
      return contestReady && contestStarted && !refundMode;
  }

  function toggleContestReady() public onlyOwner {
    contestReady = !contestReady;
  }

  function toggleRefundMode() public onlyOwner {
    refundMode = !refundMode;
  }

  function refundToken() public onlyOwner {
      // TODO: implement
      // require refund mode on
      // burn token
      // return mint fee to message.sender
  }
  
}
