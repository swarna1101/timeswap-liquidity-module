## Uniswap derived Liquidity Mining Pool POC

The liquidity module lets  possess complete backend utility-flow of simple AMM functionality for liquidity providers and swap requestors.

### Special Characteristics of the Liquidity Module

**1) Universal Swap Price** : All swaps in one batch are executed with one universal swap price

- tx ordering in a block doesn't matter!

**2) Max Swap Price** : Swap requestors can protect themselves from swap execution with significantly higher price

**3) Self-Matched Swap** : Self-matched swaps without consuming liquidity pool pay less fee than pool-matched swaps

- better fair-game for swap users

**4) Passive Swap** : New type of swap which does not consume liquidity from the pool

- providing instant liquidity to the swap market to absorb big swap orders

**5) Dynamic Batch Size** : Extended period of batch size only when significant swap price movement happens

- gives more time for arbitrageurs to participate with passive swap so that they can absorb big swap orders
- in most cases with non-significant swap price movement, it provides one block execution

**6) Alternative Swap Function for Stable vs Stable Pool**

## Liquidity module PoC

###  1) Liquidity module implementation


`LiquidityPool` creation

- Perminssionless
- Unique pool for each token pair
- `BaseToken` : at least one of the token pair should be an element of `BaseTokenList`
- `PoolCreationPrice`(in Atom) : to create a `LiquidityPool` , one needs to pay `PoolCreationPrice`
    - Paid Atoms are sent to `LiquidityFund`
- `PoolToken` creation upon creation of a `LiquidityPool` : representing ownership of shares of a `LiquidityPool`

<br/>

`LiquidityPool` deposit/withdrawal

- `PoolToken` minting(deposit) and burning(withdrawal)
- Transferable `PoolToken` : ownership belongs to the `PoolToken` owner

<br/>

Swap request to a `LiquidityPool`

- Safety features
    - `MaxSwapPrice` : the swap request cancelled if executable swap price exceeds `MaxSwapPrice`
        - `MaxSwapPriceAtoB` : `MaxSwapPrice` for swap request from `TokenA` to `TokenB`
        - `MaxSwapPriceBtoA` : `MaxSwapPrice` for swap request from `TokenB` to `TokenA`
    - `MaxSwapAmtPercent`(%) : the swap request failed if requested swap amount exceeds `MaxSwapAmtPercent`(%) of the `LiquidityPool` amount

<br/>

Fee

- Swap fee
    - `SwapFeeRate`(%) of total executed swap amounts are payed by all matched swaps
    - `LiquidityFeeRate`(%) of total executed swap amounts are payed by the pool-matched swaps
    - it is accumulated in the `LiquidityPool` where the swap happens
- Pool withdraw fee
    - `PoolWithdrawFeeRate`(%) of total withdrawn pool assets are payed to the `LiquidityPool`
    - this is a spam prevention methods to prevent too frequent deposits/withdrawals

<br/>

Swap execution : universal swap ratio for all swap requests

<br/>

Core concept
- every swap request seen as a bid/ask limit order with order price `MaxSwapPriceAtoB`
- unit swap price
- `UnitSwapPriceAtoB` : unit swap price of B from A
- `UnitSwapPriceBtoA` : unit swap price of A from B
- `UnitSwapPriceAtoB` = 1/`UnitSwapPriceBtoA`

    - self-matching
        - one side of swap requests will be completely self-matched with the other side of swap requests with `UnitSwapPrice`, which is not calculated yet
            - `SelfMatchedSwapAmtTokenA` : total amount of self-matched swap amount in `TokenA`
            - `SelfMatchedSwapAmtTokenB` : total amount of self-matched swap amount in `TokenB`
            - `SelfMatchedSwapAmtTokenA` = `SelfMatchedSwapAmtTokenB` * `UnitSwapPriceBtoA`
            - remaining swap amount : the remaining swap request amount which is not self-matched
                - `RemainingA` : remaining swap amount of `TokenA`
                - `RemainingB` : remaining swap amount of `TokenB`
    - constant product equation(CDE)
        - `PoolA` * `PoolB` = ( `PoolA` + `RemainingA` - `RemainingB` * `UnitSwapPriceBtoA` ) * ( `PoolB` + `RemainingB` - `RemainingA` * `UnitSwapPriceAtoB` )
        - `CDEDev` : deviation between left side and right side of CDE (absolute value)
    - pool-matching
        - subset of `RemainingA` or `RemainingB` are matched by pool from calculated `UnitSwapPriceAtoB`
            - pool only can match `RemainingA` with `MaxSwapPrice` ≥ `UnitSwapPriceAtoB`
            - pool only can match `RemainingB` with `MaxSwapPrice` ≥ `UnitSwapPriceBtoA`

<br/>

- Finding `UnitSwapPriceAtoB` : to find `UnitSwapPriceAtoB` which results in smallest `CDEDev`

1. sort swap requests with `UniSwapPriceAtoB`
2. let `UnitSwapPriceAtoB` = `LastSwapPriceAtoB`
- calculate `CDEDev` by processing matching with given `UnitSwapPriceAtoB`
3. let `UnitSwapPriceAtoB` = lowest `MaxSwapPriceAtoB` which is higher than `LastSwapPriceAtoB`
- calculate `CDEDev` by processing matching with given `UnitSwapPriceAtoB`
    - if it decreases from 2)
        - iterate 3) with next lowest `MaxSwapPriceAtoB` until `CDEDev` increases
            - final `UnitSwapPriceAtoB` = the last `MaxSwapPriceAtoB` where `CDEDev` decreases
            - calculate the exact portion of pool-matched amount for the swaps with final `UnitSwapPriceAtoB` so that `CDEDev` becomes zero
            - done
    - if it increases from 2)
        - go to 4)
4. let `UnitSwapPriceBtoA` = highest `MaxSwapPriceAtoB` which is lower than `LastSwapPriceAtoB`
- calculate `CDEDev` by processing matching with given `UnitSwapPriceAtoB`
    - if it decreases from 2)
        - iterate 4) with next highest `MaxSwapPriceAtoB` until `CDEDev` increases
            - final `UnitSwapPriceAtoB` = the last `MaxSwapPriceAtoB` where `CDEDev` decreases
            - calculate the exact portion of pool-matched amount for the swaps with final `UnitSwapPriceAtoB` so that `CDEDev` becomes zero
            - done
    - if it increases from 2)
        - `UnitSwapPriceAtoB` = `LastSwapPriceAtoB`
5. fee deduction
- every self-matched swaps pay `SwapFeeRate`(%) of executed swap amount
- every pool-matched swaps pay `SwapFeeRate`(%)+`LiquidityFeeRate`(%) of executed swap amount
6. swap execution
- all matchable swap requests are executed and unmatched swap requests are removed
