// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.6;
import '../../v4-core/interfaces/IDrawBeacon.sol';
import '../../v4-core/interfaces/IDrawBuffer.sol';
import './IPrizeDistributionFactory.sol';
import './IDrawCalculatorTimelock.sol';

/**
 * @title  PoolTogether V4 IReceiverTimelockTrigger
 * @author PoolTogether Inc Team
 * @notice The IReceiverTimelockTrigger smart contract interface...
 */
interface IReceiverTimelockTrigger {
  /// @notice Emitted when the contract is deployed.
  event Deployed(
    IDrawBuffer indexed drawBuffer,
    IPrizeDistributionFactory indexed prizeDistributionFactory,
    IDrawCalculatorTimelock indexed timelock
  );

  /**
   * @notice Emitted when Draw is locked, pushed to Draw DrawBuffer and totalNetworkTicketSupply is pushed to PrizeDistributionFactory
   * @param drawId Draw ID
   * @param draw Draw
   * @param totalNetworkTicketSupply totalNetworkTicketSupply
   */
  event DrawLockedPushedAndTotalNetworkTicketSupplyPushed(
    uint32 indexed drawId,
    IDrawBeacon.Draw draw,
    uint256 totalNetworkTicketSupply
  );

  /**
   * @notice Locks next Draw, pushes Draw to DraWBuffer and pushes totalNetworkTicketSupply to PrizeDistributionFactory.
   * @dev    Restricts new draws for N seconds by forcing timelock on the next target draw id.
   * @param draw Draw
   * @param totalNetworkTicketSupply totalNetworkTicketSupply
   */
  function push(IDrawBeacon.Draw memory draw, uint256 totalNetworkTicketSupply) external;
}
