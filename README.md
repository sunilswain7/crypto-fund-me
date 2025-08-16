***


# 🚀 Foundry Fund Me

> A minimal Foundry + Solidity project that allows users to fund the contract owner in ETH, with donations valued in USD through Chainlink price feeds.




<p align="center">
  <a href="https://github.com/sunilswain7/crypto-fund-me"><img src="https://img.shields.io/github/license/sunilswain7/crypto-fund-me?style=flat-square"></a>
  <a href="https://github.com/foundry-rs/foundry"><img src="https://img.shields.io/badge/Foundry-Ready-orange?style=flat-square&logo=ethereum"></a>
  <a href="https://soliditylang.org/"><img src="https://img.shields.io/badge/Solidity-%5E0.8.18-blue?style=flat-square&logo=solidity"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red?style=flat-square"></a>
</p>

---

## 📜 About

This smart contract:
- Accepts ETH donations **denominated in USD**.
- Uses a **Chainlink price feed** for ETH/USD conversion.
- Rejects donations **below the minimum USD threshold**.
- Keeps track of all funders for potential future rewards.

---

## 📑 Table of Contents
- [Getting Started](#-getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Optional Gitpod](#optional-gitpod)
- [Usage](#-usage)
  - [Deploy](#deploy)
  - [Testing](#testing)
    - [Test Coverage](#test-coverage)
- [Deployment to a Testnet or Mainnet](#-deployment-to-a-testnet-or-mainnet)
  - [Scripts](#scripts)
  - [Withdraw](#withdraw)
  - [Estimate Gas](#estimate-gas)
- [Formatting](#-formatting)

---

## 🚀 Getting Started

### Requirements
- [git](https://git-scm.com/)
- [foundry](https://getfoundry.sh/)

Check installation:
```

git --version
forge --version

```

---

### Quickstart
```

git clone https://github.com/sunilswain7/crypto-fund-me
cd crypto-fund-me
make

```

---

### Optional Gitpod
If you prefer not to install locally:
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#github.com/sunilswain7/crypto-fund-me)

---

## 📦 Usage

### Deploy
```

forge script script/DeployFundMe.s.sol

```

---

### Testing
We use:
1. **Unit Tests**
2. **Forked Tests**

Run all tests:
```

forge test

```
Specific test:
```

forge test --match-test testFunctionName

```
Forked test:
```

forge test --fork-url \$SEPOLIA_RPC_URL

```

---

### Test Coverage
```

forge coverage

```

---

## 🌐 Deployment to a Testnet or Mainnet

### Step 1: Environment Variables
Create `.env`:
```

PRIVATE_KEY=your_wallet_private_key
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your-api-key
ETHERSCAN_API_KEY=your_etherscan_key

```
> ⚠ **Use test wallets only.**

---

### Step 2: Get Testnet ETH
Use [faucets.chain.link](https://faucets.chain.link/).

---

### Step 3: Deploy
```

forge script script/DeployFundMe.s.sol \
--rpc-url \$SEPOLIA_RPC_URL \
--private-key \$PRIVATE_KEY \
--broadcast \
--verify \
--etherscan-api-key \$ETHERSCAN_API_KEY

```

---

## 🛠 Scripts

Fund the contract:
```

cast send <FUNDME_CONTRACT_ADDRESS> "fund()" \
--value 0.1ether \
--private-key \$PRIVATE_KEY

```

Fund via Forge script:
```

forge script script/Interactions.s.sol:FundFundMe \
--rpc-url sepolia \
--private-key \$PRIVATE_KEY \
--broadcast

```

Withdraw:
```

cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()" \
--private-key \$PRIVATE_KEY

```

---

## ⚡ Estimate Gas
```

forge snapshot

```

---

## 🎨 Formatting
```

forge fmt

```

---
