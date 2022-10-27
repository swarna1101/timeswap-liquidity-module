// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";

contract Staking is ERC1155Holder {
    using SafeERC20 for IERC20;

    IERC1155 public liqToken;
    IERC20 private token;

    uint256 constant secs = 60;
    uint256 constant denominator = 100;

    event liqTokenstaked(
        address indexed owner,
        uint256 id,
        uint256 amount,
        uint256 time
    );
    event liqTokenunstaked(
        address indexed owner,
        uint256 id,
        uint256 amount,
        uint256 time,
        uint256 rewardTokens
    );

    struct Staker {
        uint256 tokenId;
        uint256 timestamp;
        uint256 amount;
    }

    mapping(address => Staker) public stakesMapping;

    constructor(address _token, address _liqToken) {
        token = IERC20(_token);
        liqToken = IERC1155(_liqToken);
    }

    // Function to stake liqTokens.

    function stakeliqToken(uint256 _tokenId, uint256 _amount) external {
        require(
            stakesMapping[msg.sender].tokenId == 0,
            "You have already staked!"
        );
        require(
            liqToken.balanceOf(msg.sender, _tokenId) >= _amount,
            "Insufficient Balance!"
        );

        stakesMapping[msg.sender] = Staker(_tokenId, _amount, block.timestamp);
        liqToken.safeTransferFrom(
            msg.sender,
            address(this),
            _tokenId,
            _amount,
            "0x00"
        );

        emit liqTokenstaked(msg.sender, _tokenId, _amount, block.timestamp);
    }

    // Function to unstake the liqTokens and distribute timeswapToken are rewards.
    // Reward Tokens = Staked Amount / denominator

    function unstakeliqToken(uint256 _tokenId, uint256 _amount) external {
        require(
            stakesMapping[msg.sender].tokenId == _tokenId,
            "TokenId does not match!"
        );
        require(
            stakesMapping[msg.sender].amount >= _amount,
            "Staked Amount is not sufficient!"
        );

        stakesMapping[msg.sender].amount -= _amount;
        liqToken.safeTransferFrom(
            address(this),
            msg.sender,
            _tokenId,
            _amount,
            "0x00"
        );

        uint256 timeElapsed = block.timestamp -
        stakesMapping[msg.sender].timestamp;
        uint256 rewardTokens = (_calculateRate() *
        _amount *
        10**18) / (secs * denominator);

        token.safeTransfer(msg.sender, rewardTokens);

        emit liqTokenunstaked(
            msg.sender,
            _tokenId,
            _amount,
            block.timestamp,
            rewardTokens
        );
    }

    // Function to calculate Reward Rate in percentage

    function _calculateRate() internal view returns (uint256) {
        uint256 timeElapsed = block.timestamp -
        stakesMapping[msg.sender].timestamp;
        uint256 allowedPercent;

        for(uint8 i = 0; i < secs; i++){
            if(timeElapsed>=i){
                 allowedPercent=i;
            }
        }
        return allowedPercent;
    }
}