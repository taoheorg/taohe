
<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Folder`

This tao is designed to contain a static array of taos.
As with normal tao lifespan, the tao is created with a
set of taos, and the same set will be returned when the
tao is destroyed.


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao)
-  [Function `new`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_new)
-  [Function `extract`](#0x2f66c09143acc52a85fec529a4e20c85_Folder_extract)


<pre><code></code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao"></a>

## Resource `Tao`

A simple tao struct containing a vector of taos


<pre><code><b>struct</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; has store, key
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

<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_new"></a>

## Function `new`

Create a new tao, with the static set of taos inside it


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_new">new</a>&lt;Content&gt;(content: vector&lt;Content&gt;): <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_new">new</a>&lt;Content&gt;(content: vector&lt;Content&gt;): <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; {
    <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result ==  <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt; { content: content };
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Folder_extract"></a>

## Function `extract`

Destroy the tao, and return the static set of taos inside it


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_extract">extract</a>&lt;Content&gt;(tao: <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;Content&gt;): vector&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_extract">extract</a>&lt;Content&gt;(tao: <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Tao</a>&lt;Content&gt;): vector&lt;Content&gt; {
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
