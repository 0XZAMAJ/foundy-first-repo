// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithDrawFundMe} from "../../script/Interaction.s.sol";

contract InteractionTest is Test{
    uint256 number = 1;
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 SEND_VALUE = 0.1 ether;
    uint256 STARTING_BALANCE = 10 ether;
    uint256 GAS_PRICE = 1;

    function setUp() external {
    DeployFundMe deployFundMe = new DeployFundMe();
    fundMe = deployFundMe.run();
    vm.deal(USER, STARTING_BALANCE);
    } 

    function testUserCanFund() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        WithDrawFundMe withdrawFundMe = new WithDrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));

        assert(address(fundMe).balance == 0);
        


    }
}