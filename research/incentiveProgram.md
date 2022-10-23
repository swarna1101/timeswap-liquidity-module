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

## 6.  Euler Incentive Program
Euler Finance is a capital-efficient money market protocol that allows for lending and borrowing on any crypto asset. Euler adjusts composability of each token based on consensus risk profile in order to reduce systemic risk. Euler will have its own governance token to manage communal decisions.

-  **Tiered Assets**: Tokens are given traits, and each tier represents different in-market capabilities.
- **Permission-less Listing**: Any token involved with a Uniswap v3 WETH pair can be added onto Euler.
- **Interest Rates:** Instead of using a linear interest rate curve that pre-determines interest rates based on utilization, Euler
  leverages a control theory model to maximize capital efficiency.
-  **Protected Collateral:** Collateral can be placed in a separate pool that is not accessible by accessible by borrowers, which can limit
   overall risk, whereby the only trade-off is opportunity cost of
   interest.
- **Other factors:** Euler is introducing other neat features, including MEV-resistant liquidations, multi-collateral stability
  pools, and TWAP oracles.

### Tiered Assets:
On Euler, there will be 3 tiers of tokens, each representing different features. Governance will vote on which tier each asset falls into. One important factor to consider is that although Euler creates a yield opportunity for lower-cap tokens, these lenders still have the option of becoming liquidity providers to earn yield.

- **Isolation-tier assets:** can be lent or borrowed but cannot be used as collateral. Only one isolation-tier asset can be borrowed per account. Examples of potential isolation-tier assets include tokens with market capitalizations under $20 million, or tokens that have been previously hacked, or high-risk tokens.

- **Cross-tier assets**: can be lent or borrowed but cannot be used as collateral. Crosstier assets can be borrowed alongside each other. Compared to isolation-tier assets, cross-tier assets will have more established communities and metrics, and can be considered mid-market tokens.

- **Collateral-tier assets:** This tier is most similar to how the current major DeFi money market protocol works; assets can be used for borrowing and lending, and can also collateralized.
### Permission-less Listing:

Given Euler’s new tiered structure, anybody can list an asset on the Euler money market, so long as its part of a Uniswap v3 WETH pair. The reason why it needs to have a Uniswap pair is because Euler’s price feeds are sourced from a Uniswap TWAP oracle. Euler is therefore able to capture an untapped market without sacrificing any current major money market features.

### Interest Rates:
The current consensus money market interest rate solution revolves around linear curves, whereby the interest rate increases as the utilization increases. One particular flaw of this model is that it assumes borrowing cost is perfectly placed at all different intervals. However, if interest rates move in too much of a shallow manner, then lenders sacrifice potential gains, and if rates are too steep, then utilization will not reach an optimal point.

### Protected Collateral:
Whenever a user collateralizes their assets, they are exposed to protocol risk, in case a fault causes that collateral to be seized. There is no way around this currently: Compound and AAVE users’ collateral goes towards money market pools. On Euler, users are able to forego the interest that they earn on their collateral and protect their assets. This allows for instantaneous withdrawals regardless of borrower/utilization status, and helps protect against other risks such as governance manipulation. We predict that many users will decide to use this unprecedented feature, because the interest rate on most assets being collateralized is usually quite low – a majority of users do not want to take out a loan denominated in BTC or ETH and on markets like AAVE, APR %’s for BTC and ETH are below 1%.

### Other Factors:
- **MEV-Resistant liquidations**: Instead of fixed percentage discounts for liquidators on violated loans, Euler uses a Dutch auction style, by which the discount increases over time, and each liquidator decides when to enter bidding based on their own profit analysis. This effectively pushes profit of liquidations close to zero. Euler will offer a
  ‘discount booster’ for liquidity providers on Euler in order to prevent miners and runners. This way, a real liquidity provider might bid sooner than a miner. For example, if break-even for both a miner and a regular liquidator is 2%, the regular liquidator will bid at 1% (given they have a theoretical 1.1% booster).
- **TWAP**: Euler Finance leverages a tool that calculates mean price over a time interval, in order to protect from flash loan and bot manipulation. C.R.E.A.M. Finance was drained for $25 million on August 30th from a flash loan attack, which is the 2nd time this has happened in this year alone. TWAP is also beneficial because it is hard to manipulate a price on one specific exchange over sustained period of time, especially because arbitrageurs are automatically scanning the aggregate market and can take advantage of price asymmetries very quickly.
- **Multi-Collateral Stability Pools**: Euler aims to internalize the liquidation process by allowing lenders to deposit their interest bearing eTokens into a stability pool, and this pool can be used to liquidate a borrower’s collateral into the stability pool. Liquidators are essentially swapping eTokens for a basket of collateral assets. Advantages of internal liquidations include, no slippage or swap fees, less gas fees, and more accurate liquidation prices.

![enter image description here](https://www.coinbureau.com/wp-content/uploads/2022/07/loan.jpg.webp)

