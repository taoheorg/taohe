// Copyright 2021 Solarius Properties Ky
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

/// Simple timelocked tao: allow extracting only when time has passed
module Timelock {
    use {{sender}}::Errors;
    use 0x1::DiemTimestamp;

    /// Tao for a simple timelock: extract `content` if `unlock_time` has
    /// passed (in seconds).
    resource struct Tao<Content> {
        content: Content,
        unlock_time: u64
    }

    /// Create a new timelocked tao. `unlock_time` is in seconds, will be
    /// compared against `DiemTimestamp::now_seconds()` on production
    /// network.
    public fun new<Content>(unlock_time: u64, content: Content): Tao<Content> {
        Tao<Content> { unlock_time, content }
    }
    spec fun new {
        aborts_if false;

        ensures result.unlock_time == unlock_time && result.content == content;
    }

    /// Extract `tao.content` if `tao.unlock_time` has passed.
    /// Currently move-executor does not support full genesis functionality,
    /// including timestamping. If available, then use the real timestamp.
    public fun extract<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { content, unlock_time } = tao;
        let current_timestamp: u64 = 100; // Default timestamp if is_operating() is false

        if (DiemTimestamp::is_operating()) {
            // Currently move-executor does not support full genesis functionality,
            // including timestamping. If available, then use the real timestamp.
            current_timestamp = DiemTimestamp::now_seconds();
        };

        assert(current_timestamp > unlock_time, Errors::timelock_too_early());

        content
    }
    spec fun extract {
        // At the moment this can't be tested.
        // See: https://github.com/diem/diem/issues/8303
    }
}
}