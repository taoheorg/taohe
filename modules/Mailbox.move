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
module Mailbox {
    use 0x1::Vector;
    use 0x1::Signer;
    use 0x1::Event;

    struct Item<Content: key + store> has key, store {
        from: address,
        to: address,
        content: Content
    }

    struct Mailbox<Content: key + store> has key, store {
        content: vector<Item<Content>>
    }

    struct MailboxConfiguration has key, store {
        event_handle: Event::EventHandle<Event1>
    }

    struct Event1 has drop, store {
        from: address,
        to: address
    }

    public fun init<Content: key + store>(account: &signer) {
        move_to<Mailbox<Content>>(account, Mailbox<Content> { content: Vector::empty<Item<Content>>() });

        if (!exists<MailboxConfiguration>(Signer::address_of(account))) {
            move_to<MailboxConfiguration>(account, MailboxConfiguration { event_handle: Event::new_event_handle<Event1>(account) });
        }
    }
    spec init {
        aborts_if exists<Mailbox<Content>>(Signer::spec_address_of(account));

        modifies global<Mailbox<Content>>(Signer::spec_address_of(account));
    }

    public fun put<Content: key + store>(account: &signer, to: address, reclaimable: bool, content: Content) acquires Mailbox, MailboxConfiguration {
        let addr = Signer::address_of(account);
        let mailbox = borrow_global_mut<Mailbox<Content>>(addr);
        let from = if(reclaimable){addr} else {@0x0};
        let item = Item<Content>{from, to, content};

        assert(to != @0x0, 123);

        Vector::push_back<Item<Content>>(&mut mailbox.content, item);

        let mailbox_configuration = borrow_global_mut<MailboxConfiguration>(addr);
        Event::emit_event(&mut mailbox_configuration.event_handle, Event1{from, to});
    }
    spec put {
        aborts_if !exists<Mailbox<Content>>(Signer::spec_address_of(account));
        aborts_if !exists<MailboxConfiguration>(Signer::spec_address_of(account));
        aborts_if to == @0x0;
    }

    public fun fetch<Content: key + store>(account: &signer, from: address, index: u64): Content acquires Mailbox {
        let addr = Signer::address_of(account);
        let mailbox = borrow_global_mut<Mailbox<Content>>(from);

        let Item<Content>{from, to, content} = Vector::swap_remove<Item<Content>>(&mut mailbox.content, index);
        assert(to == addr || from == addr, 123);

        content
    }
    spec fetch {
        aborts_if !exists<Mailbox<Content>>(from);
        aborts_if (global<Mailbox<Content>>(from).content[index].to != Signer::spec_address_of(account)) && (global<Mailbox<Content>>(from).content[index].from != Signer::spec_address_of(account));
        aborts_if index >= Vector::length(global<Mailbox<Content>>(from).content);
    }
}
}