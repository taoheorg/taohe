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


/// A tao for implementing a simple ownership model: owner can extract
/// the content.
module TaoHe::Ownable {
    use std::signer;
    use TaoHe::Errors;

    /// Simple ownership tao: the `owner` can extract `content`.
    struct Tao<Content> has key, store {
        owner: address,
        content: Content
    }

    /// Wrapping `content` into a tao the `owner` can only extract.
    public fun wrap<Content>(owner: address, content: Content): Tao<Content> {
        Tao<Content> { owner, content }
    }
    spec wrap {
        ensures result.owner == owner && result.content == content;
    }
    #[test]
    fun test_wrap() {
        let Tao { owner, content } = wrap<bool>(@0x123, true);

        assert!(owner == @0x123, 123);
        assert!(content == true, 123);
    }

    /// Immutable read-only reference to the owner address, and `content`.
    public fun read<Content>(tao: &Tao<Content>): (&address, &Content) {
        let Tao<Content> { owner, content } = tao;

        (owner, content)
    }
    spec read {
        ensures result_1 == tao.owner;
        ensures result_2 == tao.content;
    }
    #[test]
    fun test_read() {
        let tao = Tao { owner: @0x123, content: true };

        let (owner, content) = read<bool>(&tao);
        assert!(*owner == @0x123, 123);
        assert!(*content == true, 123);

        let Tao { owner: _, content: _ } = tao;
    }

    /// If `account ` is the `owner`, extract `content`.
    public fun unwrap<Content>(account: &signer, tao: Tao<Content>): Content {
        let Tao<Content> { owner, content } = tao;

        assert!(owner == signer::address_of(account), Errors::ownable_not_owned());

        content
    }
    spec unwrap {
        aborts_if tao.owner != signer::address_of(account);

        ensures result == tao.content;
    }
    #[test(account = @0x123)]
    fun test_unwrap(account: signer) {
        let tao = Tao { owner: @0x123, content: true };
        let content = unwrap<bool>(&account, tao);

        assert!(content == true, 123);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}