
<a name="0x3_Immutable"></a>

# Module `0x3::Immutable`

A simple tao whose only purpose is to keep the content immutable


-  [Resource `Tao`](#0x3_Immutable_Tao)
-  [Function `new`](#0x3_Immutable_new)


<pre><code></code></pre>



<a name="0x3_Immutable_Tao"></a>

## Resource `Tao`

Static tao containing a tao. Can't be extracted.


<pre><code><b>resource</b> <b>struct</b> <a href="Immutable.md#0x3_Immutable_Tao">Tao</a>&lt;Content&gt;
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

<a name="0x3_Immutable_new"></a>

## Function `new`

Creating a static tao whose content tao cannot be extracted


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x3_Immutable_new">new</a>&lt;Content&gt;(content: Content): <a href="Immutable.md#0x3_Immutable_Tao">Immutable::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Immutable.md#0x3_Immutable_new">new</a>&lt;Content&gt;(content: Content): <a href="Immutable.md#0x3_Immutable_Tao">Tao</a>&lt;Content&gt; {
    <a href="Immutable.md#0x3_Immutable_Tao">Tao</a>&lt;Content&gt; { content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
<b>ensures</b> result.content == content;
</code></pre>



</details>
