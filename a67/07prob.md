<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Discrete Probabitily](#discrete-probabitily)
  - [Finite Probability](#finite-probability)
  - [Compl and Union](#compl-and-union)
    - [Complement](#complement)
    - [Union/Or](#unionor)
- [Probability Theroy](#probability-theroy)
  - [Assign Probability](#assign-probability)
  - [Conditional](#conditional)
  - [Pairwise/Mutual Independence](#pairwisemutual-independence)
    - [PW but not M indep](#pw-but-not-m-indep)
    - [M indep but not PW](#m-indep-but-not-pw)
  - [Bernoulli Trials](#bernoulli-trials)
- [Bayes' Theorem](#bayes-theorem)
- [Expected Value](#expected-value)
  - [Bernoulli Trials](#bernoulli-trials-1)

</div>

# Discrete Probabitily
- tl;dr
  $$\begin{aligned}
    p(E)&=\frac{|E|}{|S|}\\ 
    &=\sum_{s\in E}p(s)\\
    &=1-p(\overline E)\\ 
    &=p(E|F)p(F)+p(E|\overline F)p(\overline F)\\
    \sum_{s\in S}p(s)&=\sum_{i=1}^np(x_1)=1\\
    p(E\cap F)&=p(E)p(F|E)\\
    p(E\cup F)&=p(E)+p(F)-p(E\cap F)\\
    p(E|F)&=\frac{p(E\cap F)}{p(F)}=\frac{p(F|E)p(E)}{p(F)}\\ 
    &=\frac{p(F|E)p(E)}{p(F|E)p(E)+p(F|\overline E)p(\overline E)}\\
    b(k;n,p)&=C(n,k)p^kq^{n-k}\\ 
    E(X)&=\sum_{r\in X(S)}p(X=r)r\\
  \end{aligned}$$

## Finite Probability
<blockquote>

**Laplace**: let $S$ be the *sample space* of an experiment and $E$ be an *event* in $S$, then the probability of $E$ is

$$p(E)=\frac{|E|}{|S|}$$
</blockquote>

- **experiment**: *procedure* that results in *one* of a possible set of outcomes
- **sample space**, set $S$: includes *all possible outcomes* of the experiment
- $|S|$ is the **size** of $S$
- **compound event** is a subset of $S$


<details>
  <summary>poker hand</summary>

prob that **a hand of 5 cards** in poker is **four of a kind**
- sample space = pick a hand = $C(52,5)$
1. choose `1` rank: $C(13,1)$
2. choose `4` suits for the rank: $C(4,4)$
3. choose the 5th card: $C(48,1)$
$$\frac{C(13,1)C(4,4)C(48,1)}{C(52,5)}$$
</details>

## Compl and Union
### Complement
> complement of $E$ is $\overline E$ and
> $$p(\overline E)=1-p(E)$$

<details>
  <summary>10 bits with at least one 0</summary>

- $E$: at least one 0, $\overline E$: all ones
- $p(E)=1-p(\overline E)=1-\frac1{2^{10}}=\frac{1023}{1024}$
</details>

### Union/Or
> $$p(E_1\cup E_2)=p(E_1)+p(E_2)-p(E_1\cap E_2)$$

<details>
  <summary> generate bit string of <code>4</code></summary>

- $E$: begins with `1`
- $F$: contains even number of `1`
- find $p(E\cup F)$

1. sample space = any string = $2^4=16$
2. $p(E)$: `3` positions to put 1 or 2
   $$p(E)=\frac{2^3}{2^4}=\frac12$$
3. $p(F)$: choose `0`x1 or `2`x1 or `4`x1
   $$p(F)=\frac{C(4,0)+C(4,2)+C(4,4)}{16}=\frac{1+6+1}{16}=\frac12$$
4. $p(E\cap F)$: choose `1`x1 or `3`x1 in `3` places
   $$p(E\cap F)=p(E)p(F|E)=\frac12\cdot\frac{C(3,1)+C(3,3)}{2^3}=\frac14$$
5. $$p(E\cup F)=p(E)+p(F)-p(E\cap F)=\frac12+\frac12-\frac14=\textcolor{aqua}{\frac34}$$
</details>

# Probability Theroy
## Assign Probability
> let $s$ be each outcome, then $0\le p(s)\le 1$ for ecah $s\in S$
> $$\sum_{s\in S}p(s)=\sum_{i=1}^np(x_1)=1$$
- suppose $S$ is a set with $n$ *distributed uniformly*, then for $s\in S$
  $$p(s)=1/n$$
- suppose $E$ contains multiple outcome $s$
  $$p(E)=\sum_{s\in E}p(s)$$

<details>
  <summary>weighted die</summary>

- even numbers have prob of $p$ being rolled and odd have $3p$, find $p$
  $$\sum_{i=1}^6p(i)=1=3(3p+p)=12p\\ 
  \therefore\;p=\frac1{12}$$
- prob of getting sum of `7`
  1. `(1,6)`, `(2,5)`, `(3,4)`, `(4,3)`, `(2,5)`, `(6,1)`
  2. $\because$ all possibilities has `1` odd and `1` even number
  3. $\therefore 6\cdot\frac1{12}\cdot\frac3{12}=\textcolor{aqua}{\frac5{24}}$
</details>

## Conditional
> the *conditional probabilty* of $E$ given $F$ is
> $$p(E|F)=\frac{p(E\cap F)}{p(F)}=\frac{p(E)p(F|E)}{p(F)}$$

<details>
  <summary>bit string of <code>4</code></summary>

- $E$: contains at least `2` consecutive 0s
- $F$: first bit is 0
- find $p(E|F)$

1. $|S|=2^4=16$
2. $p(E\cap F)$ = {0000, 0001, 0010, 0011, 0100} = $5/16$
3. $p(F)=1/2$
  $$p(E|F)=\frac{5/16}{1/2}=\textcolor{aqua}{\frac58}$$
</details>

## Pairwise/Mutual Independence
- $A$ $B$ $C$ are *pairwise independent* iff
  - $p(A\cap B)=p(A)p(B)$
  - $p(A\cap C)=p(A)p(C)$
  - $p(B\cap C)=p(B)p(C)$
- $A$ $B$ $C$ are *mutually independent* iff
  - $A$ $B$ $C$ are pairwise independent
  - $p(A\cap B\cap C)=p(A)p(B)p(C)$

### PW but not M indep
<details>
  <summary>toss a fair coin twice</summary>

- $A$: both gives the same outcome `{ HH, TT }`
- $B$: first toss is H `{ HT, HH }`
- $C$: second toss is T `{ HT, TT }`

then
- $p(A)=p(B)=p(C)=\frac12$
- $p(A\cap B)=p(A\cap C)=p(B\cap C)=\frac 14$ (pw indep)
- $p(A\cap B\cap C)=0\neq p(A)p(B)p(C)$ (not m indep)
</details>

### M indep but not PW
<details>
  <summary>p(C) = 0</summary>

- let $p(A\cap B)=p(A)p(B|A)\neq p(A)p(B)$ (not PW indep)
- $p(A\cap B\cap C)=0=p(A)p(B)p(C)$ (m indep)
</details>

## Bernoulli Trials
> when there's *success* $p$ and *failure* $q$<br>
> $p+q=1$
- probability of $k$ successes in $n$ independent trails
  $$b(k;n,p)=C(n,k)p^kq^{n-k}$$

<details>
  <summary>prob of getting <code>8</code> zeros in <code>10</code> bits where <code>p(get zero)=0.9</code></summary>

$$p(8;10,0.9)=C(10,8)(0.9)^8(0.1)^2\approx0.19$$
</details>

# Bayes' Theorem
> $$p(F|E)=\frac{p(E|F)p(F)}{p(E|F)p(F)+p(E|\overline F)p(\overline F)}$$

<details>
  <summary>disease</summary>

- $p($get disease$)=\textcolor{aqua}{p(F)=0.00001}$
  - $\textcolor{lime}{p(\overline F)}=1-p(F)=\textcolor{lime}{0.99999}$
- $p(E)=p($test positive$)$
- $p($true positive$)=\textcolor{aqua}{p(E|F)=0.99}$
  - false positive $\textcolor{lime}{p(E|\overline F)}=1-p(\overline E|\overline F)=\textcolor{lime}{0.005}$
- $p($true negative$)=\textcolor{aqua}{p(\overline E|\overline F)=0.995}$
  - false negative $\textcolor{lime}{p(\overline E|F)}=1-p(E|F)=\textcolor{lime}{0.01}$

prob that tests positive and has disease
- find $\textcolor{coral}{p(F|E)}$
  $$\textcolor{coral}{p(F|E)}=\frac{\textcolor{aqua}{p(E|F)p(F)}}{\textcolor{aqua}{p(E|F)p(F)}+\textcolor{lime}{p(E|\overline F)}\textcolor{aqua}{p(\overline F)}}\approx0.002$$

prob that tests negative and not have disease 
- find $\textcolor{coral}{p(\overline F|\overline E)}$
  $$\textcolor{coral}{p(\overline F|\overline E)}=\frac{\textcolor{aqua}{p(\overline E|\overline F)p(\overline F)}}{\textcolor{aqua}{p(\overline E|\overline F)p(\overline F)}+\textcolor{lime}{p(\overline E|F)}\textcolor{aqua}{p(F)}}$$
</details>



# Expected Value
> *expected value*/*expectation*/*mean*:
> $$E(X)=\sum_{s\in S}p(s)X(s)=\sum_{r\in X(S)}p(X=r)r$$
> (can write `E[X]` but the brackets are too ugly in latex)

- toss 3 coins, expected number of `H`
  ```js
  E[X] = (1/8)( X('HHH') + X('HHT') + X('HTH') + X('THH') +
                X('TTH') + X('THT') + X('HTT') + X('TTT') )
       = (1/8)( 3 + 2 + 2 + 2 + 1 + 1 + 1 + 0 )
       = 3/2
  ```
- toss 2 dices, expected sum of numbers
  ```js
  /**
   * p(X=2) == p(X=12) == 1/36
   * p(X=3) == p(X=11) == 2/36
   * p(X=4) == p(X=10) == 3/36
   * p(X=5) == p(X=9)  == 4/36
   * p(X=6) == p(X=8)  == 5/36
   *           p(X=7)  == 6/36
   **/
  E[X] = (2 + 12) * (1/36) + (3 + 11) * (2/36) +
         (4 + 10) * (3/36) + (5 + 9) * (4/36) +
         (6 + 8) * (5/36) + 7 * (6/36)
       = 7
  ```

## Bernoulli Trials
> expected number of successes with $n$ mutually independent trials and $p$ as prob of success on each trial is `E[X] = np`
