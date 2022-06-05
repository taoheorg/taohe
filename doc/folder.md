
<a name="folder_2"></a>

# Script `folder_2`





<pre><code><b>use</b> <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder">0x2f66c09143acc52a85fec529a4e20c85::Folder</a>;
<b>use</b> <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root">0x2f66c09143acc52a85fec529a4e20c85::Root</a>;
<b>use</b> <a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch">0x2f66c09143acc52a85fec529a4e20c85::Torch</a>;
</code></pre>




<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="folder.md#folder_2">folder_2</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="folder.md#folder_2">folder_2</a>(account: signer) {
    // Extracting, and inserting it again
    <b>let</b> vec2: vector&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt; = <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_unwrap">Folder::unwrap</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(<a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_extract">Root::extract</a>&lt;<a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account));
    <a href="Root.md#0x2f66c09143acc52a85fec529a4e20c85_Root_create">Root::create</a>&lt;<a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_Tao">Folder::Tao</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;&gt;(&account, <a href="Folder.md#0x2f66c09143acc52a85fec529a4e20c85_Folder_wrap">Folder::wrap</a>&lt;<a href="Torch.md#0x2f66c09143acc52a85fec529a4e20c85_Torch_Torch">Torch::Torch</a>&gt;(vec2));
}
</code></pre>



</details>
