// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import "src/interfaces/ILFT.sol";

/**
 * @notice Users receive protection tokens when purchasing protection. Each protection token contract is associated
 * with a single market, and protection tokens are minted to a user proportional to the amount of protection they
 * purchase. When a market triggers, protection tokens can be redeemed to claim assets.
 */
interface IPToken is ILFT {
  /// @notice Version number of this implementation contract.
  function VERSION() external view returns (uint256);

  /// @notice Address of the Cozy protocol manager.
  function manager() external view returns (address);

  /// @notice The set this token is for. Markets in a set are uniquely identified by their trigger.
  function set() external view returns (address);

  /// @notice The trigger this token is for. Markets in a set are uniquely identified by their trigger.
  function trigger() external view returns (address);

  /// @notice Mints `_amount` of tokens to `_to`.
  function mint(address _to, uint256 _amount) external;

  /// @notice Burns `_amount` of tokens from `_from`.
  function burn(address _from, uint256 _amount) external;

  /// @notice Sets the allowance such that the `_spender` can spend `_amount` of `_owner`s tokens.
  function setAllowance(address _owner, address _spender, uint256 _amount) external;

  /// @notice Returns the balance of matured tokens held by `_user`.
  function balanceOfMatured(address _user) external view returns (uint256);

  function DOMAIN_SEPARATOR() external view returns (bytes32);
  function allowance(address, address) external view returns (uint256);
  function approve(address spender, uint256 amount) external returns (bool);
  function balanceOf(address) external view returns (uint256);
  function decimals() external view returns (uint8);
  function mints(address, uint256) external view returns (uint128 amount, uint64 time, uint64 delay);
  function name() external view returns (string memory);
  function nonces(address) external view returns (uint256);
  function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
    external;
  function symbol() external view returns (string memory);
  function totalSupply() external view returns (uint256);
  function transfer(address _to, uint256 _amount) external returns (bool);
  function transferFrom(address _from, address _to, uint256 _amount) external returns (bool);
}
