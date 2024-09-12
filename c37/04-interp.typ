#import "./preamble.typ": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

= Approximation & Interpolation

== Types of Approximation

#definition(name: [(Truncated Taylor series)])[
  Given differentiable function $f:D ⊆ RR → RR$ and fix point $a in D$, the *truncated Taylor series* of $f$ is the approximation

  $
    p(x)=f(a)+f'(a)(x-a)+ ⋯+f^((n)) / (n!) (x-a)^n=sum_(k=0)^n (f^((k))(a)) / (k!) (x-a)^k
  $

  The *error* is

  $
    e(x) ≝ f(x)-p(x)= (f^((n+1))(η)) / ((n+1)!) (x-a)^(n+1)
  $
  for some $η in [x,a]$
]

#definition(name: [(Types of approximation)])[

  Let $f$ be the underlying function to approximate

  + _Interpolation._\
    Find $p(x)$ such that $p(x_i)=f(x_i)$ for each $0≤ i ≤ n$
  + _Least Squares Approximation._\
    Find $p(x)$ to minimise $||f-p||_2$ where
    $
      ||f-p||_2 ≝ (∫_a^b (f(x)-p(x)^2)d x)^(1"/"2)
    $
    Other norms:
    - min-max approximation
    $
      ||f-p||_∞ &≝ max_(a ≤ x ≤ b) |f(x)-p(x)|\
    $
    - 1-norm approximation
    $
      ||f-p||_1 &≝ ∫_a^b |f(x)-p(x)| d x
    $
]

== Polynomial Approximation


#definition[
  Let $Pn ≝ {f(x) in RR[x]: deg f(x) ≤ n}$ be polynomials of degree at most $n$.

  *Remark.* $Pn$ is a function space with dimention $n+1$.

  *Remark.* $Pn$ can be spanned by the *monomial basis* ${(x-c)^i}_(i ≤ n)$ for any $c$.
]

#theorem(name: [(Weierstrass' theorem)])[
  If $f in C[a,b]$, then for any $ε > 0$

  $
    ∃p in Pn quad ||f-p||_∞ < ε
  $
]

== Numerical Methods for Polynomial Interpolation

=== Vandermonde (Undetermined Coefficients)

#theorem[
  Given function ${(x_i,y_i)}_(0 ≤ i ≤ n)$, there exists an unique $p(x) in Pn$ such that $p(x_i)=y_i$ for each $i$.
]
#proof[
  We wish to find coefficients $bold(a) in RR^n$ satisfying

  $
    p(x_i) ≝ a_0+a_1 x_i+ ⋯ + a_n x_i^n = y_i.
  $

  Thus, we set up the system $V bold(a)=bold(y)$, where $V$ is the *Vandermonde matrix*

  $
    amat(1,x_0,x_0^2,⋯,x_0^n,y_0; 1,x_1,x_1^2,⋯,x_1^n,y_1; dots.v, dots.v, dots.v, dots.down, dots.v, dots.v; 1,x_n,x_n^2, ⋯,x_n^n, y_n)
  $
]

#lemma[$V$ is invertible]
#proof[
  Observe that $V$ is invertible iff $V$ is nonsingular, meaning $∄ a ≠ 0 $ such that $V a= 0$.

  BWOC let $a ≠ 0$ be root of $V$. Thus (by definition of $V$) each distinct $x_i$ is root of $p in Pn$, contradicting that $p$ only has at most $n$ roots (since $deg p ≤ n$ and FToAlgebra).
]

#lemma[
  The determinant of Vandermonde matrix is
  $
    det V= (-1)^(n+1) product_(i=1)^n product_(j=0)^(i-1)(x_i-x_j) ≠ 0
  $
]

#remark[
  The quality of Vandermonde depends on condition of $V$, and cost of $P A= L U$ (i.e. $n^3"/"3+cal(O)(n^2)$ flops). Typically very bad.
]

== Lagrange Rules

#theorem(name: [(Lagrange basis)])[
  Given data points ${(x_i,y_i)}$, the *lagrange basis* is, for $0≤ i≤ n$

  $
    ℓ_i (x)=product_(j=0\ j ≠ i)^n (x-x_j) / (x_i-x_j) in Pn.
  $
  The *langrage interpolation* is

  $
    p(x) = sum_(0≤ i≤ n) y_i ℓ_i (x)
  $
  satisfying $p(x_i)=y_i$ for each $i$
]

#lemma[
  For each $0≤ i,j ≤ n$

  $
    ℓ_i (x_j) = cases(1 & quad j = i, 0 & quad  j ≠ i)
  $
]
#remark[
  Lagrange polynomial is *free* to construct, but *prohibitively expensive* to evaluate at non-interpolation (i.e. between) points.
]

== Newton Basis (Divided Differences)

#theorem[
  To find $p(x) in Pn$ satisfying $p(x_i)=y_i$, we seek $p(x)$ in the form

  $
    p(x)=a_0+a_1 (x-x_0)+a_2 (x-x_0)(x-x_1) + ⋯ + a_n (x-x_0)⋯(x-x_(n-1))
  $

  Which is equivalent to forward solving

  $
    amat(1,0,⋯,⋯, ⋯,0,y_0; 1,x_1-x_0,0,⋯,⋯,0,y_1;1,x_2-x_0,(x_2-x_0)(x_2-x_1),0,⋯,0,y_2; ⋮, ⋮,⋮,⋮,⋱,⋮,⋮;1,x_n-x_0, ⋯,,,,y_n)
  $
]

=== Divided Differences

