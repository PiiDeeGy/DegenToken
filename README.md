# DegenToken

DegenToken is an ERC20 token with additional functionalities for minting, burning, and transferring tokens, along with a virtual gift shop where users can redeem tokens for virtual items.

## Description

DegenToken is a smart contract implemented in Solidity using Remix IDE. It uses OpenZeppelin's ERC20, Ownable, and ERC20Burnable contracts to provide standard token functionality with added features such as token minting by the owner, burning tokens, transferring tokens between addresses, and a gift shop where tokens can be redeemed for virtual items.

## Getting Started

### Installing

1. Clone the repository:
   git clone <repository_url>

2. Navigate to the project directory:
   cd <repository_directory>

3. Install the necessary dependencies:
   npm install
   
## Functions

#### Minting Tokens
Only the contract owner can mint new tokens:
mint(address to, uint256 amount)

#### Burning Tokens
Any user can burn their tokens:
burnTokens(uint256 _value)

#### Transferring Tokens
Users can transfer tokens to other addresses:
transferTokens(address _receiver, uint256 _value)

#### Redeeming Tokens
Users can redeem their tokens for items in the Aviary Gift Shop:
redeemTokens(uint8 input)

#### Viewing Gift Shop Inventory
Users can view the current inventory of the Aviary Gift Shop:
showAviaryGiftShop()

## Help
For common issues or troubleshooting, please do not hesitate to contact me through my email.

## Authors
Angel Cruz - https://github.com/PiiDeeGy
