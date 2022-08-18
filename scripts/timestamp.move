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
    use TaoHe::timestamp;

    fun timestamp_1(account: signer) {
        root::create<timestamp::Tao<torch::Torch>>(&account, timestamp::wrap<torch::Torch>(torch::new()));
    }
}

script {
    use TaoHe::torch;
    use TaoHe::root;
    use TaoHe::timestamp;

    fun timestamp_2(account: signer) {
        let t1 = root::extract<timestamp::Tao<torch::Torch>>(&account);

        let (_timestamp, _) = timestamp::read(&t1);

        root::create<timestamp::Tao<torch::Torch>>(&account, t1);
    }
}