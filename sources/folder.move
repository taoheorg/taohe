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


/// This tao is designed to contain a static array of resources.
/// As with normal tao lifespan, the tao is created with a
/// set of resources, and the same set will be returned when the
/// tao is destroyed.
module TaoHe::folder {
    #[test_only]
    use std::vector;

    /// A simple tao struct containing a vector of resources.
    struct Tao<Content> has key, store {
        content: vector<Content>
    }

    /// Create a new tao, with the static set of resources inside it.
    public fun wrap<Content>(content: vector<Content>): Tao<Content> {
        Tao<Content> { content }
    }
    spec wrap {
        ensures result ==  Tao<Content> { content: content };
    }
    #[test]
    fun test_wrap() {
        let vec1 = vector::empty<bool>();
        vector::push_back<bool>(&mut vec1, true);
        let Tao {content} = wrap<bool>(vec1);
        let value = vector::pop_back(&mut content);

        assert!(value == true, 123);
    }

    /// Immutable read-only reference to the vector containing resources.
    public fun read<Content>(tao: &Tao<Content>): &vector<Content> {
        let Tao<Content> { content } = tao;

        content
    }
    spec read {
        ensures result == tao.content;
    }
    #[test]
    fun test_read() {
        let tao = Tao { content: vector::empty<bool>() };

        let (content) = read<bool>(&tao);
        assert!(*content == vector::empty<bool>(), 123);

        let Tao<bool> { content: _ } = tao;
    }

    /// Destroy the tao, and return the static set of resources inside it.
    public fun unwrap<Content>(tao: Tao<Content>): vector<Content> {
        let Tao<Content> { content } = tao;
        
        content
    }
    spec unwrap {
        ensures result == tao.content;
    }
    #[test]
    fun test_unwrap() {
        let tao = Tao { content: vector::empty<bool>() };
        let content = unwrap<bool>(tao);

        assert!(content == vector::empty<bool>(), 123);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}