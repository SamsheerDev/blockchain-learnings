const { ethers } = require("hardhat");

async function deployERC20Token() {
  const erc20TokenContract = await ethers.getContractFactory("ECR20Token");
  const erc20Token = await erc20TokenContract.deploy();
  await erc20Token.deployed();
  return erc20Token;
}

async function deployERC721() {
  const erc721Contract = await ethers.getContractFactory("NFTContract");
  const erc721Token = await erc721Contract.deploy();
  await erc721Token.deployed();
  return erc721Token;
}



async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Deploying contracts with the account : ${deployer.address}`);

  const erc20Token = await deployERC20Token();
  console.log("ERC20 deployed at: ", erc20Token.address);

  const erc721Contract = await deployERC721();
  console.log("ERC721 deployed at: ", erc721Contract.address);

  const Vault = await ethers.getContractFactory('Vault');
  const vaultAddress = await Vault.deploy(erc20Token.address);
  console.log(`Valut contract address : ${vaultAddress.address}`);
}

main().then(()=> process.exit(0)).catch((error)=>{
  console.log(error);
  process.exit(1);
})

// cmds:
// npx hardhat run scripts/deployVault.js --network goerli
// ERC20 deployed at:  0x7d4Fc94610F76A87E79Cd8C969b42921aa5442c3
// ERC721 deployed at:  0xE04b7656Dbe8eB39220F98691f97870DAb7b9595
// Valut contract address : 0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB
// npx hardhat verify --network goerli 0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB "0x7d4Fc94610F76A87E79Cd8C969b42921aa5442c3" 
// url: https://goerli.etherscan.io/address/0x31cCc0bbE335c67566EAA7Ae90958eeCb66244EB#code

