
<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Mailbox`



-  [Resource `Item`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item)
-  [Resource `Mailbox`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Mailbox)
-  [Resource `MailboxConfiguration`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration)
-  [Struct `Event1`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1)
-  [Function `init`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_init)
-  [Function `put`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_put)
-  [Function `fetch`](#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_fetch)


<pre><code><b>use</b> <a href="">0x1::Event</a>;
<b>use</b> <a href="">0x1::Signer</a>;
<b>use</b> <a href="">0x1::Vector</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item"></a>

## Resource `Item`



<pre><code><b>struct</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content: store, key&gt; <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>from: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code><b>to</b>: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>content: Content</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Mailbox"></a>

## Resource `Mailbox`



<pre><code><b>struct</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content: store, key&gt; <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>content: vector&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Mailbox::Item</a>&lt;Content&gt;&gt;</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration"></a>

## Resource `MailboxConfiguration`



<pre><code><b>struct</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a> <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>event_handle: <a href="_EventHandle">Event::EventHandle</a>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1">Mailbox::Event1</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1"></a>

## Struct `Event1`



<pre><code><b>struct</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1">Event1</a> <b>has</b> drop, store
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>from: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code><b>to</b>: <b>address</b></code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_init"></a>

## Function `init`



<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_init">init</a>&lt;Content: store, key&gt;(account: &signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_init">init</a>&lt;Content: key + store&gt;(account: &signer) {
    <b>move_to</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(account, <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt; { content: <a href="_empty">Vector::empty</a>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content&gt;&gt;() });

    <b>if</b> (!<b>exists</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a>&gt;(<a href="_address_of">Signer::address_of</a>(account))) {
        <b>move_to</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a>&gt;(account, <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a> { event_handle: <a href="_new_event_handle">Event::new_event_handle</a>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1">Event1</a>&gt;(account) });
    }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>exists</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(<a href="_address_of">Signer::address_of</a>(account));
<b>modifies</b> <b>global</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(<a href="_address_of">Signer::address_of</a>(account));
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_put"></a>

## Function `put`



<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_put">put</a>&lt;Content: store, key&gt;(account: &signer, <b>to</b>: <b>address</b>, reclaimable: bool, content: Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_put">put</a>&lt;Content: key + store&gt;(account: &signer, <b>to</b>: <b>address</b>, reclaimable: bool, content: Content) <b>acquires</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>, <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a> {
    <b>let</b> addr = <a href="_address_of">Signer::address_of</a>(account);
    <b>let</b> mailbox = <b>borrow_global_mut</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(addr);
    <b>let</b> from = <b>if</b>(reclaimable){addr} <b>else</b> {@0x0};
    <b>let</b> item = <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content&gt;{from, <b>to</b>, content};

    <b>assert</b>!(<b>to</b> != @0x0, 123);

    <a href="_push_back">Vector::push_back</a>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content&gt;&gt;(&<b>mut</b> mailbox.content, item);

    <b>let</b> mailbox_configuration = <b>borrow_global_mut</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a>&gt;(addr);
    <a href="_emit_event">Event::emit_event</a>(&<b>mut</b> mailbox_configuration.event_handle, <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Event1">Event1</a>{from, <b>to</b>});
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> !<b>exists</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(<a href="_address_of">Signer::address_of</a>(account));
<b>aborts_if</b> !<b>exists</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_MailboxConfiguration">MailboxConfiguration</a>&gt;(<a href="_address_of">Signer::address_of</a>(account));
<b>aborts_if</b> <b>to</b> == @0x0;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Mailbox_fetch"></a>

## Function `fetch`



<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_fetch">fetch</a>&lt;Content: store, key&gt;(account: &signer, from: <b>address</b>, index: u64): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_fetch">fetch</a>&lt;Content: key + store&gt;(account: &signer, from: <b>address</b>, index: u64): Content <b>acquires</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a> {
    <b>let</b> addr = <a href="_address_of">Signer::address_of</a>(account);
    <b>let</b> mailbox = <b>borrow_global_mut</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(from);

    <b>let</b> <a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content&gt;{from, <b>to</b>, content} = <a href="_swap_remove">Vector::swap_remove</a>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox_Item">Item</a>&lt;Content&gt;&gt;(&<b>mut</b> mailbox.content, index);
    <b>assert</b>!(<b>to</b> == addr || from == addr, 123);

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> !<b>exists</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(from);
<b>aborts_if</b> (<b>global</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(from).content[index].<b>to</b> != <a href="_address_of">Signer::address_of</a>(account)) && (<b>global</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(from).content[index].from != <a href="_address_of">Signer::address_of</a>(account));
<b>aborts_if</b> index &gt;= <a href="_length">Vector::length</a>(<b>global</b>&lt;<a href="Mailbox.md#0x2f66c09143acc52a85fec529a4e20c85_Mailbox">Mailbox</a>&lt;Content&gt;&gt;(from).content);
</code></pre>



</details>
