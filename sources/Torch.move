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


/// A dummy resource for testing and development purposes.
/// Can be passed along like.. ..a torch.
/// This is not technically a tao, since it can't contain
/// other taos.
module TaoHe::Torch {
    /// This resource does not contain anything, and is
    /// intended to be used only for testing.
    struct Torch has key, store {}

    /// Create a new torch
    public fun new(): Torch {
        Torch {}
    }
    spec new {
        aborts_if false;
    }
    #[test]
    fun test_new() {
        let Torch {} = new();
    }

    /// Destroy a torch created with `new()`
    public fun destroy(torch: Torch) {
        let Torch {} = torch;
    }
    spec destroy {
        aborts_if false;

        // Move 1.3.0 does not permit verifying destruction of resources anymore:
        // https://community.diem.com/t/formal-verification-how-to-ensure-a-struct-is-actually-destroyed/3662
    }
    #[test]
    fun test_destroy() {
        let torch = Torch {}; 
        destroy(torch);
    }
}