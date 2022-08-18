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

script {
    use TaoHe::torch;
    use TaoHe::root;
    use TaoHe::timelock;

    // Unlock timestamp must be < 100 in order to be extracted when
    // using move-executor.
    const UNLOCK_TIMESTAMP: u64 = 99;

    fun timelock_1(account: signer) {
        root::create<timelock::Tao<torch::Torch>>(&account, timelock::wrap<torch::Torch>(UNLOCK_TIMESTAMP, torch::new()));
    }
}

script {
    use TaoHe::torch;
    use TaoHe::root;
    use TaoHe::timelock;

    fun timelock_2(account: signer) {
        // Extract torch, and wrap it into Root
        root::create<torch::Torch>(&account, timelock::unwrap<torch::Torch>(root::extract<timelock::Tao<torch::Torch>>(&account)));
    }
}