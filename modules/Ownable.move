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

/// A tao for implementing a simple ownership model: owner can extract
/// the content.
module Ownable {
    use {{sender}}::Errors;
    use 0x1::Signer;

    /// Simple ownership tao: the `owner` can extract `content`
    struct Tao<Content> has key, store {
        owner: address,
        content: Content
    }

    /// Wrapping `content` into a tao the `owner` can only extract
    public fun new<Content>(owner: address, content: Content): Tao<Content> {
        Tao<Content> { owner, content }
    }
    spec fun new {
        aborts_if false;

        ensures result.owner == owner && result.content == content;
    }

    /// If `account ` is the `owner`, extract `content`
    public fun extract<Content>(account: &signer, tao: Tao<Content>): Content {
        let Tao<Content> { owner, content } = tao;

        assert(owner == Signer::address_of(account), Errors::ownable_not_owned());

        content
    }
    spec fun extract {
        aborts_if tao.owner != Signer::address_of(account);

        ensures result == tao.content;
    }
}
}