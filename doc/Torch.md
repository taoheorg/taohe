
<a name="0x2f66c09143acc52a85fec529a4e20c85_Torch"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Torch`

A dummy resource for testing and development purposes.
Can be passed along like.. ..a torch.
This is not technically a tao, since it can't contain
other taos.


-  [Resource `Torch`](#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch)
-  [Function `new`](#0x2f66c09143acc52a85fec529a4e20c85_Torch_new)
-  [Function `destroy`](#0x2f66c09143acc52a85fec529a4e20c85_Torch_destroy)


<pre><code></code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch"></a>

## Resource `Torch`

This resource does not contain anything, and is
intended to be used only for testing.


<pre><code><b>resource</b> <b>struct</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">Torch</a>
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

<a name="0x2f66c09143acc52a85fec529a4e20c85_Torch_new"></a>

## Function `new`

Create a new torch


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_new">new</a>(): <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_new">new</a>(): <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">Torch</a> {
    <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">Torch</a> {}
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Torch_destroy"></a>

## Function `destroy`

Destroy a torch created with <code><a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_new">new</a>()</code>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_destroy">destroy</a>(torch: <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_destroy">destroy</a>(torch: <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">Torch</a>) {
    <b>let</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">Torch</a> {} = torch;
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
</code></pre>



</details>
