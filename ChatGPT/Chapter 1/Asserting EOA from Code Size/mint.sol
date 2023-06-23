function mint(uint256 amount) public {
  if (msg.sender.code.length != 0) revert CallerNotEOA();
}
