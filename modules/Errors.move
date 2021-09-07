// Copyright 2021 Solarius Intellectual Properties Ky
// Authors: Ville Sundell
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

address {{sender}} {

/// This is to improve our error handling, and to make it more informative.
///
/// We follow the "category" approach of Diem Standard Library, with
/// additional "subcategory" for different taos.
/// Subcategories start from 1, so a TaoHe error message can be
/// distinguished from other error messages by:
///     category == 0x80 and subcategory >= 0x01.
module Errors {
    // We define our own category (0x80)
    const CATEGORY_TAOHE: u8 = 128;

    const TAO_GENERAL: u8 = 1;
    const TAO_TIMELOCK: u8 = 2;
    const TAO_OWNABLE: u8 = 3;

    /// Adapted from Diem Standard Library's Errors.move.
    /// Added tao identifier.
    fun make(tao_id: u8, reason: u64): u64 {
        (reason << 16) | ((tao_id as u64) << 8) | (CATEGORY_TAOHE as u64)
    }
    spec make {
        // Result cannot be verified at the moment:
        // https://github.com/diem/diem/issues/8303
    }

    /// This is used for general TaoHe errors, not part of any specific module.
    public fun general(reason: u64): u64 { make(TAO_GENERAL, reason) }
    spec general {
        // Result cannot be verified at the moment:
        // https://github.com/diem/diem/issues/8303
    }

    /// This code is used by Timelock.move when unlock time haven't passed yet.
    public fun timelock_too_early(): u64 { make(TAO_TIMELOCK, 15) }
    spec timelock_too_early {
        // Result cannot be verified at the moment:
        // https://github.com/diem/diem/issues/8303
    }

    /// This code is used by Ownable.sol when the `account` is not the owner.
    public fun ownable_not_owned(): u64 { make(TAO_OWNABLE, 15) }
    spec ownable_not_owned {
        // Result cannot be verified at the moment:
        // https://github.com/diem/diem/issues/8303
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}
}