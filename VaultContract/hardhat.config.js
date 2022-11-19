/** @type import('hardhat/config').HardhatUserConfig */
require("dotenv").config();
require('@nomiclabs/hardhat-waffle');
require('@nomiclabs/hardhat-etherscan');

module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      accounts:[process.env.GOERLI_PRIVATE_KEY],
      url:"https://eth-goerli.g.alchemy.com/v2/2Ddxv5zHKSjogUxtgnVWtqY031ShTTzk"
    }
  },
  etherscan: {
    apiKey: { goerli: process.env.GOERLI_API_KEY}
  },
};
