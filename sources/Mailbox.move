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

module TaoHe::Mailbox {
    use Std::Vector;
    use Std::Signer;
    use Std::Event;
    #[test_only]
    use TaoHe::Torch;

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
        aborts_if exists<Mailbox<Content>>(Signer::address_of(account));

        modifies global<Mailbox<Content>>(Signer::address_of(account));
    }
    #[test(account = @0x123)]
    fun test_init(account: signer) {
        //Event::publish_generator(&account);
        init<Torch::Torch>(&account);
    }

    public fun put<Content: key + store>(account: &signer, to: address, reclaimable: bool, content: Content) acquires Mailbox, MailboxConfiguration {
        let addr = Signer::address_of(account);
        let mailbox = borrow_global_mut<Mailbox<Content>>(addr);
        let from = if(reclaimable){addr} else {@0x0};
        let item = Item<Content>{from, to, content};

        assert!(to != @0x0, 123);

        Vector::push_back<Item<Content>>(&mut mailbox.content, item);

        let mailbox_configuration = borrow_global_mut<MailboxConfiguration>(addr);
        Event::emit_event(&mut mailbox_configuration.event_handle, Event1{from, to});
    }
    spec put {
        aborts_if !exists<Mailbox<Content>>(Signer::address_of(account));
        aborts_if !exists<MailboxConfiguration>(Signer::address_of(account));
        aborts_if to == @0x0;
    }
    #[test(account = @0x123)]
    fun test_put(account: signer) acquires Mailbox, MailboxConfiguration {
        //Event::publish_generator(&account);
        init<Torch::Torch>(&account);
        put<Torch::Torch>(&account, @0x123, true, Torch::new());
    }

    public fun fetch<Content: key + store>(account: &signer, from: address, index: u64): Content acquires Mailbox {
        let addr = Signer::address_of(account);
        let mailbox = borrow_global_mut<Mailbox<Content>>(from);

        let Item<Content>{from, to, content} = Vector::swap_remove<Item<Content>>(&mut mailbox.content, index);
        assert!(to == addr || from == addr, 123);

        content
    }
    spec fetch {
        aborts_if !exists<Mailbox<Content>>(from);
        aborts_if (global<Mailbox<Content>>(from).content[index].to != Signer::address_of(account)) && (global<Mailbox<Content>>(from).content[index].from != Signer::address_of(account));
        aborts_if index >= Vector::length(global<Mailbox<Content>>(from).content);
    }
    #[test(account = @0x123)]
    fun test_fetch(account: signer) acquires Mailbox, MailboxConfiguration {
        //Event::publish_generator(&account);
        init<Torch::Torch>(&account);
        put<Torch::Torch>(&account, @0x123, true, Torch::new());
        put<Torch::Torch>(&account, @0x123, true, Torch::new());
        let torch1 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch1);
        let torch2 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch2);
    }
    #[test(account = @0x123), expected_failure]
    fun test_fetch_notmine(account: signer) acquires Mailbox, MailboxConfiguration {
        //Event::publish_generator(&account);
        init<Torch::Torch>(&account);
        put<Torch::Torch>(&account, @0x456, false, Torch::new());
        put<Torch::Torch>(&account, @0x456, false, Torch::new());
        let torch1 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch1);
        let torch2 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch2);
    }
    #[test(account = @0x123)]
    fun test_recover(account: signer) acquires Mailbox, MailboxConfiguration {
        //Event::publish_generator(&account);
        init<Torch::Torch>(&account);
        put<Torch::Torch>(&account, @0x456, true, Torch::new());
        put<Torch::Torch>(&account, @0x456, true, Torch::new());
        let torch1 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch1);
        let torch2 = fetch<Torch::Torch>(&account, @0x123, 0);
        Torch::destroy(torch2);
    }

    /* public(script) fun put<Content: key + store>(account: signer, ) {

    } */
}