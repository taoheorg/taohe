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

    struct Tao<Content> has key, store {
        timestamp: u64,
        content: Content
    }
    spec struct Tao {
        invariant timestamp > 0;
    }

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
    spec fun new {
        aborts_if DiemTimestamp::spec_now_seconds() == 0 && DiemTimestamp::is_operating() with 123;

        ensures result.content == content;
        ensures result.timestamp == 100 || result.timestamp == DiemTimestamp::spec_now_seconds();
    }

    public fun read<Content>(tao: &Tao<Content>): (&u64, &Content) {
        let Tao<Content> { timestamp, content } = tao;

        (timestamp, content)
    }
    spec fun read {
        ensures result_1 == tao.timestamp;
        ensures result_2 == tao.content;
    }

    public fun extract<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { timestamp: _, content } = tao;

        content
    }
    spec fun extract {
        ensures result == tao.content;
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}
}