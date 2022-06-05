
<a name="timestamp_2"></a>

# Script `timestamp_2`





<pre><code><b>use</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">0x2f66c09143acc52a85fec529a4e20c85::Root</a>;
<b>use</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp">0x2f66c09143acc52a85fec529a4e20c85::Timestamp</a>;
<b>use</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">0x2f66c09143acc52a85fec529a4e20c85::Torch</a>;
</code></pre>




<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="timestamp.md#timestamp_2">timestamp_2</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="timestamp.md#timestamp_2">timestamp_2</a>(account: signer) {
    <b>let</b> t1 = <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">Root::extract</a>&lt;<a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Timestamp::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account);

    <b>let</b> (_timestamp, _) = <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_read">Timestamp::read</a>(&t1);

    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">Root::create</a>&lt;<a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Timestamp::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account, t1);
}
</code></pre>



</details>
