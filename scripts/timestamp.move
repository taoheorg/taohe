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
    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Timestamp;

    fun timestamp_1(account: signer) {
        Root::create<Timestamp::Tao<Torch::Torch>>(&account, Timestamp::wrap<Torch::Torch>(Torch::new()));
    }
}

script {
    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Timestamp;

    fun timestamp_2(account: signer) {
        let t1 = Root::extract<Timestamp::Tao<Torch::Torch>>(&account);

        let (_timestamp, _) = Timestamp::read(&t1);

        Root::create<Timestamp::Tao<Torch::Torch>>(&account, t1);
    }
}