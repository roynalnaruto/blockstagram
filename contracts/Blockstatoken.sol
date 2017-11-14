pragma solidity 0.4.15;

import "../node_modules/zeppelin-solidity/contracts/token/MintableToken.sol";

contract Blockstatoken is MintableToken {

  string public name = "BlockstaToken";
  string public symbol = "BST";
  uint256 public decimals = 2;
}
