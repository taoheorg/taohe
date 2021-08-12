
<a name="0x2f66c09143acc52a85fec529a4e20c85_Root"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Root`

Root is not technically a tao, since it can't be nested.
Instead it's a special kind of resource used to host a tao.


-  [Resource `Root`](#0x2f66c09143acc52a85fec529a4e20c85_Root_Root)
-  [Function `create`](#0x2f66c09143acc52a85fec529a4e20c85_Root_create)
-  [Function `extract`](#0x2f66c09143acc52a85fec529a4e20c85_Root_extract)


<pre><code><b>use</b> <a href="Signer.md#0x1_Signer">0x1::Signer</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_Root"></a>

## Resource `Root`

Root resource used to host a tao


<pre><code><b>resource</b> <b>struct</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>content: Content</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_create"></a>

## Function `create`

Create a <code><a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a></code> for <code>account</code>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">create</a>&lt;Content&gt;(account: &signer, content: Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">create</a>&lt;Content: store&gt;(account: &signer, content: Content) {
    move_to&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(account, <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt; { content: content });
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>exists</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<a href="Signer.md#0x1_Signer_spec_address_of">Signer::spec_address_of</a>(account));
<b>ensures</b> <b>exists</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<a href="Signer.md#0x1_Signer_spec_address_of">Signer::spec_address_of</a>(account));
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Root_extract"></a>

## Function `extract`

Extract <code><a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a></code> from <code>account</code>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">extract</a>&lt;Content: <b>resource</b>&gt;(account: &signer): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">extract</a>&lt;Content: key + store&gt;(account: &signer): Content <b>acquires</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a> {
    <b>let</b> owner = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>let</b> root = move_from&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(owner);
    <b>let</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt; { content } = root;

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> !<b>exists</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<a href="Signer.md#0x1_Signer_spec_address_of">Signer::spec_address_of</a>(account));
<b>ensures</b> !<b>exists</b>&lt;<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>&lt;Content&gt;&gt;(<a href="Signer.md#0x1_Signer_spec_address_of">Signer::spec_address_of</a>(account));
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
