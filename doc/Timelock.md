
<a name="0x3_Timelock"></a>

# Module `0x3::Timelock`

Simple timelocked tao: allow extracting only when time has passed


-  [Resource `Tao`](#0x3_Timelock_Tao)
-  [Function `new`](#0x3_Timelock_new)
-  [Function `extract`](#0x3_Timelock_extract)


<pre><code><b>use</b> <a href="DiemTimestamp.md#0x1_DiemTimestamp">0x1::DiemTimestamp</a>;
<b>use</b> <a href="Errors.md#0x3_TaoErrors">0x3::TaoErrors</a>;
</code></pre>



<a name="0x3_Timelock_Tao"></a>

## Resource `Tao`

Tao for a simple timelock: extract <code>content</code> if <code>unlock_time</code> has
passed (in seconds).


<pre><code><b>resource</b> <b>struct</b> <a href="Timelock.md#0x3_Timelock_Tao">Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>content: Content</code>
</dt>
<dd>

</dd>
<dt>
<code>unlock_time: u64</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x3_Timelock_new"></a>

## Function `new`

Create a new timelocked tao. <code>unlock_time</code> is in seconds, will be
compared against <code><a href="DiemTimestamp.md#0x1_DiemTimestamp_now_seconds">DiemTimestamp::now_seconds</a>()</code> on production
network.


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x3_Timelock_new">new</a>&lt;Content&gt;(unlock_time: u64, content: Content): <a href="Timelock.md#0x3_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x3_Timelock_new">new</a>&lt;Content&gt;(unlock_time: u64, content: Content): <a href="Timelock.md#0x3_Timelock_Tao">Tao</a>&lt;Content&gt; {
    <a href="Timelock.md#0x3_Timelock_Tao">Tao</a>&lt;Content&gt; { unlock_time, content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> <b>false</b>;
<b>ensures</b> result.unlock_time == unlock_time && result.content == content;
</code></pre>



</details>

<a name="0x3_Timelock_extract"></a>

## Function `extract`

Extract <code>tao.content</code> if <code>tao.unlock_time</code> has passed.
Currently move-executor does not support full genesis functionality,
including timestamping. If available, then use the real timestamp.


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x3_Timelock_extract">extract</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x3_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x3_Timelock_extract">extract</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x3_Timelock_Tao">Tao</a>&lt;Content&gt;): Content {
    <b>let</b> <a href="Timelock.md#0x3_Timelock_Tao">Tao</a>&lt;Content&gt; { content, unlock_time } = tao;
    <b>let</b> current_timestamp: u64 = 100; // Default timestamp <b>if</b> is_operating() is <b>false</b>

    <b>if</b> (<a href="DiemTimestamp.md#0x1_DiemTimestamp_is_operating">DiemTimestamp::is_operating</a>()) {
        // Currently <b>move</b>-executor does not support full genesis functionality,
        // including timestamping. If available, then <b>use</b> the real timestamp.
        current_timestamp = <a href="DiemTimestamp.md#0x1_DiemTimestamp_now_seconds">DiemTimestamp::now_seconds</a>();
    };

    <b>assert</b>(current_timestamp &gt; unlock_time, <a href="Errors.md#0x3_TaoErrors_timelock_too_early">TaoErrors::timelock_too_early</a>());

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



</details>
