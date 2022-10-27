const { expect } = require('chai');
const { ethers } = require('hardhat');

describe(' Staking Contract', function () {
    let timeswapToken;
    let timeswapTokenContract;
    let liqToken;
    let liqTokenContract;
    let staking;
    let stakingContract;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async () => {
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
        timeswapToken = await hre.ethers.getContractFactory('timeswapToken');
        timeswapTokenContract = await timeswapToken.deploy();
        await timeswapTokenContract.deployed();

        // liqToken
        liqToken = await hre.ethers.getContractFactory('liqToken');
        liqTokenContract = await liqToken.deploy();
        await liqTokenContract.deployed();

        // Staking
        staking = await hre.ethers.getContractFactory('Staking');
        stakingContract = await staking.deploy(
            timeswapTokenContract.address,
            liqTokenContract.address
        );
        await stakingContract.deployed();
    });

    describe('Deployment', () => {
        it('Should return the Correct Token Name', async () => {
            const timeswapToken = await ethers.getContractFactory('timeswapToken');
            const timeswapTokenContract = await timeswapToken.deploy();
            await timeswapTokenContract.deployed();

            expect(await timeswapTokenContract.name()).to.equal('timeswapToken');
        });
    });

    describe('Staking Tests', () => {
        it('Should mint Timeswap token', async () => {
            await timeswapTokenContract.mint(stakingContract.address, 1000000000);
            expect(
                await timeswapTokenContract.balanceOf(stakingContract.address)
            ).to.equal(ethers.utils.parseUnits('1000000000', 18));
        });

        it('Should stake any liqToken', async () => {
            await liqTokenContract.mint(addr1.address, 1, 5, 0x00);
            await liqTokenContract
                .connect(addr1)
                .setApprovalForAll(stakingContract.address, true);
            await stakingContract.connect(addr1).stakeliqToken(1, 5);
            const Staker = await stakingContract.stakesMapping(addr1.address);
            expect(Staker.tokenId).to.equal(1);
        });
    });
});