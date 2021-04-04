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
 * Root is not technically a tao, since it can't be nested.
 * Instead it's a special kind of resource used to host a tao.
 */

address {{sender}} {
module Root {
    use 0x1::Signer;

    resource struct Root<Content> {
        content: Content
    }

    public fun create<Content>(account: &signer, content: Content) {
        move_to<Root<Content>>(account, Root<Content> { content: content });
    }

    public fun extract<Content: resource>(account: &signer): Content acquires Root {
        let owner = Signer::address_of(account);
        let root = move_from<Root<Content>>(owner);
        let Root<Content> { content } = root;

        content
    }
}
}