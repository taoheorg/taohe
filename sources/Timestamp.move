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
 

/// Simple timestamped tao: timestamp when the tao was created.
module TaoHe::Timestamp {
    use Adapter::Adapter;

    /// Timestamped tao, containing timestamp when the tao was created.
    /// Timestamp is fetched on-chain, so it can't be manipulated.
    struct Tao<Content> has key, store {
        timestamp: u64,
        content: Content
    }
    spec Tao {
        invariant timestamp > 0;
    }

    /// Creating a timestamped tao. On-chain timestamp is used, to prevent
    /// timestamp manipulation.
    public fun wrap<Content>(content: Content): Tao<Content> {
        let current_timestamp: u64 = Adapter::current_timestamp();

        assert!(current_timestamp > 0, 123);

        Tao<Content> { timestamp: current_timestamp, content }
    }
    spec wrap {
        aborts_if Adapter::current_timestamp() == 0 with 123;

        ensures result.content == content;
        ensures result.timestamp == Adapter::current_timestamp();
    }
    #[test]
    fun test_wrap() {
        let Tao { timestamp, content } = wrap<bool>(true);

        assert!(timestamp != 0, 123);
        assert!(content == true, 123);
    }

    /// Immutable read-only reference to the timestamp, and the `content`.
    /// Timestamp is the on-chain timestamp, to prevent manipulation.
    public fun read<Content>(tao: &Tao<Content>): (&u64, &Content) {
        let Tao<Content> { timestamp, content } = tao;

        (timestamp, content)
    }
    spec read {
        ensures result_1 == tao.timestamp;
        ensures result_2 == tao.content;
    }
    #[test]
    fun test_read() {
        let tao = Tao { timestamp: 123, content: true };

        let (timestamp, content) = read<bool>(&tao);
        assert!(*timestamp == 123, 123);
        assert!(*content == true, 123);

        let Tao { timestamp: _, content: _ } = tao;
    }

    /// Extracting the `content`, destroying the timestamp along with the
    /// tao.
    public fun unwrap<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { timestamp: _, content } = tao;

        content
    }
    spec unwrap {
        ensures result == tao.content;
    }
    #[test]
    fun test_unwrap() {
        let tao = Tao { timestamp: 0, content: false };
        let content = unwrap<bool>(tao);

        assert!(content == false, 123);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}