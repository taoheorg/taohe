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
    use std::vector;

    use TaoHe::Torch;
    use TaoHe::Root;
    use TaoHe::Folder;

    fun folder_1(account: signer) {
        let vec1 = vector::empty<Torch::Torch>();
        vector::push_back<Torch::Torch>(&mut vec1, Torch::new());
        Root::create<Folder::Tao<Torch::Torch>>(&account, Folder::wrap<Torch::Torch>(vec1));
    }
}

script {
    use TaoHe::Torch;
    use TaoHe::Folder;
    use TaoHe::Root;

    fun folder_2(account: signer) {
        // Extracting, and inserting it again
        let vec2: vector<Torch::Torch> = Folder::unwrap<Torch::Torch>(Root::extract<Folder::Tao<Torch::Torch>>(&account));
        Root::create<Folder::Tao<Torch::Torch>>(&account, Folder::wrap<Torch::Torch>(vec2));
    }
}