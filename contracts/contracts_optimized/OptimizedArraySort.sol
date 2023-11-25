// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

error MaxUint();

contract OptimizedArraySort {
    // gas used: 27719
    function sortArray(uint256[] calldata data) external pure returns (uint256[] memory _data) {
        // require(data.length < type(uint256).max); // 27742
        unchecked {
            _data = data;
            for (uint256 i; i < data.length; ++i) {
                for (uint256 j = i+1; j < data.length; ++j) {
                    if(_data[i] > _data[j]){
                        uint256 temp = _data[i];
                        _data[i] = _data[j];
                        _data[j] = temp;
                    }
                }
            }
        }
    }


}
