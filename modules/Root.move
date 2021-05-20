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

/// Root is not technically a tao, since it can't be nested.
/// Instead it's a special kind of resource used to host a tao.
module Root {
    use 0x1::Signer;

    /// Root resource used to host a tao
    struct Root<Content> has key, store {
        content: Content
    }

    /// Create a `Root` for `account`
    public fun create<Content: store>(account: &signer, content: Content) {
        move_to<Root<Content>>(account, Root<Content> { content: content });
    }
    spec fun create {
        aborts_if exists<Root<Content>>(Signer::spec_address_of(account));

        ensures exists<Root<Content>>(Signer::spec_address_of(account));
    }

    /// Extract `Root` from `account`
    public fun extract<Content: key + store>(account: &signer): Content acquires Root {
        let owner = Signer::address_of(account);
        let root = move_from<Root<Content>>(owner);
        let Root<Content> { content } = root;

        content
    }
    spec fun extract {
        aborts_if !exists<Root<Content>>(Signer::spec_address_of(account));

        ensures !exists<Root<Content>>(Signer::spec_address_of(account));
    }
}
}