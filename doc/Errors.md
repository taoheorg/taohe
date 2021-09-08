
<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors"></a>

# Module `0x2f66c09143acc52a85fec529a4e20c85::Errors`

This is to improve our error handling, and to make it more informative.

We follow the "category" approach of Diem Standard Library, with
additional "subcategory" for different taos.
Subcategories start from 1, so a TaoHe error message can be
distinguished from other error messages by:
category == 0x80 and subcategory >= 0x01.


-  [Constants](#@Constants_0)
-  [Function `make`](#0x2f66c09143acc52a85fec529a4e20c85_Errors_make)
-  [Function `general`](#0x2f66c09143acc52a85fec529a4e20c85_Errors_general)
-  [Function `timelock_too_early`](#0x2f66c09143acc52a85fec529a4e20c85_Errors_timelock_too_early)
-  [Function `ownable_not_owned`](#0x2f66c09143acc52a85fec529a4e20c85_Errors_ownable_not_owned)


<pre><code></code></pre>



<a name="@Constants_0"></a>

## Constants


<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_CATEGORY_TAOHE"></a>



<pre><code><b>const</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_CATEGORY_TAOHE">CATEGORY_TAOHE</a>: u8 = 128;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_GENERAL"></a>



<pre><code><b>const</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_GENERAL">TAO_GENERAL</a>: u8 = 1;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_OWNABLE"></a>



<pre><code><b>const</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_OWNABLE">TAO_OWNABLE</a>: u8 = 3;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_TIMELOCK"></a>



<pre><code><b>const</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_TIMELOCK">TAO_TIMELOCK</a>: u8 = 2;
</code></pre>



<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_make"></a>

## Function `make`

Adapted from Diem Standard Library's Errors.move.
Added tao identifier.


<pre><code><b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_make">make</a>(tao_id: u8, reason: u64): u64
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_make">make</a>(tao_id: u8, reason: u64): u64 {
    (reason &lt;&lt; 16) | ((tao_id <b>as</b> u64) &lt;&lt; 8) | (<a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_CATEGORY_TAOHE">CATEGORY_TAOHE</a> <b>as</b> u64)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_general"></a>

## Function `general`

This is used for general TaoHe errors, not part of any specific module.


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_general">general</a>(reason: u64): u64
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_general">general</a>(reason: u64): u64 { <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_make">make</a>(<a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_GENERAL">TAO_GENERAL</a>, reason) }
</code></pre>



</details>

<details>
<summary>Specification</summary>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_timelock_too_early"></a>

## Function `timelock_too_early`

This code is used by Timelock.move when unlock time haven't passed yet.


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_timelock_too_early">timelock_too_early</a>(): u64
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_timelock_too_early">timelock_too_early</a>(): u64 { <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_make">make</a>(<a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_TIMELOCK">TAO_TIMELOCK</a>, 15) }
</code></pre>



</details>

<details>
<summary>Specification</summary>



</details>

<a name="0x2f66c09143acc52a85fec529a4e20c85_Errors_ownable_not_owned"></a>

## Function `ownable_not_owned`

This code is used by Ownable.sol when the <code>account</code> is not the owner.


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_ownable_not_owned">ownable_not_owned</a>(): u64
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_ownable_not_owned">ownable_not_owned</a>(): u64 { <a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_make">make</a>(<a href="Errors.md#0x2f66c09143acc52a85fec529a4e20c85_Errors_TAO_OWNABLE">TAO_OWNABLE</a>, 15) }
</code></pre>



</details>

<details>
<summary>Specification</summary>




<pre><code><b>pragma</b> aborts_if_is_strict;
</code></pre>



</details>
