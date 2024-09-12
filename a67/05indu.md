<div id="left">

<!-- omit in toc -->
# Induction
- [Simple](#simple)
    - [Examples](#examples)
        - [Summation](#summation)
- [Strong](#strong)
    - [Example](#example)
        - [Partition](#partition)
        - [Computational Geometry](#computational-geometry)

</div>

# Simple
> prove 
> $$P(k)\rarr P(k+1)$$

1. express the statement
    - e.g. $\forall n\ge b,P(n)$
      <br>$\forall n\in\Z^+,P(n)$ (b=1)
2. **base** case
    - prove $P(b)$ is true
3. **inductive** hypothesis
    - let $k\ge b$, assume $P(k)$ is true
    - prove $P(k)\rarr P(k+1)$
4. $\therefore$ by induction $\forall n\ge b,P(n)$

## Examples
### Summation
> the sum of first $n$ odd natural numbers is $n^2$

1. let $S(n)$ be $\sum_{i=0}^{n-1}(2i+1)=n^2$
2. base: $n=1$ then $1=1^2$<br>
   $\therefore S(1)$ is true
3. IH: let $k\in\N$ assume $S(k)$ is true
4. prove $S(k)\rarr S(k+1)$
   $$\begin{aligned}
       \sum_{i=0}^k(2i+1)&=2i+1+\sum_{i=0}^{k-1}(2i+1)\\
       &\overset{\text{IH}}=2k+1+k^2\\
       &=(k+1)^2
   \end{aligned}$$
5. $\therefore$ by induction $S(n)$ is true for odd natural numbers $\quad\blacksquare$

# Strong
> prove
> $$\forall 0\le b<k\quad P(b)\rarr P(k)$$

- use when need multiple previous values

## Example
### Partition
> prove every amount of 12 or more can be partitioned into 4s and 5s

- $S(n)$: $n$ can be partitioned using 4 and 5
- IH: assume $\forall 12\le a<n\quad S(a)$ is true
- prove $S(n)$
    - case $n\in\{12,13,14,15\}$ (**calculate manually**): true
    - case $n>15$:
        - case *4* was used in $S(n-1)$:<br>
          **change that *4* to *5*** to form $S(n)$
        - case only *5* was used in $S(n-1)$<br>
          $\because n-1\ge15\quad\therefore$ at least 3 *5*s was used<br>
          $\therefore$ replace 3 *5*s with 4 *4*s to form $S(n)$

### Computational Geometry
pre:
- a *polygon* is a closed figure consisting a sequence of *sides* ($s$)<br>
  each pair of consecutive sides $(s_i,s_{i+1})$ and $(s_1,s_n)$ meet at a common endpoint
    - a polygon is *simple* if no two nonconsecutive sides intersect
- a simple polygon's *diagonal*  is a segment connecting 2 nonconsecutive vertices
    - an *interior diagonal* lies entirely inside the polygon
> lemma: every simple polgon with $n\ge4$ sides has an *interior diagonal*<br>
> prove $T(n)$: a *simple polgyon* with $n\ge3$ sides can be triangulated into $n-2$ triangles<br>

- IH: assume $T(a)$ is true $\forall$ integer $3\le a<n$
- prove $T(n)$: can be triangulated into $n-2$ triangles
    - suppose simple polygon $P$ with $n$ sides<br>
      $\because\;3<n\implies n\ge4\quad\therefore\;$ has interior diagonal $ab$<br>
      $\therefore\;ab$ splits $P$ into simple polygons $Q$ with $q$ sides and $R$ with $r$ sides<br>
      $\because\;Q$ and $R$ both have at least 1 fewer side that $P$ does<br>
      $\therefore\;3\le q,r<n$ and $q+r-1=n$<br>
      $\because$ (IH) $Q$ and $R$ can be trianguulated into $q-2$ and $r-2$ triangles<br>
      $\therefore\;P$ can be trianguulated into $(q-2)+(r-2)+2=n-2$ triangles

<details>
    <summary>prove lemma</summary>

> prove simple polygon $P$ with $n\ge4$ sides has an interior diagonal

- let $b$ be a point in/on $P$ with the least x-coord, then with the least y-coord<br>
  $\therefore\;b$ must be a vertex<br>
  let $a$,$c$ be the vertices that share the same edge as $b$<br>
  $\therefore\;\angle abc<180\degree$ (because smallest $b$ has x-coord)<br>
  let $T$ be $\triangle abc$<br>
  - case no vertices are in $T$<br>
    $ac$ is an interior diagonal
  - case has verticies in $T$<br>
    let $p$ be a vertex in $T$ st $\angle bap$ is smallest<br>
    $\therefore$ the ray $a$ through $p$ touches $bc$<br>
    $\therefore\triangle baq$ contains no vertices<br>
    $\therefore bp$ is an interior diagonal

![](https://cdn.discordapp.com/attachments/886644344470269992/917919500215672912/unknown.png)
</details>