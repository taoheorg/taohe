/**
 * Copyright 2021 Solarius Properties Ky
 * Authors: Ville Sundell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * A simple tao whose only purpose is to keep the content immutable.
 */

address {{sender}} {
module Immutable {
    resource struct Tao<Content> {
        content: Content
    }

    public fun new<Content>(content: Content): Tao<Content> {
        Tao<Content>{content}
    }
}
}