// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadHorseStore() public view {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }

    function testWriteHorseStore() public {
        uint256 num = 777;
        horseStore.updateNumberOfHorses(num);
        assertEq(horseStore.readNumberOfHorses(), num);
    }
}
