
<a name="0x2f66c09143acc52a85fec529a4e20c85_Immutable"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Immutable`

A simple tao whose only purpose is to keep the content immutable


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Immutable_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Immutable_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Immutable_unwrap)


<pre><code></code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao"></a>

## Resource `Tao`

Static tao containing a resource. Can't be extracted.


<pre><code><b>struct</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt; <b>has</b> store, key
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

<a name="0x2f66c09143acc52a85fec529a4e20c85_Immutable_wrap"></a>

## Function `wrap`

Creating a static tao whose <code>content</code> cannot be extracted.


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_wrap">wrap</a>&lt;Content&gt;(content: Content): <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Immutable::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_wrap">wrap</a>&lt;Content&gt;(content: Content): <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt; {
    <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt; { content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result.content == content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Immutable_read"></a>

## Function `read`

Immutable read-only reference to the <code>content</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_read">read</a>&lt;Content&gt;(tao: &<a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Immutable::Tao</a>&lt;Content&gt;): &Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_read">read</a>&lt;Content&gt;(tao: &<a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt;): &Content {
    <b>let</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt; { content } = tao;

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result == tao.content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Immutable_unwrap"></a>

## Function `unwrap`

For semantic reasons providing <code>unwrap</code>, although it
always fails.


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_unwrap">unwrap</a>&lt;Content&gt;(_tao: <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Immutable::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_unwrap">unwrap</a>&lt;Content&gt;(_tao: <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Tao</a>&lt;Content&gt;): Content {
    // Aborting <b>with</b> general error for now: using our
    // <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors">Errors</a> <b>module</b> would <b>break</b> formal verification
    // (https://github.com/diem/diem/issues/8303).
    <b>abort</b>(1)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>true</b> <b>with</b> 1;
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
