//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ECR20Token is ERC20 {
    constructor() ERC20("ERC20TK", "ETK") {
        _mint(msg.sender, 10000 * 10**decimals());
    }

    function mint(uint256 _supply) public {
        _mint(msg.sender, _supply);
    }
}
