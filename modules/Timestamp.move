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

/// Simple timestamped tao: timestamp when the tao was created.
module Timestamp {
    use 0x1::DiemTimestamp;

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
    public fun new<Content>(content: Content): Tao<Content> {
        let current_timestamp: u64 = 100; // Default timestamp if is_operating() is false

        if (DiemTimestamp::is_operating()) {
            // Currently move-executor does not support full genesis functionality,
            // including timestamping. If available, then use the real timestamp.
            current_timestamp = DiemTimestamp::now_seconds();

            assert(current_timestamp > 0, 123);            
        };

        Tao<Content> { timestamp: current_timestamp, content }
    }
    spec new {
        aborts_if DiemTimestamp::spec_now_seconds() == 0 && DiemTimestamp::is_operating() with 123;

        ensures result.content == content;
        ensures result.timestamp == 100 || result.timestamp == DiemTimestamp::spec_now_seconds();
    }
    #[test]
    fun test_new() {
        let Tao {timestamp, content} = new<bool>(true);

        assert(timestamp != 0, 123);
        assert(content == true, 123);
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
        let tao = new<bool>(true);

        let (timestamp, content) = read<bool>(&tao);
        assert(*timestamp > 0, 123);
        assert(*content == true, 123);

        let value = extract<bool>(tao);
        assert(value == true, 123);
    }

    /// Extracting the `content`, destroying the timestamp along with the
    /// tao.
    public fun extract<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { timestamp: _, content } = tao;

        content
    }
    spec extract {
        ensures result == tao.content;
    }
    #[test]
    fun test_extract() {
        let tao = Tao<bool> { timestamp: 0, content: false };
        let content = extract<bool>(tao);

        assert(content == false, 123);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}
}