/**
 * Copyright 2021 Solarius Properties Ky
 * Authors: Ville Sundell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//! account: alice
//! account: bob
//! account: charlie
script {
    //use 0x1::Offer;
    use 0x1::Vector;

    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Folder;

    fun main(account: &signer) {
        let vec1 = Vector::empty<Torch::Tao>();
        Vector::push_back<Torch::Tao>(&mut vec1, Torch::new());
        Root::create<Folder::Tao<Torch::Tao>>(account, Folder::new<Torch::Tao>(vec1));
        //Root::create<Folder::Folder<Torch::Tao>>(account, Folder::new<Torch::Tao>(Root::extract<Folder::Folder<Torch::Torch>>(account));
        //Offer::create<Folder::Folder<Torch::Tao>>(account, Root::extract<Folder::Folder<Torch::Tao>>(account), 0x1);
    }
}

//! new-transaction
//! sender: bob
script {
    //use {{sender}}::Torch;
    //use {{sender}}::Folder;
    //use {{sender}}::Root;

    fun main(_account: &signer) {
        //Folder::add<Torch::Tao>(Root::extract<Folder::Folder<Torch::Tao>>(account), Torch::new());
    }
}