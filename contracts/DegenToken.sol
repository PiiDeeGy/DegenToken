// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens.");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens.");
        burn(_value);
    }

    struct GiftShopInventory {
        uint TokensNeeded;
        string GSItem;
        bool RedeemStatus;
    }

    GiftShopInventory[] private AviaryGiftShop;

    constructor() ERC20("Degen", "DGN") Ownable() {
        AviaryGiftShop.push(GiftShopInventory(100, "Purple Owl Plushie", false));
        AviaryGiftShop.push(GiftShopInventory(250, "Cosmic Owl King Artboard", false));
        AviaryGiftShop.push(GiftShopInventory(500, "Royal Owlbear Nightwatcher Commission", false));
        AviaryGiftShop.push(GiftShopInventory(1000, "Duke Crossthorne the Fledgling Pixel GIF", false));
    }

    function redeemTokens(uint8 input) external payable returns (string memory) {
        bool isValidInput = (input >= 0 && input < 4);
        bool isRedeemed = AviaryGiftShop[input].RedeemStatus;
        uint256 TokenCost = AviaryGiftShop[input].TokensNeeded;
        bool hasEnoughTokens = balanceOf(msg.sender) >= TokenCost;

        if (!isValidInput) {
            revert("Invalid Input.");
        }

        if (isRedeemed) {
            revert("This item is already redeemed.");
        }

        if (!hasEnoughTokens) { 
            revert("You do not have enough Degen Tokens.");
        }

        approve(msg.sender, TokenCost);
        transferFrom(msg.sender, owner(), TokenCost);
        AviaryGiftShop[input].RedeemStatus = true;
        return string.concat(AviaryGiftShop[input].GSItem, " has been redeemed!");
    }

    function showAviaryGiftShop() public view returns (string memory) {
        string memory AGSinventory = "";

        for (uint8 i = 0; i < 4; i++) {
            string memory itemDetails = string.concat(
                "   ", 
                Strings.toString(i), 
                ". ", 
                AviaryGiftShop[i].GSItem
            );
            AGSinventory = string.concat(AGSinventory, itemDetails);
        }

        return AGSinventory;
    }

}
