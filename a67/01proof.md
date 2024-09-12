<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Propositional Logic](#propositional-logic)
    - [Proposition](#proposition)
        - [Operators](#operators)
    - [Conditional/Implication](#conditionalimplication)
        - [Conv/Contr/Inv](#convcontrinv)
    - [Compound Proposition](#compound-proposition)
    - [Precedence of Operators](#precedence-of-operators)
    - [Equivalences](#equivalences)
        - [Examples](#examples)
- [Application](#application)
    - [Translate English](#translate-english)
    - [Logic Puzzles](#logic-puzzles)
- [Quantifiers](#quantifiers)
    - [Equivalences](#equivalences-1)
    - [Nested](#nested)
    - [Translation](#translation)
- [Inference](#inference)
    - [Example](#example)
- [Proof](#proof)
    - [Direct](#direct)
        - [Forall Impl](#forall-impl)
        - [Forall Exist](#forall-exist)
    - [Contraposition](#contraposition)
        - [Vacuous](#vacuous)
    - [Contradiction](#contradiction)

</div>

# Propositional Logic
## Proposition
> declarative sentence (declares a *true or false* fact)

- *propositional variables*: $p$,$q$,$r$,$s$...
- *truth value*: $T$ for true, $F$ for false
- *atomic propositions*: propositions that cannot be expressed in terms of simpler propositions
- *compound propositions*: form using *logical operators*

### Operators
<style>
    .truth tr td:nth-child(2){border-right: 1px solid white;}
    .truth tr th:nth-child(2){border-right: 1px solid white;}
    .truth .t{color:lime;}
    .truth .t::after{content:'T';}
    .truth .f{color:red;}
    .truth .f::after{content:'F';}
</style>
<center class=truth>

|      $p$       |      $q$       |    $\neg p$    |   $p\land q$   |   $p\lor q$    |  $p\oplus q$   |   $p\rightarrow q$   |  $p\lrarr q$   |
| :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | :------------: |
| <span class=t> | <span class=t> | <span class=f> | <span class=t> | <span class=t> | <span class=f> | <span class=t> | <span class=t> |
| <span class=t> | <span class=f> | <span class=f> | <span class=f> | <span class=t> | <span class=t> | <span class=f> | <span class=f> |
| <span class=f> | <span class=t> | <span class=t> | <span class=f> | <span class=t> | <span class=t> | <span class=t> | <span class=f> |
| <span class=f> | <span class=f> | <span class=t> | <span class=f> | <span class=f> | <span class=f> | <span class=t> | <span class=t> |
</center>


```cpp
  ¬ p  =  not p
p ∧ q  =  p and q
p ∨ q  =  p or q
p ⊕ q  =  p xor q  =  not(p == q)
p -> q  =  q or (p == q) // p if q
p <-> q  =  p == q        // p iff q
```

## Conditional/Implication
<center>

```cpp
p -> q
```
</center>

- `p` is *hypothesis/premise*
- `q` is *conclusion/consequence*

### Conv/Contr/Inv
|    Statement     |  `p -> q`  |
| :--------------: | :--------: |
|    *converse*    |  `q -> p`  |
|    *inverse*     | `!p -> !q` |
| *contrapositive* | `!q -> !p` |

## Compound Proposition
<center class=truth>

|      $p$       |      $q$       |    $\neg q$    | $p\lor\neg q$  |   $p\land q$   | $(p\lor\neg q)\rightarrow(p\land q)$ |
| :------------: | :------------: | :------------: | :------------: | :------------: | :----------------------------: |
| <span class=t> | <span class=t> | <span class=f> | <span class=t> | <span class=t> |         <span class=t>         |
| <span class=t> | <span class=f> | <span class=t> | <span class=t> | <span class=f> |         <span class=f>         |
| <span class=f> | <span class=t> | <span class=f> | <span class=f> | <span class=f> |         <span class=t>         |
| <span class=f> | <span class=f> | <span class=t> | <span class=t> | <span class=f> |         <span class=f>         |
</center>

## Precedence of Operators
```cpp
// order from left to right
not, and, or, ->, <->
// these two are equivalent
p -> q or r and not s
p -> (q or (r and (not s)))
```

## Equivalences
|            Law |                                                                                                                            Equiva | lence                                                                                                                              |
| -------------: | --------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------- |
|    Commutative |                                                                         $p\textcolor{aqua}\land q\equiv q\textcolor{aqua}\land p$ | $p\textcolor{coral}\lor q\equiv q\textcolor{coral}\lor p$                                                                          |
|    Associative |                        $(p\textcolor{aqua}\land q)\textcolor{aqua}\land r\equiv p\textcolor{aqua}\land(q\textcolor{aqua}\land r)$ | $p\textcolor{coral}\lor(q\textcolor{coral}\lor r)\equiv(p\textcolor{coral}\lor q)\textcolor{coral}\lor r$                          |
|   Distributive | $p\textcolor{aqua}\land(q\textcolor{coral}\lor r)\equiv(p\textcolor{aqua}\land q)\textcolor{coral}\lor(p\textcolor{aqua}\land r)$ | $(p\textcolor{coral}\lor q)\textcolor{aqua}\land(p\textcolor{coral}\lor r)\equiv p\textcolor{coral}\lor(q\textcolor{aqua}\land r)$ |
|       Negation |                                                                            $p\textcolor{coral}\lor\neg p\equiv \textcolor{lime}T$ | $p\textcolor{aqua}\land\neg p\equiv \textcolor{red}F$                                                                              |
|      Universal |                                                                $p\textcolor{coral}\lor \textcolor{lime}T\equiv \textcolor{lime}T$ | $p\textcolor{aqua}\land \textcolor{red}F\equiv \textcolor{red}F$                                                                   |
|       Identity |                                                                                $p\textcolor{aqua}\land \textcolor{lime}T\equiv p$ | $p\textcolor{coral}\lor \textcolor{red}F\equiv p$                                                                                  |
|      De Morgan |                                                           $\neg(p\textcolor{aqua}\land q)\equiv\neg p\textcolor{coral}\lor\neg q$ | $\neg p\textcolor{aqua}\land\neg q\equiv\neg(p\textcolor{coral}\lor q)$                                                            |
|     Absorption |                                                                        $p\textcolor{coral}\lor(p\textcolor{aqua}\land q)\equiv p$ | $p\equiv p\textcolor{aqua}\land(p\textcolor{coral}\lor q)$                                                                         |
|    Conditional |                                                                                     $p\rightarrow q\equiv\neg p\textcolor{coral}\lor q$ | $p\textcolor{aqua}\land\neg q\equiv\neg(p\rightarrow q)$                                                                                 |
|  Biconditional |                                                                        $p\lrarr q\equiv(p\rightarrow q)\textcolor{aqua}\land(q\rightarrow p)$ |
| Contrapositive |                                                                                                 $p\rightarrow q\equiv\neg q\rightarrow\neg p$ |
|     Double Neg |                                                                                                            $\neg(\neg p)\equiv p$ |

### Examples
$$\begin{aligned}
    \neg(p\lor(\neg p\land q))&\equiv\neg p\land\neg(\neg p\land q)\\
    &\equiv\neg p\land(p\lor\neg q)\\
    &\equiv(\neg p\land p)\lor(\neg p\lor q)\\
    &\equiv F\lor(\neg p\lor q)\\
    &\equiv\neg p\lor q
\end{aligned}$$

$$\begin{aligned}
    (p\land q)\rightarrow(p\lor q)&\equiv\neg(p\land q)\lor(p\lor q)\\
    &\equiv(\neg p\lor\neg q)\lor(p\lor q)\\
    &\equiv(\neg p\lor p)\lor(q\lor\neg q)\\
    &\equiv T\lor T\equiv T
\end{aligned}$$

# Application
## Translate English

- you can access the internet from campus **only if** your are a cs major or you are not a freshman
  ```cs
  CanAccessInternet -> CSMajor or not Freshman
  ```
- you cannot ride the rollar coaster **if** you are under 4 feet tall unless you are older than 16 years old
  ```cs
  (Under4Feet and not OlderThan16) -> not CanRide
  ```

## Logic Puzzles
- treasure is in one of the 3 boxes
    - let $p_i$ be "box $i$ has treasure"
    - one of "$\neg p_1$", "$\neg p_2$", "$p_2$" is true
    $$\begin{aligned}
        &\textcolor{aqua}{(\neg p_1\land\neg(\neg p_2)\land\neg p_2)}\lor\textcolor{lime}{(\neg(\neg p_1)\land\neg p_2\land\neg p_2)}\lor\textcolor{coral}{(\neg(\neg p_1)\land\neg(\neg p_2)\land p_2)}\\
        =&(p_1\land\neg p_2)\lor(p_1\land p_2)\\
        =&p_1\land(\neg p_2\lor p_2)\\
        =&p_1\land T=p_1\\
    \end{aligned}$$

- `A` says "`B` tells the truth", `B` says "one of us lie", who lies
    - let $p$ be `A` tells truth, $q$ be `B` tells truth
    - $p\rightarrow q\rightarrow p\oplus q$ which contradicts, therefore A lies
    - $\neg p\rightarrow\neg q\rightarrow\neg(p\oplus q)$ makes sense

# Quantifiers
- $\forall$ universal quantifier
- $\exists$ existential quantifier
## Equivalences
$$\begin{aligned}
    \forall xP(x)\lor Q(X)&\equiv(\forall xP(x))\lor Q(x)\\
    \forall x(P(x)\land Q(x))&\equiv\forall xP(x)\land\forall xQ(x)\\
    \neg\forall xP(x)&\equiv\exists x\neg P(x)\\
    \neg\exists xP(x)&\equiv\forall x\neg P(x)\\
\end{aligned}$$

## Nested
> $$\begin{aligned}\forall x\forall y&\equiv\forall y\forall x\\\exists x\exists y&\equiv\exists y\exists x\end{aligned}$$

| statement                  | note                          | when false                                    |
| -------------------------- | ----------------------------- | --------------------------------------------- |
| $\forall x\forall yP(x,y)$ | works for every $(x,y)$ pair  | $\exists x,y\text{ st }P(x,y)$ is false        |
| $\forall x\exists yP(x,y)$  | $y$ depends on $x$            | $\exists x\text{ st }\forall yP(x,y)$ is false |
| $\exists x\forall yP(x,y)$  | $y$ must work for all $x$     | $\forall x\exists y\text{ st }P(x,y)$ is false |
| $\exists x\exists yP(x,y)$   | only need one pair of $(x,y)$ | $P(x,y)$ false for all pairs                  |

## Translation
- English to Math
    - (impl, not and) every $S(x)$ student is $C(x)$
      $$\forall x(S(x)\rightarrow C(x))$$
        - **cant use *and* because $(F, T)$ is true**
    - (and, not impl) some $S(x)$ students are $M(x)$
      $$\exists x(S(x)\land M(x))$$
        - **cant use *impl* because $(F, T)$ should not be true**
    - (all,all) sum of 2 positive ints are *always* positive
    $$\forall x\in\mathbb{N},\forall y\in\mathbb{N}(x+y>0)$$
    - (all, exist) every real number except 0 has a multiplicative inverse
    $$\forall x((x\neq0)\rightarrow\exists y(xy=1))\\\forall x\exists y((x\neq0)\rightarrow(xy=1))$$
    - (null quantification, can move $\exists y$) a female $F(x)$ person who is parent $P(x)$ is also someone's mother $M(x,y)$
    $$\forall x\exists y(F(x)\land P(x)\rightarrow M(x,y))$$
- Math to English
    - (refactorable) $\forall x(\textcolor{aqua}{C(x)}\lor\textcolor{lime}{\exists y(C(y)\land F(x,y))})$
        - $C(x)$ $x$ has a computer
        - $F(x,y)$ $x,y$ are friends
        - all students  <span style="color:aqua">has a computer</span> or <span style="color:lime">has a friend who has a comptuer</span>
    - $\exists x\forall y\forall z((F(x,y)\land F(x,z)\land(y\neg z))\rightarrow\neg F(y,z))$
        - there is a student none of whose friends are also friends with each other

# Inference
<div class=inference>

| Modus Ponens | Modus Tollens | Conjunction | Elimination | Transitivity |
| ------------ | ------------- | ----------- | ----------- | ------------ |
| $p\rightarrow q$   | $p\rightarrow q$    | $p$         | $p\lor q$   | $p\rightarrow q$   |
| $p$          | $\neg q$      | $q$         | $\neg p$    | $q\rightarrow r$   |
| $q$          | $\neg p$      | $p\land q$  | $q$         | $p\rightarrow r$   |

| Generalisation | Specialisation | Contradiction   |
| -------------- | -------------- | --------------- |
| $p$            | $p\land q$     | $\neg p\rightarrow F$ |
| $p\lor q$      | $p$            | $p$             |

| Division into Cases |
| ------------------- |
| $p\lor q$           |
| $p\rightarrow r$          |
| $q\rightarrow r$          |
| $r$                 |
</div>

## Example
- show *it's not sunny this afternoon and it's colder than yesterday*, *we'll go swimming only if it's sunny*, *if we don't go swimming, then we'll take a canoe trip*, *if we take a canoe trip, we'll be home by sunset* leads *we'll be home by sunset*
    - $p$: it's sunny this afternoot
    - $q$: it's colder than yesterday
    - $r$: we'll go swimming
    - $s$: we'll take a canoe trip
    - $t$: we'll be home by sunset

    | Step               | Reason                       |
    | ------------------ | ---------------------------- |
    | 1. $\neg p\land q$ | premise                      |
    | 2. $\neg p$        | specialisation using (1)     |
    | 3. $r\rightarrow p$      | premise                      |
    | 4. $\neg r$        | modus tollens using (2), (3) |
    | 5. $\neg r\rightarrow s$ | premise                      |
    | 6. $s$             | modus ponens using (4), (5)  |
    | 7. $s\rightarrow t$      | premise                      |
    | $\therefore\;t$    | modus ponens using (6), (7)  |
- show *if you send me an email, then I'll finish writing the program*, *if you don't send me an email, I will go to sleep early*, *if I go to sleep early, I'll wake up feeling refreshed* lead to *if I don't finish writing the program, I'll make up feeling refreshed*
    - $p$: you send me an email
    - $q$: I'll finish writing the program
    - $r$: I'll go sleep early
    - $s$: I'll wake up feeling refreshed

    | Step                        | Reason                      |
    | --------------------------- | --------------------------- |
    | 1. $p\rightarrow q$               | premise                     |
    | 2. $\neg q\rightarrow\neg p$      | contrapositive of (1)       |
    | 3. $\neg p\rightarrow r$          | premise                     |
    | 4. $\neg q\rightarrow r$          | transitivity using (2), (3) |
    | 5. $r\rightarrow s$               | premise                     |
    | $\therefore\;\neg q\rightarrow r$ | transitivity using (4), (5) |


# Proof
## Direct
### Forall Impl
> $$\forall x\in D(P(x)\rightarrow Q(x))$$
> - let $x\in D$
>   - suppose $P(x)$ is true
>      - derive $Q(y)$ is true
>   - $\therefore P(x)\rightarrow Q(y)$
> - $\therefore\forall x\in D(P(x)\rightarrow Q(y))$

$$\forall a\in\mathbb{R}\enspace\forall x\in\mathbb{R}\enspace(x>a>0)\rightarrow(x^2>a^2)$$

- let $a,x$ be *any real number*
    - suppose $x>a>0$
        - $\begin{aligned}&\because\;x>0\\&\therefore\;x>a\mathbb{R}ightarrow x^2>xa\\\end{aligned}$
        - $\begin{aligned}&\because\;a>0\\&\therefore\;x>a\mathbb{R}ightarrow xa>a^2\end{aligned}$
        - (*transitive prop*) $\therefore\;x^2>xa>a^2$
    - $\therefore\;x>a>0\rightarrow x^2>a^2$
- $\therefore\;\forall a\in\mathbb{R}\enspace\forall x\in\mathbb{R}\enspace(x>a>0)\rightarrow(x^2>a^2)$

### Forall Exist
> $$\forall x\in S\enspace\exists y\in T\enspace p(x,y)$$
> - let $x\in S$
>   - let $y\in T$ be *in terms of* $x$
>     - derive $p(x,y)$
>   - $\therefore\exists y\in T\enspace p(x,y)$
> - $\therefore\forall x\in S\enspace\exists y\in T\enspace p(x,y)$

- prove there existn't a largest natural number
$$\forall x\in\mathbb{N}\enspace\exists y\in\mathbb{N}\quad x<y$$
- let $x$ be *any natural number*
    - let $y=x+1$ ( $\therefore\;y\in\mathbb{N}$ )
        - $\therefore\; x<y$
    - $\exists y\in\mathbb{N}\quad x<y$
- $\forall x\in\mathbb{N}\enspace\exists y\in\mathbb{N}\quad x<y$

## Contraposition
> $$\forall x\in D\enspace p(x)\rightarrow q(x)$$
> - state contrapositive
> - let $x\in D$
>   - assume $\neg q(x)$
>     - derive $\neg p(x)$
>   - $\therefore\neg q(x)\rightarrow\neg p(x)$
>   - $\therefore p(x)\rightarrow q(x)$ by contraposition
> - $\therefore\forall x\in D\enspace p(x)\rightarrow q(x)$

- $a\equiv_nb$ means `a % n == b % n`
$$\forall a,b\in\mathbb{Z},\forall n\in\mathbb{N},(a^2\not\equiv_nb^2)\rightarrow(a\not\equiv_nb)$$
- contrapositive:
$$\forall a,b\in\mathbb{Z},\forall n\in\mathbb{N},(a\equiv_nb)\rightarrow(a^2\equiv_nb^2)$$
- let $a,b\in\mathbb{Z},n\in\mathbb{N}$
    - assume $a\equiv_nb$<br>
      $\begin{aligned}
        \therefore\;&\exists p,q,r\in\mathbb{N}\text{ st }\\
        &a=np+r, \enspace b=nq+r\\
        \therefore\;&a^2=(np+r)^2=n(np^2+2p)+r^2\\
        &b^2=(nq+r)^2=n(nq^2+2q)+r^2\\
        \therefore\;&a^2\equiv r^2\mod n,\enspace b^2\equiv r^2\mod n\\
        \therefore\;&a^2\equiv_n b^2
      \end{aligned}$
    - $\therefore(a\equiv_nb)\rightarrow(a^2\equiv_nb^2)$
- $\therefore\forall a,b\in\mathbb{Z},\forall n\in\mathbb{N},(a\equiv_nb)\rightarrow(a^2\equiv_nb^2)$

### Vacuous
> prove $p$ is false will prove $p\rightarrow q$ is true

- prove that a perfect square $n$ st $10\le n\le 15$ is alse a perfect cube
    - there is no such $n$ because $3^2=9$ and $4^2=16$

## Contradiction
> $(\neg p\rightarrow(r\land \neg r))\rightarrow p$

for all non-perfect-equare $n$, $\sqrt n\not\in\Bbb{Q}$
- let $n$ be non-perfect-square
  - assume $\sqrt n\in\Bbb{Q}$<br>
    $\begin{aligned}
        \therefore\;&\exists a\in\mathbb{Z},b\in\mathbb{Z}^+\enspace(\text{gcd}(a,b)=1)\land(\sqrt n=a/b)\\
        \therefore\;&n=a^2/b^2\implies nb^2=a^2\\
        \therefore\;&n|a^2\rightarrow n|a\rightarrow\exists c\in\mathbb{Z}\enspace a=nc\\
        \therefore\;&nb^2=n^2c^2\implies b^2=nc^2\\
        \therefore\;&n|b^2\rightarrow n|b\\
        \because\;&(n|a)\land(n|b)\\
        \therefore\;&\text{gcd(a,b)}\ne 1\\
        \therefore\;&\text{contradicts}
    \end{aligned}$
  - $\therefore\;\sqrt n\not\in\Bbb{Q}$
- $\therefore$ not perfect square $\rightarrow$ sqrt is irrational

## Exhaustive
> test all possibilities

- if $n$ is positive and $n\le4$, then $(n+1)^3\ge3^n$
    - test 1,2,3,4

### By Cases
> group all into cases

- $\forall n\in\Z\quad n^2\ge n$
    - case $n<0$
    - case $n=0$
    - case $n>0$
- $\forall x,y\in\R\quad|xy|=|x||y|$
    - case $x\textcolor{aqua}\ge0$ and $y\textcolor{aqua}\ge0$
    - case $x\textcolor{aqua}\ge0$ and $y\textcolor{lime}<0$
    - case $x\textcolor{lime}<0$ and $y\textcolor{aqua}\ge0$
    - case $x\textcolor{lime}<0$ and $y\textcolor{lime}<0$
