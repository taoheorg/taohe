
<a name="0x2f66c09143acc52a85fec529a4e20c85_Root"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Root`

Root is not technically a tao, since it can't be nested.
Instead it's a special kind of resource used to host taos.


-  [Resource `Root`](#0x2f66c09143acc52a85fec529a4e20c85_Root_Root)
-  [Function `push_content`](#0x2f66c09143acc52a85fec529a4e20c85_Root_push_content)
-  [Function `pop_content`](#0x2f66c09143acc52a85fec529a4e20c85_Root_pop_content)
-  [Function `create`](#0x2f66c09143acc52a85fec529a4e20c85_Root_create)
-  [Function `extract`](#0x2f66c09143acc52a85fec529a4e20c85_Root_extract)


<pre><code><b>use</b> <a href="">0x1::Signer</a>;
<b>use</b> <a href="">0x1::Vector</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_Root"></a>

## Resource `Root`

Root resource used to host other resources (can be taos).


<pre><code><b>struct</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content: store, key&gt; <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>content: vector&lt;Content&gt;</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_push_content"></a>

## Function `push_content`



<pre><code><b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_push_content">push_content</a>&lt;Content: store, key&gt;(account: &signer, content: Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_push_content">push_content</a>&lt;Content: key + store&gt;(account: &signer, content: Content) <b>acquires</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a> {
    <b>let</b> <b>address</b> = <a href="_address_of">Signer::address_of</a>(account);
    <b>if</b> (<b>exists</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<b>address</b>)) {
        <b>let</b> root = <b>borrow_global_mut</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<b>address</b>);
        <a href="_push_back">Vector::push_back</a>&lt;Content&gt;(&<b>mut</b> root.content, content);
    } <b>else</b> {
        <b>let</b> vec1 = <a href="_empty">Vector::empty</a>&lt;Content&gt;();
        <a href="_push_back">Vector::push_back</a>&lt;Content&gt;(&<b>mut</b> vec1, content);
        <b>move_to</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(account, <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt; { content: vec1 });
    }
}
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_pop_content"></a>

## Function `pop_content`



<pre><code><b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_pop_content">pop_content</a>&lt;Content: store, key&gt;(account: &signer): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_pop_content">pop_content</a>&lt;Content: key + store&gt;(account: &signer): Content <b>acquires</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a> {
    <b>let</b> <b>address</b> = <a href="_address_of">Signer::address_of</a>(account);
    <b>let</b> root = <b>borrow_global_mut</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<b>address</b>);
    <a href="_pop_back">Vector::pop_back</a>&lt;Content&gt;(&<b>mut</b> root.content)
}
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_create"></a>

## Function `create`

Place a resource into a <code><a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a></code> for <code>account</code>. Create one if neccessary.


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">create</a>&lt;Content: store, key&gt;(account: &signer, content: Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">create</a>&lt;Content: key + store&gt;(account: &signer, content: Content) <b>acquires</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a> {
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_push_content">push_content</a>&lt;Content&gt;(account, content);
}
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_extract"></a>

## Function `extract`

Extract a resource from a <code><a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a></code> of an <code>account</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">extract</a>&lt;Content: store, key&gt;(account: &signer): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">extract</a>&lt;Content: store + key&gt;(account: &signer): Content <b>acquires</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a> {
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_pop_content">pop_content</a>&lt;Content&gt;(account)
}
</code></pre>



</details>
