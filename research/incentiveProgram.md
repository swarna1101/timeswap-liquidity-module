# Incentive Program for Liquidity Protocols

## 1.Uniswap Incentive Program

### What is an incentive program?

The entire Uniswap V3 stake revolves around incentive programs. It represents your liquidity mining program or staking instance inside their smart-contracts. Incentive program is like a pool with a limited amount of tokens to distribute in which staking takes place.


### Deploying incentive program

. Since these are just administrator actions, the Etherscan’s interface will be sufficient to cover creation of the program.

To deploy an incentive program, we will need the following things prepared:

1.  **_rewardToken_**  - your ERC20 tokens address
2.  **_pool_**  - Uniswap V3 pair pool address
3.  **_startTime_**  - start date in Unix timestamp
4.  **_endTime_**  - end date in Unix timestamp
5.  **_refundee_**  - refundee address
6.  **_reward_**  - tokens on your wallet that you will transfer in your Incentive program for distribution
7.  Approve the amount of tokens you are about to transfer into the Staker contract.
#### How to approve token transfer

Before you can create your Incentive program, you must approve the token transfer into the Staker contract. Otherwise, the  **_createIncentive_**  transaction will fail.

1.  Open your token contract in Etherscan and switch to Write Contract tab
2.  Connect your wallet
3.  Find the  **_approve_**  transaction and complete the following information
4.  **__spender_**  - the Staker contract address
5.  **__value_**  - the amount of token you want to use for the incentive program in Wei. Should be identical to  **_reward_**  amount from earlier.
6.  Click Write and submit the transaction. Once successfully executed, you can proceed with the next step.
#### Create incentive

Moving forward to the Incentive program, you’ll need to follow the next steps for successful deployment:

1. Open Uniswap V3 Staker contract in Etherscan and switch to Write contract

2. Connect your wallet

3. Find the  **_createIncentive_**  transaction and write the addresses you prepared in the beginning of this guide, in the following order

`["REWARD_TOKEN_ADDRESS","POOL_ADDRESS",START_DATE,END_DATE,"REFUNDEE_ADDRESS"]`

## 2. Balancer Incentive Program
Balancer V2 Liquidity mining incentives operates in **four** tiers governed by a combination of BAL governance and the Ballers Committee.

The allocation of tier 1 slots requires a formal proposal, which must then be voted on by BAL holders.

**All Balancer community members retain the right to make proposals and signal support for pools to be allocated slots from tiers 2 to 4.** The Ballers Committee act as a liaison between community sentiment and formal changes to the program. Discussions on Liquidity Mining inclusion are open for all community members on both Discord and the Forum.
The allocation of liquidity mining slots from tiers 2 to 4 is discussed weekly taking into account community input and signal, and voted on formally by the Ballers Liquidity Mining Committee. Contributions from the community are to be made in the `💭incentives-submissions-and-ideas` channel on Discord. Ballers proposals are made public in the `👁🗨liquidity-committee` channel.

## 3. Morpho Incentive Program

Morpho could let the user trade their accumulated COMP or AAVE to Morpho Tokens with the Morpho DAO when they claim their rewards. By doing so, the user gets a bonus of Morpho Tokens, which is given out from Morpho’s own incentive program. Remark that Morpho thus accumulates AAVE and COMP, which makes sense as it may want to have a say in the governance of the pool it relies on. To summarize, two regimes can be distinguished for Morpho:

• The spread of the PLF is not inverted: Morpho moves supply and borrowing positions in and out of the PLF to get improved APYs as described in 2.1 In the long term, this scenario will be the most likely.

• The spread of the PLF is inverted: Morpho and the user can trade claimed rewards from COMP/Aave to Morpho Tokens, incentivizing users by providing a bonus.

IncentivesVault:

```
function isPaused() external view returns (bool);

function bonus() external view returns (uint256);

function MAX_BASIS_POINTS() external view returns (uint256);

function incentivesTreasuryVault() external view returns (address);

function oracle() external view returns (IOracle);

function setOracle(IOracle _newOracle) external;

function setIncentivesTreasuryVault(address _newIncentivesTreasuryVault) external;

function setBonus(uint256 _newBonus) external;

function setPauseStatus(bool _newStatus) external;

function transferTokensToDao(address _token, uint256 _amount) external;

function tradeCompForMorphoTokens(address _to, uint256 _amount) external;
```
## 4. Curve Finance Incentive Program
On Curve, trading fees are lower than they are on Uniswap, but we can also earn rewards from outside of Curve with interoperable tokens

When DAI is lent out on the [Compound](https://www.gemini.com/cryptopedia/what-is-compound-and-how-does-it-work) platform, it is exchanged for a liquidity token called cDAI, which automatically accumulates interest for the holder. Holding cDAI means you have a right to withdraw DAI from Compound plus interest. Curve users are able to use cDAI in its liquidity pools, thus achieving a second layer of utility and potential earning from the same amount of investment.

The ability to use Compound’s [cTokens](https://www.gemini.com/cryptopedia/glossary#c-token) on Curve exemplifies the composability benefits in the DeFi ecosystem. And Compound is just one example of an external DeFi protocol with which Curve integrates. The protocol also integrates with [Yearn Finance](https://www.gemini.com/cryptopedia/what-is-yearn-finance-yfi-coin-yearnfinance) and [Synthetix](https://www.gemini.com/cryptopedia/synthetix) in order to maximize incentives for liquidity providers.

## 5. Bancor Incentive Program

The Bancor Protocol will start generating staking rewards through the creation of new BNT (inflation). To begin earning rewards, you must deposit BNT into a Bancor liquidity pool (e.g., the MKR/BNT pool). Holding BNT in a Bancor pool entitles you to a share of its staking rewards.

Bancor liquidity providers (as members of the BancorDAO) receive rewards based on:

-   the pool(s) they’re providing liquidity to
-   their ownership stake in the pool(s)

For example, in a given month:

-   $100K in staking rewards is generated
-   Rewards are distributed to “qualified” pools based on some characteristic (e.g., liquidity depth)
-   The MKR/BNT pool qualifies for 5% ($5K) in rewards
-   A user supplying 10% of the MKR/BNT pool’s liquidity receives 10% of the staking rewards ($500) on top of their share of trading fees.

In addition, staking rewards incentivize BNT token holders to become _active_ participants in the network. Users who are unwilling to stake their BNT in the system would see their BNT slowly diluted, while users who contribute “work” (or liquidity) on the system would gradually increase their share of protocol ownership.





