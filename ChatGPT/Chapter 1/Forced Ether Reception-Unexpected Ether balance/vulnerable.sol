pragma solidity ^0.8.13;

contract Vulnerable {
    receive() external payable {
        revert();
    }

    function somethingBad() external {
        require(address(this).balance > 0);
        // Do something bad
    }
}
