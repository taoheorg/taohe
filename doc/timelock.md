
<a name="timelock_2"></a>

# Script `timelock_2`





<pre><code><b>use</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">0x2f66c09143acc52a85fec529a4e20c85::Root</a>;
<b>use</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock">0x2f66c09143acc52a85fec529a4e20c85::Timelock</a>;
<b>use</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">0x2f66c09143acc52a85fec529a4e20c85::Torch</a>;
</code></pre>




<pre><code><b>public</b> <b>fun</b> <a href="timelock.md#timelock_2">timelock_2</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="timelock.md#timelock_2">timelock_2</a>(account: signer) {
    // Extract torch, and wrap it into <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">Root</a>
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">Root::create</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(&account, <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap">Timelock::unwrap</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">Root::extract</a>&lt;<a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Timelock::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account)));
}
</code></pre>



</details>
