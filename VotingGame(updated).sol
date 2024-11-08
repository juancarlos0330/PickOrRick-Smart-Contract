//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

contract VotingGame {
    using SafeMath for uint256;
    
    address private _Rick;
    address public teamWallet = 0x073a6B869E35D5c1C3283F7FD3858f9D96292b56;
    uint256 public gameIndex = 0; //index to keep track of the games

    mapping(uint256=> uint256) public PickTotal; // GameID, Pick Total amount
    mapping(uint256=> uint256) public RickTotal; // GameID, Rick Total amount
    mapping(uint256 => uint256) public gamesEndAt; // GameId => gameSystem
    mapping(uint256 => mapping(address => uint256)) public userVotedAmount; // gameId => user address => voted amount
    mapping(uint256 => mapping(address => bool)) public userVotedJar; // gameId => user address => Pick Jar or Rick Jar (true : pick, false: rick)
    mapping(uint256 => mapping(address => bool)) public voted; // gameId => user address => voted (user can voete once)

    mapping(address => uint256) public userRewards; // user => rewards (this value is allocated in this system)
    
    mapping(uint256 => bool) public winningJar; // gameId => bool (winner history per game)
    mapping(uint256 => mapping(bool => uint256)) public winnigPercent; // gameId => Jar => percent

    address[] public pick_addresses; // Pick
    address[] public rick_addresses;// Rick

    uint256 private gameDuration = 5 minutes; // Voting game duration 1 hour
    
    bool public gameStarted = false;

    address public admin;

    event GameStarted(uint256);
    event UserVoted(address _caller, uint256 _amount, bool _jar);
    event GameEnded(uint256);
    event SetTeamWalletAddress(address _teamWalletAddress);
    event JudgmentGame(uint256 gIndex, bool _jar);
    event JudgmentGamePercent(uint256 gIndex, uint256 pickPercent, uint256 rickPercent);
    event CalculateReward(address teamWalletAddress, uint256 _amount);
    event WithdrawRewards(address _caller, uint256 _rewardAmount);

    constructor(address _RICKTOKEN) {
        admin = payable(msg.sender);
        _Rick = _RICKTOKEN;
    }

    modifier onlyOwner {
        require(admin == msg.sender);
        _;
    }

    function createGame() public onlyOwner {
        require(!gameStarted, "Game is already started");
        gameStarted = true;
        gameIndex++;

        gamesEndAt[gameIndex] = block.timestamp + gameDuration;

        pick_addresses = new address[](0);
        rick_addresses = new address[](0);

        emit GameStarted(gameIndex);
    }

    function vote(uint256 _amount, bool _jar) external {
        require(gameStarted, "Game is not started");
        require(_amount > 0, "You can't vote with 0 amount");
        require(!voted[gameIndex][msg.sender], "You already voted");

        voted[gameIndex][msg.sender] = true;
        userVotedAmount[gameIndex][msg.sender] = _amount;
        userVotedJar[gameIndex][msg.sender] = _jar; // True Pick, False Rick

        if(_jar) {
            PickTotal[gameIndex] += _amount;
            pick_addresses.push(msg.sender);
            require(IERC20(_Rick).transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        } else {
            RickTotal[gameIndex] += _amount;
            rick_addresses.push(msg.sender);
            require(IERC20(_Rick).transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        }

        emit UserVoted(msg.sender, _amount, _jar);
    }

    function EndGame() public onlyOwner {
        require(gameStarted, "Game is not started");
        require(block.timestamp > gamesEndAt[gameIndex], "Game is not Ended");

        gameStarted = false;
        judgment();
        judgmentPercent();
        cacluateReward();

        emit GameEnded(gameIndex);
    }

    function setTeamwallet(address _newTeamwallet) public onlyOwner {
        teamWallet = _newTeamwallet;

        emit SetTeamWalletAddress(_newTeamwallet);
    }

    function judgment() internal {
        uint256 _totalPick = PickTotal[gameIndex];
        uint256 _totalRick = RickTotal[gameIndex];

        if(_totalPick > _totalRick) {
            winningJar[gameIndex] = true;
            emit JudgmentGame(gameIndex, true);
        } else if (_totalPick < _totalRick){
            winningJar[gameIndex] = false;
            emit JudgmentGame(gameIndex, false);
        }
    }

    function judgmentPercent() internal {
        uint256 _pickPercent;
        uint256 _rickPercent;
        
        uint256 _totalPick = PickTotal[gameIndex];
        uint256 _totalRick = RickTotal[gameIndex];

        _pickPercent = _totalPick * 100 / (_totalPick+_totalRick);
        _rickPercent = _totalRick * 100 / (_totalPick+_totalRick);

        winnigPercent[gameIndex][true] = _pickPercent;
        winnigPercent[gameIndex][false] = _rickPercent;

        emit JudgmentGamePercent(gameIndex, _pickPercent, _rickPercent);
    }

    function cacluateReward() internal {
        uint256 _totalPick = PickTotal[gameIndex];
        uint256 _totalRick = RickTotal[gameIndex];

        if(_totalPick > _totalRick) {
            IERC20(_Rick).transfer(teamWallet, _totalRick * 1 / 10); // 10% transfer to teamwallet
            for(uint i = 0; i < pick_addresses.length; i++) {
                uint256 _countributionPercent =  userVotedAmount[gameIndex][pick_addresses[i]] * 100 / _totalPick; // address's contribution
                uint256 _myRewards = _countributionPercent * _totalRick * 9 / 1000;
                userRewards[pick_addresses[i]] += _myRewards + userVotedAmount[gameIndex][pick_addresses[i]];
            }
            _totalRick = 0;

            emit CalculateReward(teamWallet, _totalRick * 1 / 10);
        } else if(_totalPick < _totalRick) {
            IERC20(_Rick).transfer(teamWallet, _totalPick * 1 / 10); // 10% transfer to teamwallet
            for(uint i = 0; i < rick_addresses.length; i++) {
                uint256 _countributionPercent =  userVotedAmount[gameIndex][rick_addresses[i]] * 100 / _totalRick; // address's contribution
                uint256 _myRewards = _countributionPercent * _totalPick * 9 / 1000;
                userRewards[rick_addresses[i]] += _myRewards + userVotedAmount[gameIndex][rick_addresses[i]];
            }
            _totalPick = 0;
            emit CalculateReward(teamWallet, _totalPick * 1 / 10);
        }
    }

    function withdrawMyRewards() external {
        uint256 _rewards = userRewards[msg.sender];
        require(_rewards > 0, "You don't have rewards");

        IERC20(_Rick).transfer(msg.sender, _rewards);
        userRewards[msg.sender] -= _rewards;

        emit WithdrawRewards(msg.sender, _rewards);
    }
}