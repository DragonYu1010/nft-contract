// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "../AccessController/StarSeasAccessController.sol";

contract StarSeasNFT is ERC721 {
    using SafeMath for uint256; 
    uint256 public tokenAmount;
    mapping(uint256 => string) public tokenHashList;
    string public baseTokenURI;


    constructor(string memory name, string memory symbol) ERC721(name, symbol){ }
    function mint(string calldata _metaData) public returns(uint) {
        uint256 tokenId = tokenAmount;
        _mint(msg.sender, tokenId);
        tokenHashList[tokenId] = _metaData;
        tokenAmount = tokenAmount.add(1);
        return tokenId;
    }
    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }
    function setBaseURI(string memory baseURI) public {
        baseTokenURI = baseURI;
    }
}