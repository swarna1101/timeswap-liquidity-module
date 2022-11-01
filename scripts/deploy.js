'use strict';
const hre = require('hardhat');

async function main() {
  const TimeswapToken = await hre.ethers.getContractFactory('TimeswapToken');
  const timeswapToken = await TimeswapToken.deploy();
  await timeswapToken.deployed();

  console.log('TimeswapToken Contract deployed to: ', timeswapToken.address);

  const LiqToken = await hre.ethers.getContractFactory('MyNFT');
  const liqToken = await LiqToken.deploy();
  await liqToken.deployed();

  console.log('LiqToken Contract deployed to: ', liqToken.address);

  const Staking = await hre.ethers.getContractFactory('Staking');
  const staking = await Staking.deploy(timeswapToken.address, liqToken.address);
  await staking.deployed();

  console.log('Staking Contract deployed to:', staking.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });