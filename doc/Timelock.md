
<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Timelock`

Simple timelocked tao: allow extracting only when time has passed


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap)


<pre><code><b>use</b> <a href="">0x1::DiemTimestamp</a>;
<b>use</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors">0x2f66c09143acc52a85fec529a4e20c85::Errors</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao"></a>

## Resource `Tao`

Tao for a simple timelock: extract <code>content</code> if <code>unlock_time</code> has
passed (in seconds).


<pre><code><b>struct</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; has store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>unlock_time: u64</code>
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

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock_wrap"></a>

## Function `wrap`

Create a new timelocked tao. <code>unlock_time</code> is in seconds, will be
compared against <code><a href="_now_seconds">DiemTimestamp::now_seconds</a>()</code> on production
network. Time can be 0, at least for now.


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_wrap">wrap</a>&lt;Content&gt;(unlock_time: u64, content: Content): <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_wrap">wrap</a>&lt;Content&gt;(unlock_time: u64, content: Content): <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; {
    <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; { unlock_time, content }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result.unlock_time == unlock_time && result.content == content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock_read"></a>

## Function `read`

Immutable read-only reference to the unlock time, and the <code>content</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_read">read</a>&lt;Content&gt;(tao: &<a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;): (&u64, &Content)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_read">read</a>&lt;Content&gt;(tao: &<a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt;): (&u64, &Content) {
    <b>let</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; { unlock_time, content } = tao;

    (unlock_time, content)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>ensures</b> result_1 == tao.unlock_time;
<b>ensures</b> result_2 == tao.content;
</code></pre>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap"></a>

## Function `unwrap`

Extract <code>tao.content</code> if <code>tao.unlock_time</code> has passed.
Currently move-executor does not support full genesis functionality,
including timestamping. If available, then use the real timestamp.


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt;): Content {
    <b>let</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; { content, unlock_time } = tao;
    <b>let</b> current_timestamp: u64 = 100; // Default timestamp <b>if</b> is_operating() is <b>false</b>

    <b>if</b> (<a href="_is_operating">DiemTimestamp::is_operating</a>()) {
        // Currently <b>move</b>-executor does not support full genesis functionality,
        // including timestamping. If available, then <b>use</b> the real timestamp.
        current_timestamp = <a href="_now_seconds">DiemTimestamp::now_seconds</a>();
    };

    <b>assert</b>(current_timestamp &gt; unlock_time, Errors::timelock_too_early());

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> (<a href="_is_operating">DiemTimestamp::is_operating</a>() && tao.unlock_time &gt;= <a href="_spec_now_seconds">DiemTimestamp::spec_now_seconds</a>()) || (!<a href="_is_operating">DiemTimestamp::is_operating</a>() && tao.unlock_time &gt;= 100);
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
