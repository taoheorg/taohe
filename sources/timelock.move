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
 

/// Simple timelocked tao: allow extracting only when a certain time has passed
module TaoHe::timelock {
    use Connector::Connector;
    use TaoHe::errors;

    /// Tao for a simple timelock: extract `content` if `unlock_time` has
    /// passed (in seconds).
    struct Tao<Content> has key, store {
        unlock_time: u64,
        content: Content
    }

    /// Create a new timelocked tao. `unlock_time` is in seconds, will be
    /// compared against `Connector::current_timestamp()` on production
    /// network. Time can be 0, at least for now.
    public fun wrap<Content>(unlock_time: u64, content: Content): Tao<Content> {
        Tao<Content> { unlock_time, content }
    }
    spec wrap {
        ensures result.unlock_time == unlock_time && result.content == content;
    }
    #[test]
    fun test_wrap() {
        let Tao { unlock_time, content } = wrap<bool>(0, true);

        assert!(unlock_time == 0, 123);
        assert!(content == true, 123);
    }

    /// Immutable read-only reference to the unlock time, and the `content`.
    public fun read<Content>(tao: &Tao<Content>): (&u64, &Content) {
        let Tao<Content> { unlock_time, content } = tao;

        (unlock_time, content)
    }
    spec read {
        ensures result_1 == tao.unlock_time;
        ensures result_2 == tao.content;
    }
    #[test]
    fun test_read() {
        let tao = Tao { unlock_time: 1, content: true };

        let (unlock_time, content) = read<bool>(&tao);
        assert!(*unlock_time > 0, 123);
        assert!(*content == true, 123);

        let Tao { unlock_time: _, content: _ } = tao;
    }

    /// Extract `tao.content` if `tao.unlock_time` has passed.
    public fun unwrap<Content>(tao: Tao<Content>): Content {
        let Tao<Content> { content, unlock_time } = tao;
        let current_timestamp: u64 = Connector::current_timestamp();

        assert!(current_timestamp > unlock_time, errors::timelock_too_early());

        content
    }
    spec unwrap {
        aborts_if (tao.unlock_time >= Connector::current_timestamp());

        // Result cannot be verified at the moment:
        // https://github.com/diem/diem/issues/8303
    }
    #[test]
    fun test_unwrap() {
        let timestamp = Connector::current_timestamp();
        let tao = Tao { unlock_time: timestamp - 1, content: true };
        let content = unwrap<bool>(tao);

        assert!(content == true, 123);
    }
    #[test, expected_failure]
    fun test_unwrap_too_early() {
        let timestamp = Connector::current_timestamp();
        let tao = Tao { unlock_time: timestamp + 1, content: true };
        let content = unwrap<bool>(tao);

        assert!(content == true, 123);
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}