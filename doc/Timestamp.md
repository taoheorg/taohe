
<a name="0x2f66c09143acc52a85fec529a4e20c85_Timestamp"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Timestamp`

Simple timestamped tao: timestamp when the tao was created.


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_unwrap)


<pre><code><b>use</b> <a href="">0x1::DiemTimestamp</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao"></a>

## Resource `Tao`

Timestamped tao, containing timestamp when the tao was created.
Timestamp is fetched on-chain, so it can't be manipulated.


<pre><code><b>struct</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt; has store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>timestamp: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>content: Content</code>
</dt>
<dd>

</dd>
</dl>


</details>

<details>
<summary>Specification</summary>



<pre><code><b>invariant</b> timestamp &gt; 0;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timestamp_wrap"></a>

## Function `wrap`

Creating a timestamped tao. On-chain timestamp is used, to prevent
timestamp manipulation.


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_wrap">wrap</a>&lt;Content&gt;(content: Content): <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Timestamp::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_wrap">wrap</a>&lt;Content&gt;(content: Content): <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt; {
    <b>let</b> current_timestamp: u64 = 100; // Default timestamp <b>if</b> is_operating() is <b>false</b>

    <b>if</b> (<a href="_is_operating">DiemTimestamp::is_operating</a>()) {
        // Currently <b>move</b>-executor does not support full genesis functionality,
        // including timestamping. If available, then <b>use</b> the real timestamp.
        current_timestamp = <a href="_now_seconds">DiemTimestamp::now_seconds</a>();

        <b>assert</b>(current_timestamp &gt; 0, 123);
    };

    <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt; { timestamp: current_timestamp, content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <a href="_spec_now_seconds">DiemTimestamp::spec_now_seconds</a>() == 0 && <a href="_is_operating">DiemTimestamp::is_operating</a>() <b>with</b> 123;
<b>ensures</b> result.content == content;
<b>ensures</b> result.timestamp == 100 || result.timestamp == <a href="_spec_now_seconds">DiemTimestamp::spec_now_seconds</a>();
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timestamp_read"></a>

## Function `read`

Immutable read-only reference to the timestamp, and the <code>content</code>.
Timestamp is the on-chain timestamp, to prevent manipulation.


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_read">read</a>&lt;Content&gt;(tao: &<a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Timestamp::Tao</a>&lt;Content&gt;): (&u64, &Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_read">read</a>&lt;Content&gt;(tao: &<a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt;): (&u64, &Content) {
    <b>let</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt; { timestamp, content } = tao;

    (timestamp, content)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result_1 == tao.timestamp;
<b>ensures</b> result_2 == tao.content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timestamp_unwrap"></a>

## Function `unwrap`

Extracting the <code>content</code>, destroying the timestamp along with the
tao.


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Timestamp::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt;): Content {
    <b>let</b> <a href="Timestamp.md#0x2f66c09143acc52a85fec529a4e20c85_Timestamp_Tao">Tao</a>&lt;Content&gt; { timestamp: _, content } = tao;

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
