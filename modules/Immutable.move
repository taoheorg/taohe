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

/// A simple tao whose only purpose is to keep the content immutable
module Immutable {
    /// Static tao containing a tao. Can't be extracted.
    struct Tao<Content> has key, store {
        content: Content
    }

    /// Creating a static tao whose content tao cannot be extracted
    public fun new<Content>(content: Content): Tao<Content> {
        Tao<Content> { content }
    }
    spec new {
        ensures result.content == content;
    }

    /// For semantic reasons providing `extract`, although it
    /// always fails.
    public fun extract<Content>(_tao: Tao<Content>): Content {
        // Aborting with general error for now: using our
        // Errors module would break formal verification
        // (https://github.com/diem/diem/issues/8303).
        abort(1)
    }
    spec extract {
        aborts_if true with 1;
    }

    spec module {
        // Never abort, unless explicitly defined so:
        pragma aborts_if_is_strict;
    }
}
}