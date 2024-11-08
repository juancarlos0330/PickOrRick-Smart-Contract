// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._ 
     */
    function tryAdd(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
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
    function trySub(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
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
    function tryMul(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
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
    function tryDiv(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
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
    function tryMod(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
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
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
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
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
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
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

contract Presale {
    using SafeMath for uint256;

    // Sale end timestamp
    uint256 public saleEnd;

    address payable public _owner;

    address[] private owners;
    mapping(address => bool) private ownerExists;

    // Mapping to keep track of tokens purchased per user
    mapping(address => uint256) public purchasedTokens;

    uint256 totalETH;

    constructor(uint256 _saleDuration) {
        saleEnd = block.timestamp.add(_saleDuration);
        _owner = payable(msg.sender);
        owners.push(_owner);
        ownerExists[_owner] = true;
    }

    function addDuration(uint256 _saleDuration) public {
        require(msg.sender == _owner, "Only admin can add new duration");
        saleEnd = block.timestamp.add(_saleDuration);
    }

    // Function to buy token
    function buyTokens() public payable {
        require(saleEnd > block.timestamp, "Presale is over" );
        require(totalETH + msg.value <= 222000000000000000000, "Total Amount is over");
        purchasedTokens[msg.sender] = purchasedTokens[msg.sender].add(msg.value);
        totalETH = totalETH + msg.value;
    }
    
    function renouncesOwnership(address _newOwner) public {
        require(existsOwner(msg.sender), "Only the contract owner can access");
        require(!ownerExists[_newOwner], "Owner already exists");
        owners.push(_newOwner);
        ownerExists[_newOwner] = true;
    }

    function existsOwner(address _newOwner) private view returns (bool) {
        bool existVar;
        for(uint256 i = 0; i < owners.length; i ++) {
            if(owners[i] == _newOwner) {
                existVar = true;
            }
        }
        return existVar;
    }
    
    function withdraw() public {
        require(ownerExists[msg.sender], "Only the contract owner can withdraw ETH");
        uint256 balance = address(this).balance;
        _owner.transfer(balance);
        totalETH = 0;
    }

    function withdrawToAddress(address payable _addr, uint256 _amount) public {
        require(msg.sender == _owner, "Only the contract owner can send ETH to address");
        require(address(this).balance >= _amount, "The Amount should less than balance");

        _addr.transfer(_amount);
        totalETH = totalETH.sub(_amount);
    }

    receive() external payable {
        // code to execute when Ether is sent to the contract
    }

    function getBalance() public view returns (uint256) {
        return totalETH;
    }

    // transfer Ownership
    function transferOwnerShip(address payable _newOwner) public {
        require(existsOwner(msg.sender), "Only the contract owner can access");
        require(!ownerExists[_newOwner], "Owner already exists");
        _owner = _newOwner;
        owners.push(_newOwner);
        ownerExists[_newOwner] = true;
    }
}