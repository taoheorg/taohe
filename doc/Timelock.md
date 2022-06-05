
<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Timelock`

Simple timelocked tao: allow extracting only when a certain time has passed


-  [Resource `Tao`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao)
-  [Function `wrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_wrap)
-  [Function `read`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_read)
-  [Function `unwrap`](#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap)


<pre><code><b>use</b> <a href="">0x2f66c09143acc52a85fec529a4e20c85::Adapter</a>;
<b>use</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors">0x2f66c09143acc52a85fec529a4e20c85::Errors</a>;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao"></a>

## Resource `Tao`

Tao for a simple timelock: extract <code>content</code> if <code>unlock_time</code> has
passed (in seconds).


<pre><code><b>struct</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; <b>has</b> store, key
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
compared against <code><a href="_current_timestamp">Adapter::current_timestamp</a>()</code> on production
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


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Timelock::Tao</a>&lt;Content&gt;): Content
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_unwrap">unwrap</a>&lt;Content&gt;(tao: <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt;): Content {
    <b>let</b> <a href="Timelock.md#0x2f66c09143acc52a85fec529a4e20c85_Timelock_Tao">Tao</a>&lt;Content&gt; { content, unlock_time } = tao;
    <b>let</b> current_timestamp: u64 = <a href="_current_timestamp">Adapter::current_timestamp</a>();

    <b>assert</b>!(current_timestamp &gt; unlock_time, <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_timelock_too_early">Errors::timelock_too_early</a>());

    content
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> (tao.unlock_time &gt;= <a href="_current_timestamp">Adapter::current_timestamp</a>());
</code></pre>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
