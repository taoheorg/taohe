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


/// Root is not technically a tao, since it can't be nested.
/// Instead it's a special kind of resource used to host taos.
module TaoHe::Root {
    use std::signer;
    use std::vector;
    #[test_only]
    use TaoHe::Torch;

    /// Root resource used to host other resources (can be taos).
    struct Root<Content: key + store> has key, store {
        content: vector<Content>
    }

    ///
    fun push_content<Content: key + store>(account: &signer, content: Content) acquires Root {
        let address = signer::address_of(account);
        if (exists<Root<Content>>(address)) {
            let root = borrow_global_mut<Root<Content>>(address);
            vector::push_back<Content>(&mut root.content, content);
        } else {
            let vec1 = vector::empty<Content>();
            vector::push_back<Content>(&mut vec1, content);
            move_to<Root<Content>>(account, Root<Content> { content: vec1 });
        }
    }

    fun pop_content<Content: key + store>(account: &signer): Content acquires Root {
        let address = signer::address_of(account);
        let root = borrow_global_mut<Root<Content>>(address);
        vector::pop_back<Content>(&mut root.content)
    }

    /// Place a resource into a `Root` for `account`. Create one if neccessary.
    public fun create<Content: key + store>(account: &signer, content: Content) acquires Root {
        push_content<Content>(account, content);
    }

    #[test(account = @0x123)]
    fun test_create(account: signer) acquires Root {
        let torch = Torch::new();
        create<Torch::Torch>(&account, torch);
    }

    /// Extract a resource from a `Root` of an `account`.
    public fun extract<Content: store + key>(account: &signer): Content acquires Root {
        pop_content<Content>(account)
    }

    #[test(account = @0x123)]
    fun test_extract(account: signer) acquires Root {
        let torch = Torch::new();
        create<Torch::Torch>(&account, torch);
        let content = extract<Torch::Torch>(&account);
        Torch::destroy(content);
    }

}