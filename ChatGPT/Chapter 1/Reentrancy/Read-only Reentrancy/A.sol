// UNSECURE
contract A {
	// Has a reentrancy guard to prevent reentrancy
	// but makes state change only after external call to sender
	function withdraw() external nonReentrant {
		uint256 amount = balances[msg.sender];
		(bool success,) = msg.sender.call{value: balances[msg.sender]}("");
		require(success);
		balances[msg.sender] = 0;
	}
}

contract B {
	// Allows sender to claim equivalent B tokens for A tokens they hold
	function claim() external nonReentrant {
		require(!claimed[msg.sender]);
		balances[msg.sender] = A.balances[msg.sender];
		claimed[msg.sender] = true;
	}
}