#definition(name: [(Divided difference)])[
  $
    y[x_i] &= y_i\
    y[x_(i+k), ⋯,x_i] &= (y[x_(i+k), ⋯, x_(i+1)]-y[x_(i+k-1), ⋯,x_i]) / (x_(i+k)-x_i)
  $
]
#example[
  $
    y[x_2,x_1,x_0] &= (y[x_2,x_1]-y[x_1,x_0]) / (x_2-x_0)\
    &= ((y_2-y_1) / (x_2-x_1)-(y_1-y_0) / (x_1-x_0)) / (x_2-x_0)\
  $
]
#theorem(name: [(Newton polynomial)])[
  Let

  $
    p(x)&=y[x_0]+(x-x_0) y[x_1,x_0] + ⋯+ (x-x_0) ⋯(x-x_(n-1)) y[x_n,⋯,x_0]\
    &= sum_(0≤ k≤ n) (product_(0≤ j≤ k)(x-x_j)) y[x_k, ⋯,x_0]
  $
  then $p(x) in Pn$ satisfying $p(x_i)=y_i$
]
#example[
  Find $p(x) in cal(P)_3$ such that

  #let p(x, y) = $(#text(blue,str(x)),#text(red,str(y)))$
  #let b = text.with(fill: blue)
  #let r = text.with(fill: red)
  #let g = text.with(fill: green)
  #let o = text.with(fill: orange)
  #let x = box.with(stroke: 1pt, inset: 4pt)

  $
    {#p(0,1),#p(1,3),#p(2,9),#p(3,25)} ⊆ p
  $
  #proof[
    Consider the *divided difference table*

    #table(
      align: center + horizon,
      columns: 5,
      $x$, $y[x_i]$, $y[x_(i+1),x_i]$, $y[x_(i+2),⋯,x_i]$, $y[x_(i+3),⋯,x_i]$,
      b($0$), x(r($1$), stroke: 1pt, inset: 4pt), [], [], [],
      [], [], $(#r[3]-#r[1])/(#b[1]-#b[0])=#x(g[2])$, [], [],
      b($1$), r($3$), [], $(#g[6]-#g[2])/(#b[2]-#b[0])=#x(o[2])$, [],
      [],
      [],
      $(#r[9]-#r[3])/(#b[2]-#b[1])=#g[6]$,
      [],
      $(#o[5]-#o[2])/(#b[3]-#b[0])=#x[1]$,

      b($2$), r($9$), [], $(#g[16]-#g[6]) / (#b[3]-#b[1])=#o[5]$, [],
      [], [], $(#r[25]-#r[9])/(#b[3]-#b[2])=#g[16]$, [], [],
      b($3$), r($25$), [], [], [],
    )
    Thus

    $
      p(x)=#r[1]+#g[2] x+#o[2] x(x-1)+1 x(x-1)(x-2)
    $
  ]
]

=== Osculatory Interpolation (with Derivative Data)

#lemma[
  $
    lim_(x_1 → x_0) y[x_1,x_0] ≝ lim_(x_1 → x_0) (y_1-y_0) / (x_1-x_0) = y'(x_0)
  $
  In general,

  $
    lim_(x_k→ x_0\ ⋮ \ x_1 → x_0) y[x_k, ⋯,x_0]= (y^((k))(x_0)) / (k!)
  $
]

#example[
  #let pp = $p''$
  Find $p in cal(P)_4$ such that
  $
    p(0)=0 quad p(1)&= 1 quad p(2)=6\
    p'(1) &= 1\
    pp(1) &= 2
  $
  #proof[
    Consider the divided difference table

    #table(
      columns: 6,
      $x_i$,
      $y[x_i]$,
      $y[x_(i+1), x_i]$,
      $y[x_(i+2), ⋯,x_i]$,
      $y[x_(i+3), ⋯,x_i]$,
      $y[x_(i+4), ⋯,x_i]$,

      $0$, text(red, $0$), [], [], [], [],
      [], [], text(red, $(1-0) / (1-0)=1$), [], [], [],
      $1$, $1$, [], text(red, $(1-1) / (1-0)=0$), [], [],
      $$, $$, $(y'(1)) / (1!)=1$, $$, text(red, $(1-0) / (1-0)=1$), $$,
      $1$, $1$, $$, $(y''(1)) / (2!)=1$, $$, text(red, $(3-1) / (2-0)=1$),
      $$, $$, $(y'(1)) / (1!)=1$, $$, $(4-1) / (2-1)=3$, $$,
      $1$, $1$, $$, $(5-1) / (2-1)=4$, $$, $$,
      $$, $$, $(6-1) / (2-1)=5$, $$, $$, $$,
      $2$, $6$, $$, $$, $$,
    )
    Thus,
    $
      p(x)=x+x(x-1)^2+x(x-1)^3
    $
  ]
]
== Error in Polynomial Interpolation

#definition[
  $
    E(x)=y(x)-p(x)
  $

]

#theorem[
  $
    E(x) = (y^((n+1))) / ((n+1)!)(η) product_(0≤ i≤ n) (x-x_i)
  $
  for some $η in "span"{x_0,⋯,x_n,x}=[min_{x_0,⋯,x_n,x},max_{x_0,⋯,x_n,x}]$
]

#example(name: [(Runge phenomenon)])[
  #image("./runge.png", width: 80%)
  Going to higher degree does not necessary improve accuracy
  - #text(red)[$f(x)=1"/"(1+25 x^2)$] is the underlying function
  - #text(blue,$p_5(x)$) is 5th order approximation (agrees with $f(x)$ at 6 points)
  - #text(green, $p_9(x)$) is 9th order approximation (agrees with $f(x)$ at 10 points)

Notice that $p_9$ is a worse approximation than $p_5$
- Reason, $E(x)$ blows up faster as derivate gets higher
]
