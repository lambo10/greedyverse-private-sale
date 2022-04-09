// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


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


contract GVERSE_PrivateSale {
    using SafeMath for uint256;

    address public contract_add = 0x8B852C7a7d54A5F63742Ca3a1DAFED5D7d74e2A2;
    IERC20 public token = IERC20(contract_add);  // token

    address payable public owner;
    bool public startSales = false;
    bool public week1Claim = false;
    bool public week2Claim = false;
    bool public week3Claim = false;
    bool public week4Claim = false;
    bool public claim = false;
    uint256 public firstRelease_percentage = 70;
    uint256 public release_percentage = 10;
    uint public rate;

    mapping (address  => uint256) public participants;
    mapping (address => uint256) public released;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(startSales,"Private sale has not started");
        uint256 amount = msg.value;
        participants[msg.sender] = amount.mul(rate);
    }

   function getGVERSEtoClaim(address claimAddress) public view returns (uint256){
       return participants[claimAddress];
   }

   function tokenTransfer() public {
        require(claim,"Tokens can not be claimed now");
        require(participants[msg.sender] > 0,"Address did not participate in private sale");
        uint256 amount_to_recive = (participants[msg.sender].div(50)).mul(35);
        if(week1Claim && !week2Claim && !week3Claim){
            if(released[msg.sender] == 0){
                amount_to_recive = ((participants[msg.sender].div(50)).mul(35)).add(participants[msg.sender].div(10));
            }else{
                amount_to_recive = participants[msg.sender].div(10);
            }
        }else if(week2Claim && !week3Claim){
            if(released[msg.sender] == 0){
                amount_to_recive = ((participants[msg.sender].div(50)).mul(35)).add((participants[msg.sender].div(10)).mul(2));
            }else{
                amount_to_recive = participants[msg.sender].div(10);
            }
        }else if(week3Claim){
            if(released[msg.sender] == 0){
                amount_to_recive = ((participants[msg.sender].div(50)).mul(35)).add((participants[msg.sender].div(10)).mul(3));
            }else{
                amount_to_recive = participants[msg.sender].div(10);
            }
        }
        uint256 finalAmountToRelease = (amount_to_recive.div(1000000000000000000)).mul(1000000000);
        released[msg.sender] = released[msg.sender].add(finalAmountToRelease);
        token.transfer(msg.sender, finalAmountToRelease);
    }

    function transferAllToken() public {
        require(msg.sender == owner, "Only owner can withdraw funds"); 
        token.transfer(owner, token.balanceOf(address(this)));
    }
    
    function notPayable() public {}

    modifier onlyOwner(){
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function releasable () public view returns (uint256) {
        return participants[msg.sender];
    }

    function all_ready_released () public view returns (uint256) {
        return released[msg.sender];
    }

    function contractTokenBalance () public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function contractBalance () public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawAll() public onlyOwner{
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    function withdraw(uint amount) public onlyOwner{
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

      function endSale() public onlyOwner{
        startSales = false;
    }
    
    function startSale() public onlyOwner{
        startSales = true;
    }

    function setRate(uint newRate) public onlyOwner{
        rate = newRate;
    }

     function startClaim(bool _week1Claim,bool _week2Claim,bool _week3Claim,bool _week4Claim) public onlyOwner{
        claim = true;
        week1Claim = _week1Claim;
        week2Claim = _week2Claim;
        week3Claim = _week3Claim;
        week4Claim = _week4Claim;
    }

    function endClaim() public onlyOwner{
        claim = false;
    }
    

}
