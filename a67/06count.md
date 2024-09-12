<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Basic Counting](#basic-counting)
    - [Product Rule](#product-rule)
    - [Sum Rule](#sum-rule)
- [Pigeonhole Principle](#pigeonhole-principle)
- [Perms and Combs](#perms-and-combs)
    - [Permutation](#permutation)
        - [Fixed Block/Substring](#fixed-blocksubstring)
    - [Combination](#combination)
- [Generalised Perms and Combs](#generalised-perms-and-combs)
    - [Perms with Repetition](#perms-with-repetition)
        - [Example](#example)
    - [Combs with Rep (Stars and Bars)](#combs-with-rep-stars-and-bars)
        - [Example](#example-1)
- [Poker Hands Examples](#poker-hands-examples)

</div>

# Basic Counting
## Product Rule
> procedure that can be broken down into a sequence of steps<br>
> if there are $n_1$ ways to do step 1 **and** and $n_2$ ways to do step 2, then there are $n_1n_2$ ways to do the procedure

## Sum Rule
> step that can be done in one of $n_1$ ways **or** one of $n_2$ ways, then there are $n_1+n_2$ ways to do the step

# Pigeonhole Principle
> if $N$ pigeon are put into $k$ holes such that, then *at least one* hole must contain *at least* $\lceil N/k\rceil$ pigeons

<details>
    <summary>cumsum</summary>

show if must do $45$ times in $30$ days and must do at least once a day, then $\exist$ some consecutive days that must do $14$ times

- for $1\le i\le45$ let $a_i$ be number of times done until $i$-th day inclusive
    - $\therefore$ for $a_i$, $\enspace1<a_1<a_2<...<a_{30}\le45$ (30 integers)
- need to prove $\exist i,j$ st $1\le i<j\le45$ and $a_j-a_i=14\implies a_j=a_i+14$
    - $\therefore$ for $a_i+14$, $\enspace15<a_1+14<a_2+14<...<a_{30}+14\le59$ (30 integers)
- $\because\;\exist60$ integers in the interval $[1,59]$, which only contains $59$ integers
    - (PHP) $\therefore\;2$ integers must be equal, let them be $a$ and $b$ st $x=y$
- $\because$ for $1\le i<j\le45$ all integers of $a_i+14$ are distinct and all integers of $a_j$ are distinct
    - $\therefore$ $x$ and $y$ cannot be both $a_i+14$ or both $a_j$
    - $\therefore$ let $x=a_i+14$ and $y=a_j$
    - $\therefore\;x=y\implies a_i+14=a_j\implies a_j-a_i=14\quad\blacksquare$

- for $a+b=2n-1$, if must do $a$ times in $n$ days and must do at least once a day, then must do $b$ times consecutively
</details>



# Perms and Combs
## Permutation
> ordered arrangement of $r$ elements from $n$ items is **$r\text{-permutation}$**

$r$-permutation of a set with $n$ distinct elements:
$$P(n,r)=\frac{n!}{(n-r)!}\quad1\le r\le n$$

### Fixed Block/Substring
> treat substring as a single block

example: perms of $ABCDEFGH$ that contains $ABC$ and $FG$
1. treat $\textcolor{red}A\textcolor{orange}B\textcolor{yellow}C\textcolor{lime}D\textcolor{aqua}E\textcolor{blue}F\textcolor{purple}GH$ as $\textcolor{red}{ABC}\textcolor{lime}D\textcolor{aqua}E\textcolor{blue}{FG}H$
2. "8-perm of 8" becomes "5-perm of 5"
3. answer = $5!$

## Combination
> unordered selection of $r$ elements from $n$ objects

$$C(n,r)=\binom nr=\binom n{n-r}=\frac{P(n,r)}{r!}=\frac{n!}{r!(n-r)!}$$

# Generalised Perms and Combs
## Perms with Repetition
> $r$-permution of $n$ objects **with repetition** is $n^r$ (basically [product rule](#product-rule))

$$P(n;r_1,r_2,...,r_m)=\frac{n!}{r_1!r_2!...r_m!}$$

- $r$ should be in decreasing order

### Example
permute string `1123444` (length = 7)
- $7!$ ways to arrange with duplicates
- $2!$ duplicates for `1` and $3!$ for `4`
- $\therefore\frac{7!}{3!2!}=P(7;3,2)$ 

## Combs with Rep (Stars and Bars)
$$\binom{r+n-1}r=\binom{r+n-1}{n-1}=\frac{(r+n-1)!}{r!(n-1)!}$$
where
- $n$ is number of categories (bars)
- $r$ is number of items to distridute (stars)

### Example
put `r=5` stars in `n=7` categories, eg:
```
   |   |   | **|   |   |***  =>  |||**|||***
 * | * | **|   | * |   |     =>  *|*|**||*||
 * |   |   | **|   | * | *   =>  *|||**||*|*
```
- 7 categories = 6 bars
- permute string containing 6 `|`s and 5 `*`s
$$P(11;6,5)=\frac{11!}{5!6!}=\binom{11}5=\binom{n+r-1}r$$

# Poker Hands Examples
> sample size = `C(52,5)`

<details open>
    <summary>Four of a kind (<code>AAAA4</code>)</summary>

1. choose `1` rank from `4`
2. choose `4` suits for that rank
3. choose any card that is not that rank (`48`)
$${13 \choose 1}{4 \choose 4}{48 \choose 1}$$
</details>

<details open>
    <summary>Full House (<code>888KK</code>)</summary>

1. choose `1` rank from `13`
2. choose `3` suit from `4` for that rank
3. choose `1` rank from other `12`
4. choose `2` suit from other `3` for the second rank

$${13 \choose 1}{4 \choose 3}{12 \choose 1}{3 \choose 2}$$
</details>