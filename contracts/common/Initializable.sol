pragma solidity ^0.4.18;


contract Initializable {
    uint256 private initializationBlock;

    modifier onlyInit {
        require(initializationBlock == 0);
        _;
    }

    /**
    * @return Block number in which the contract was initialized
    */
    function getInitializationBlock() public view returns (uint256) {
        return initializationBlock;
    }

    /**
    * @dev Function to be called by top level contract after initialization has finished.
    */
    function initialized() internal onlyInit {
        initializationBlock = getBlockNumber();
    }

    function getBlockNumber() internal view returns (uint256) {
        return block.number;
    }
}
