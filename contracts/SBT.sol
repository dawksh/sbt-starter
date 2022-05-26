//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SBT is ERC721 {
    address private admin;

    constructor(
        string memory name,
        address _owner,
        string memory symbol
    ) ERC721(name, symbol) {
        admin = _owner;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721) {
        require(
            msg.sender == admin,
            "NonTransferrableERC721Token: non transferrable"
        );
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function updateOwner(address newOwner) external {
        require(msg.sender == admin, "Not Authorized to transfer adminship");
        admin = newOwner;
    }
}
