# Sample Hardhat Project to create a Vault contract with below functionality

1. Owner will deposit an NFT in the contract.
2. Mint some X amount of ERC20 tokens (which will represent the fraction of NFT).
3. Users will own a fraction of NFT(that ERC20 token) equivalent to the amount of ETH they paid.


Contract deployed at
``shell
  https://goerli.etherscan.io/address/0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB#code
``

Deployment and verificcation process
```shell
npx hardhat run scripts/deployVault.js --network goerli

ERC20 deployed at:  0x7d4Fc94610F76A87E79Cd8C969b42921aa5442c3
ERC721 deployed at:  0xE04b7656Dbe8eB39220F98691f97870DAb7b9595
Valut contract address : 0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB

npx hardhat verify --network goerli 0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB "0x7d4Fc94610F76A87E79Cd8C969b42921aa5442c3" 
```
