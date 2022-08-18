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


/// A simple tao whose only purpose is to keep the content immutable
module TaoHe::immutable {
    /// Static tao containing a resource. Can't be extracted.
    struct Tao<Content> has key, store {
        content: Content
    }

    /// Creating a static tao whose `content` cannot be extracted.
    public fun wrap<Content>(content: Content): Tao<Content> {
        Tao<Content> { content }
    }
    spec wrap {
        ensures result.content == content;
    }
    #[test]
    fun test_wrap() {
        let Tao { content } = wrap<bool>(true);

        assert!(content == true, 123);
    }

    /// Immutable read-only reference to the `content`.
    public fun read<Content>(tao: &Tao<Content>): &Content {
        let Tao<Content> { content } = tao;

        content
    }
    spec read {
        ensures result == tao.content;
    }
    #[test]
    fun test_read() {
        let tao = Tao { content: true };

        let (content) = read<bool>(&tao);
        assert!(*content == true, 123);

        let Tao { content: _ } = tao;
    }

    /// For semantic reasons providing `unwrap`, although it
    /// always fails.
    public fun unwrap<Content>(_tao: Tao<Content>): Content {
        // Aborting with general error for now: using our
        // Errors module would break formal verification
        // (https://github.com/diem/diem/issues/8303).
        abort(1)
    }
    spec unwrap {
        aborts_if true with 1;
    }
    #[test, expected_failure]
    fun test_unwrap() {
        let tao = Tao { content: true };

        // Always fails:
        let _content = unwrap<bool>(tao);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}