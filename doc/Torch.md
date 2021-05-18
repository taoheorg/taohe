
<a name="0x2_Torch"></a>

# Module `0x2::Torch`

A dummy tao for testing and development purposes.
Can be passed along like.. ..a torch.


-  [Resource `Tao`](#0x2_Torch_Tao)
-  [Function `new`](#0x2_Torch_new)
-  [Function `destroy`](#0x2_Torch_destroy)


<pre><code></code></pre>



<a name="0x2_Torch_Tao"></a>

## Resource `Tao`

This tao does not contain anything, and is
intended to be used only for testing.


<pre><code><b>resource</b> <b>struct</b> <a href="Torch.md#0x2_Torch_Tao">Tao</a>
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>dummy_field: bool</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x2_Torch_new"></a>

## Function `new`

Create a new dummy tao


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2_Torch_new">new</a>(): <a href="Torch.md#0x2_Torch_Tao">Torch::Tao</a>
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2_Torch_new">new</a>(): <a href="Torch.md#0x2_Torch_Tao">Tao</a> {
    <a href="Torch.md#0x2_Torch_Tao">Tao</a> {}
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
</code></pre>



</details>

<a name="0x2_Torch_destroy"></a>

## Function `destroy`

Destroy a dummy tao created with <code><a href="Torch.md#0x2_Torch_new">new</a>()</code>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2_Torch_destroy">destroy</a>(tao: <a href="Torch.md#0x2_Torch_Tao">Torch::Tao</a>)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2_Torch_destroy">destroy</a>(tao: <a href="Torch.md#0x2_Torch_Tao">Tao</a>) {
    <b>let</b> <a href="Torch.md#0x2_Torch_Tao">Tao</a> {} = tao;
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
</code></pre>



</details>
