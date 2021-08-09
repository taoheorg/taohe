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

    public fun new<Content>(content: Content): Tao<Content> {
        let current_timestamp: u64 = 100; // Default timestamp if is_operating() is false

        if (DiemTimestamp::is_operating()) {
            // Currently move-executor does not support full genesis functionality,
            // including timestamping. If available, then use the real timestamp.
            current_timestamp = DiemTimestamp::now_seconds();
        };

        Tao<Content> { timestamp: current_timestamp, content }
    }

    public fun extract<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { timestamp: _, content } = tao;

        content
    }
}
}