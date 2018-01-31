pragma solidity ^0.4.18;

import "../node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract CustomOwnables is Ownable {
  address public bank;
  address public localGvt;


    /**
    * @dev Throws if called by any account other than the bank.
    * only the bank can tokenise, delay token expiry and burn tokens
    */
    modifier onlyBank() {
        require(msg.sender == bank);
        _;
    }

    /**
    * @dev Throws if called by any account other than local government.
    * only local government can manage refugee details
    */
    modifier onlyLocalGvt() {
        require(msg.sender == localGvt);
        _;
    }

  function setBankAddress(address _bankAddress) public onlyOwner {
    bank = _bankAddress;
  }

  function setLocalGvtAddress(address _localGvtAddress) public onlyOwner {
    localGvt = _localGvtAddress;
  }

}
