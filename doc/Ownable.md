
<a name="0x2f66c09143acc52a85fec529a4e20c85_Ownable"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Ownable`

A tao for implementing a simple ownership model: owner can extract
the content.


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Ownable_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Ownable_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Ownable_unwrap)


<pre><code><b>use</b> <a href="">0x1::Signer</a>;
<b>use</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors">0x2f66c09143acc52a85fec529a4e20c85::Errors</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao"></a>

## Resource `Tao`

Simple ownership tao: the <code>owner</code> can extract <code>content</code>.


<pre><code><b>struct</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt; has store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>owner: address</code>
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

<a name="0x2f66c09143acc52a85fec529a4e20c85_Ownable_wrap"></a>

## Function `wrap`

Wrapping <code>content</code> into a tao the <code>owner</code> can only extract.


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_wrap">wrap</a>&lt;Content&gt;(owner: address, content: Content): <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Ownable::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_wrap">wrap</a>&lt;Content&gt;(owner: address, content: Content): <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt; {
    <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt; { owner, content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result.owner == owner && result.content == content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Ownable_read"></a>

## Function `read`

Immutable read-only reference to the owner address, and <code>content</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_read">read</a>&lt;Content&gt;(tao: &<a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Ownable::Tao</a>&lt;Content&gt;): (&address, &Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_read">read</a>&lt;Content&gt;(tao: &<a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt;): (&address, &Content) {
    <b>let</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt; { owner, content } = tao;

    (owner, content)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result_1 == tao.owner;
<b>ensures</b> result_2 == tao.content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Ownable_unwrap"></a>

## Function `unwrap`

If <code>account </code> is the <code>owner</code>, extract <code>content</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_unwrap">unwrap</a>&lt;Content&gt;(account: &signer, tao: <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Ownable::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_unwrap">unwrap</a>&lt;Content&gt;(account: &signer, tao: <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt;): Content {
    <b>let</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Tao</a>&lt;Content&gt; { owner, content } = tao;

    <b>assert</b>(owner == <a href="_address_of">Signer::address_of</a>(account), Errors::ownable_not_owned());

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> tao.owner != <a href="_address_of">Signer::address_of</a>(account);
<b>ensures</b> result == tao.content;
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
