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

    constructor() ERC721("metacubes", "CUBES") {}

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


  function guessPassword() public returns (uint256) {
    // TODO: implement
    
    return 0;
  }

  function voteToStartContest() public {
    // TODO: implement
  }

  function startContest() public {
    // TODO: implement    
  }

  function toggleContestReady() public onlyOwner{
    // TODO: implement
  }

  function toggleRefundMode() public onlyOwner {
    // TODO: implement
  }

  function refundToken() public onlyOwner {
    // TODO: implement
  }

}
