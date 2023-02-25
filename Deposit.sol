pragma solidity ^0.8.0;

contract DepositContract {
    event Log(string);
    mapping(address => uint256) private deposits;
    uint256 public totalDeposits;

    function deposit() public payable {
        // TO DO
        deposits[msg.sender] = deposits[msg.sender] + msg.value;
        totalDeposits = totalDeposits + msg.value;
        emit Log("Deposit successful.");
    }

    function withdraw() public {
        // TO DO
        if (deposits[msg.sender] > 0) {
            uint256 total = deposits[msg.sender];
            deposits[msg.sender] = 0;
            totalDeposits = totalDeposits - total;
            msg.sender.call{value: total}("");
            emit Log("Withdrawal successful.");
        } 
        else {
            emit Log("Nothing to withdraw.");
        }
    }