
<a name="0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff_ownable_2"></a>

# Module `0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff::ownable_2`



-  [Function `ownable_2`](#0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff_ownable_2_ownable_2)


<pre><code><b>use</b> <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable">0x2f66c09143acc52a85fec529a4e20c85::Ownable</a>;
<b>use</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">0x2f66c09143acc52a85fec529a4e20c85::Root</a>;
<b>use</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">0x2f66c09143acc52a85fec529a4e20c85::Torch</a>;
</code></pre>



<a name="0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff_ownable_2_ownable_2"></a>

## Function `ownable_2`



<pre><code><b>public</b> <b>fun</b> <a href="ownable.md#0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff_ownable_2">ownable_2</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="ownable.md#0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff_ownable_2">ownable_2</a>(account: signer) {
    // Extract torch, and wrap it into <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">Root::create</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(&account, <a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_extract">Ownable::extract</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(&account, <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">Root::extract</a>&lt;<a href="Ownable.md#0x2f66c09143acc52a85fec529a4e20c85_Ownable_Tao">Ownable::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account)));
}
</code></pre>



</details>
