# Existing Liquidity Mining Modules

## 1. Balancer
Balancer is Ethereum-based software that encourages a distributed network of computers to run an exchange.
Balancer is a Decentralized Exchange (DEX), Automated Market Maker (AMM), and  Liquidity Pool protocol designed exclusively for **transferring ERC20** tokens without relying on central institutions. It's a **permissionless platform**, so anyone with a crypto wallet that supports it can use it. Instead of the bid-and-ask mechanism used by centralized exchanges, it utilizes an algorithm to manage orders.

### How does Balancer work?
AMM, or a modernized decentralised exchange, is the Balancer protocol. It determines the asset values by calculating the asset distribution ratio in a specific liquidity pool.
The protocol is controlled by smart contracts rather than a central authority, which ensures that the pool: asset ratio is precise. As a result, each pool in the Balancer can contain up to eight different cryptocurrencies. The Balancer, like other well-known AMM platforms, routes trades via any necessary  liquidity pools in order to provide users with the best possible rate.

As a result, exchanges or swaps could be direct (ETH > BAL) or indirect (ETH > USDT > BAL). Balancer platform users can invest in or build three types of pools: Smart, Shared, and Private.

![enter image description here](https://miro.medium.com/max/1400/1*XmoRGpLkz-EDnh22krqEtw.png)

The Balancer platform, embraced three key user demographics, as shown below:

1.  Providers of liquidity who either contribute to an existing pool or develop their own.
2.  Traders or investors, as well as smart contracts, are sources for BAL token liquidity.
3.  [Arbitrageurs](https://www.pvot.in/blog/spot-future-arbitrage-in-crypto/)  profit on pricing differences between platforms.

### What Makes Balancer Unique?
-   It is comparable to platforms like  [Uniswap](https://www.pvot.in/blog/uniswap-detailed-review/)  and  [Cosmos](https://www.pvot.in/blog/cosmos-atom/)  in terms of functionality, but it has a few unique characteristics that set it apart from the competition. The degree of flexibility and control it gives pool owners is one of the primary differentiators.

## 2.  [**Convexity Protocol**](https://github.com/opynfinance/Convexity-Protocol)

Convexity operates a decentralized liquidity pool. It creates a generalized foundation for tokens, which are fungible ERC-20 tokenized options contracts. Users can create collateralized option contracts and then sell them in the form of tokens. However, as a new notion, it only has a few applications. Liquidity insurance is one of the platform's unique applications. As a result, new traders and liquidity providers can feel more secure.

The main functionality offered by the convexity protocol is as below:

1.  Create oTokens
2.  Keep the oToken vaults sufficiently collateralized
3.  Liquidate the undercollateralized vaults
4.  Exercise the oTokens during the expiry window

## 3.  **[Curve Finance](https://www.pvot.in/blog/curve-finance-crv-a-detailed-review/)**

Curve Finance is an Ethereum-based decentralized exchange. It's built to facilitate trading between cryptocurrencies of similar value and to pay out high annual interest rates on cryptocurrency funds deposited by liquidity providers into Curve Finance. Curve Finance is a [decentralized autonomous organization](https://www.pvot.in/blog/decentralization-autonomous-organization-dao/) with the recent release of its governance token, CRV (DAO).
Curve Finance can be thought of as a collection of several asset pools. All of these pools have the same amount of coins in them. At the moment, three of Curve Finance's seven [pools](https://www.pvot.in/blog/beginners-guide-to-liquidity-pool/) use [stablecoins](https://www.pvot.in/blog/beginners-guide-to-stable-coin/), while the other four use wrapped Bitcoins such as wBTC, renBTC, and sBTC.

### How does it work?
Because Curve is an AMM protocol, a quick explanation of what AMM protocols are will help you understand how Curve works.  
The four main components of the Curve AMM model are:

1.  People who deposit tokens into the Curve liquidity pools are known as liquidity providers.
2.  To create exchange liquidity, liquidity provider tokens are stored in  liquidity pools.
3.  Traders exchange tokens with the  liquidity pool, causing buy and sell pressures that influence token prices.
4.  AMM algorithms efficiently price tokens in the liquidity pool based on a variety of criteria, such as trader buy and sell pressures.
    ![enter image description here](https://miro.medium.com/max/828/1*hQmKq38r_u9GqWHp1mjo7Q.png)

Curve uses a different algorithm than other Uniswap exchanges. It is concerned with minimizing spills, whereas the others are concerned with increased liquidity. Curve allows bulk traders to save more money.
To put it another way, Curve crowdsources liquidity, utilizes algorithms to decide the values of liquidity pool assets, and then employs smart contracts to allow traders to trade with the pool.

## 4.  **[Bancor](https://www.pvot.in/blog/bancor-bnt-a-detailed-review/)**

Bancor is software designed to encourage users to pool their crypto assets in exchange for a part of the fees paid by traders when they buy and sell them.

Bancor is seeking to make the functioning of an automated market maker (AMM) easier by doing so.Simply said, AMMs like Bancor are attempting to increase the liquidity of more niche crypto-asset markets by incentivising users to create and manage asset pools.

###  What Makes Bancor Unique?
Bancor enables the frictionless exchange of network tokens. This eliminates the requirement for a third-party platform or an exchange. The protocol also supports a number of self-governing pools for the network's supported coins.

### How does Bancor work?
Bancor wants to entice customers to deposit money into pools so that its AMM service can be automated. Each pool is equipped with a pair of tokens as well as a BNT coin reserve.

When a user deposits coins into a pool, they receive a new token. This token is known as a pool token, and it allows the user to retrieve the amount that they initially locked in the protocol. BNT tokens are used as an intermediary currency when each token is traded.

Bancor, for example, lets customers lock a single token in one of its pools (as opposed to a pair). To gain access to the pool in some AMMs, for example, a user may be required to lock up pairs of tokens in specific proportions.![enter image description here](https://lh5.googleusercontent.com/lBu_KTu9sVO5EY5I1QL9GgBe3OG30EXZyg1pUUK9d272CNFdK8NWggcMEtqjigB5m7j5wdFzIxbMwxn7ExV5xUTjdDKNO_4DR7WTqqMVBSs0WRHmVe5kN3J1q2zkhdrKSV1nwpo8)

### Pros and Cons
|Pros  | Cons |
|--|--|
|Bancor uses a one-of-a-kind model that eliminates bids, asks, market makers, and takers.  | Bancor isn't for anyone who isn't familiar with Ethereum's environment. |
|As a result of the unique business strategy, there is reduced counterparty risk.|There is no support for fiat currencies.|
|On the Bancor network, a considerable number of ERC20 tokens are supported.|The interface comprises of a simple order box and there is no trading platform supplied.
-----

## 5.  **[Uniswap](https://www.pvot.in/blog/uniswap-detailed-review/)**

### What is Uniswap?
Uniswap is a leading cryptocurrency asset exchange that operates on the Ethereum blockchain. It is distinct from traditional exchanges in that it proposes a fully disintermediated, decentralized ecosystem in which no single entity is permitted to own, control, or operate its network. Furthermore, Uniswap employs a relatively new trading model known as an automated liquidity protocol, which eliminates the need for trusted intermediaries and prioritizes decentralisation and security.
Because it is based on Ethereum, Uniswap is fully compatible with all ERC-20 tokens as well as other Ethereum infrastructures such as wallet services like Metamask and MyEtherWallet. Furthermore, the Uniswap platform is completely open-source, which means that anyone, for example, Sushiswap, can essentially copy its codebase and redeploy it to create a similar DeFi protocol. It is straightforward, anonymous, and simple to use.

###  How does it work?
Uniswap is a decentralised exchange that operates as an "automated market maker" (AMM). Smart contracts (programs written on the blockchain) are used by AMMs to set prices and execute trades. Because they are decentralised, these exchanges do not have a centralised governing body that manages orders. They can provide decentralised financial services, also known as DeFi. Because of their liquidity pools, AMMs such as Uniswap can offer crypto trading. A liquidity pool is a collection of user-contributed crypto funds that are locked in a smart contract. When people want to trade cryptocurrency, they use funds from the liquidity pool.

Uniswap deducts a small fee from each transaction and distributes it among the liquidity providers in a pool (the people who have deposited their crypto into the pool). It's a win-win situation for both parties. Because of its liquidity providers, Uniswap is able to offer crypto trading, and its liquidity providers earn crypto because they all receive a cut of the exchange's transaction fees.

![enter image description here](https://docs.uniswap.org/assets/images/anatomy-82d82239e5417e36ca9da17d14961434.jpg)

### Pros and Cons
|Pros|Cons  |
|--|--|
| The Internet Computer provides a decentralised, censorship-free framework. | In just a few days of trading, ICP has seen large jumps and sharp declines, making it extremely volatile and susceptible to fluctuations. |
|The Internet Computer is open to the public and can be accessed by anyone in the world.|Regardless of technological advancements, ICP is not significantly different from other altcoins.|
|Internet Computer began its journey with significant investor interest, charting the course from the start.|Its decentralisation and permissionless transactions are fraught with uncertainty.|
|ICP is available on the majority of cryptocurrency exchanges.|The future of ICP and the network is based on possibilities rather than certainties.|
|Since their introduction, Internet Computer and ICP have gotten a lot of attention.||
|Development is supported by a strong and stable team.||
|Smart contracts are supported, and more can be added in the future.
---
