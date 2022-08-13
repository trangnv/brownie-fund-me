// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

// smart contract lets anyone to deposit ETH into the contract, with minimum amount require
// only owner can withdraw ETH

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    // SafeMath function
    using SafeMathChainlink for uint256;

    // mapping which address deposit how much
    mapping(address => uint256) public addressToAmountFunded;

    // array stores all addresses funded
    address[] public funders;

    // address of the owner of the contract
    address public owner;

    // constructor, declare the owner as one who deploys the contract
    // also declare the priceFeed contract
    constructor (address _priceFeed) public {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    // fund function, anyone can call this function to deposit ETH to the contract
    function fund() public payable {
        // minimum amount is 50USD
        uint256 minimumUSD = 50 * 1e18;

        // check amount funded
        require(getConversionRate(msg.value) >= minimumUSD, "Amount funded not enough");

        // requirement fullfilled, store to funders and amount mapping
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    // function to get the version of the chainlink priceFeed
    function getVersion() public view returns (uint256) {
        return priceFeed.version();
    }

    // function to get ETH price
    function getPrice() public view returns (uint256) {

    }

    // function to get conversion rate from ETH to USD
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {

    }

    // require msg.sender to be owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // withdraw function, can only called by owner, withdraw all ETH from the contract
    function withdraw() public payable onlyOwner {

    }

}