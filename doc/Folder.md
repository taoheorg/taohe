
<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Folder`

This tao is designed to contain a static array of resources.
As with normal tao lifespan, the tao is created with a
set of resources, and the same set will be returned when the
tao is destroyed.


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_unwrap)


<pre><code></code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao"></a>

## Resource `Tao`

A simple tao struct containing a vector of resources.


<pre><code><b>struct</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>content: <a href="">vector</a>&lt;Content&gt;</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_wrap"></a>

## Function `wrap`

Create a new tao, with the static set of resources inside it.


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_wrap">wrap</a>&lt;Content&gt;(content: <a href="">vector</a>&lt;Content&gt;): <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_wrap">wrap</a>&lt;Content&gt;(content: <a href="">vector</a>&lt;Content&gt;): <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; {
    <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result ==  <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content: content };
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_read"></a>

## Function `read`

Immutable read-only reference to the vector containing resources.


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_read">read</a>&lt;Content&gt;(tao: &<a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;Content&gt;): &<a href="">vector</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_read">read</a>&lt;Content&gt;(tao: &<a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt;): &<a href="">vector</a>&lt;Content&gt; {
    <b>let</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content } = tao;

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result == tao.content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_unwrap"></a>

## Function `unwrap`

Destroy the tao, and return the static set of resources inside it.


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;Content&gt;): <a href="">vector</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt;): <a href="">vector</a>&lt;Content&gt; {
    <b>let</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content } = tao;

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result == tao.content;
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
