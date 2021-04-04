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
 * A tao for implementing a simple ownership model: owner can extract
 * the content.
 */

address {{sender}} {
module Ownable {
    use {{sender}}::Errors;
    use 0x1::Signer;

    resource struct Tao<Content> {
        owner: address,
        content: Content
    }

    public fun new<Content>(owner: address, content: Content): Tao<Content> {
        Tao<Content> { owner, content }
    }

    public fun extract<Content>(account: &signer, tao: Tao<Content>): Content {
        let Tao<Content> { owner, content } = tao;

        assert(owner == Signer::address_of(account), Errors::ownable_not_owned());

        content
    }
}
}