
<a name="immutable_1"></a>

# Script `immutable_1`





<pre><code><b>use</b> <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable">0x2f66c09143acc52a85fec529a4e20c85::Immutable</a>;
<b>use</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">0x2f66c09143acc52a85fec529a4e20c85::Root</a>;
<b>use</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">0x2f66c09143acc52a85fec529a4e20c85::Torch</a>;
</code></pre>




<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="immutable.md#immutable_1">immutable_1</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="immutable.md#immutable_1">immutable_1</a>(account: signer) {
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">Root::create</a>&lt;<a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_Tao">Immutable::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account, <a href="Immutable.md#0x2f66c09143acc52a85fec529a4e20c85_Immutable_wrap">Immutable::wrap</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_new">Torch::new</a>()));
}
</code></pre>



</details>
