//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./ERC20Token.sol";


// Create a Vault contract with following functionality:

// 1. Owner will deposit an NFT in the contract.
// 2. Mint some X amount of ERC20 tokens (which will represent the fraction of NFT).
// 3. Users will own a fraction of NFT(that ERC20 token) equivalent to the amount of ETH they paid.

contract Vault {
    ECR20Token public erc20Contract;

    constructor(address _erc20Contract) {
        erc20Contract = ECR20Token(_erc20Contract);
    }

    function depositNFT(address _nftContract, uint256 _tokenId)
        external
        payable
    {
        ERC721 nftContract = ERC721(_nftContract); //Users deposited nft contract adddress
        nftContract.transferFrom(msg.sender, address(this), _tokenId); //NFT token is transfered to vault address

        uint256 ethPaid = msg.value; // given eth amount

        uint256 xAmount = 10 * 10**18 + ethPaid; // lets assume 10 + eth value is x amount;
        erc20Contract.mint(xAmount); // x amount of  erc20 token is minted;

        // For Point "Users will own a fraction of NFT(that ERC20 token) equivalent to the amount of ETH they paid."
        // Lets assume one ERC20 token is of value 1 ETH
        // xAmount = No of ERC20 token minted
        // ethPaid = eth given by user
        // shares  = xAmount / ethPaid
        uint256 shares = xAmount / ethPaid;
        erc20Contract.transfer(msg.sender, shares); // share of ERC20 token is transfered to user
    }
}
