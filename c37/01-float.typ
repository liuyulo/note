#import "preamble.typ": *

= Floating Point Arithmetic

== Real Number Representation

#definition[For *base* $b in ZZ^+$, a natural $x in NN$ is represented as

  $
    x=(d_n d_(n-1) ⋯ d_2 d_1 d_0)_b=d_n · b^n + ⋯+ d_0 · b^0
  $
  where $d_k in ZZ_b$ are *digits*.
]

#algorithm[Convert $N in NN$ to binary.
  + Construct _numerators_ $n_k$ and _remainders_ $r_k$ by
    + Start with $n_1=N$.
    + Let $r_k$ be remainder of $n_k"/"2$.
    + Let $n_(k+1)$ be quotient (floor) of $n_k"/"2$.
  + Then
    $
      N = (⋯ r_3r_2 r_1)_2
    $
]

#example[#figure(
    align(
      horizon,
      stack(
        dir: ltr,
        spacing: 1em,
        table(columns: 3,
          "iteration",$n$,$r$,
          table.hline(),table.vline(x: 1),
          $1$,$43$, $1$,
          $2$,$21$, $1$,
          $3$,$10$, $0$,
          $4$,$5$, $1$,
          $5$,$2$, $0$,
          $6$,$1$, $1$
        ),
        $(43)_10 |-> (101011)_2$,
      ),
    ),
  )
]

#definition[For base $b in ZZ^+$, a real $x in RR$ is represeted as
  $
    x&=±(x_I . x_F)_b\
    &=±(d_n ⋯ d_1 d_0 . d_(-1) d_(-2) ⋯)\
    &= ±(sum_(k=0)^n d_k · b^k + sum_(k=1)^∞ d_(-k) · b^(-k))
  $
  where $x_I$ is the *integral* part, and $x_F$ is the *fractional* part.
]
#remark[A finite decimal number has finite binary representation. Converse is false, e.g. $(.1)_10="(".0 overline(0011)")"_2$.]

#algorithm[Convert fractional $x in (0,1)$ to binary.
  + Construct _multipliers_ $m_k$ and _integrals_ $i_k$ by
    + Start with $m_1=x$.
    + Let $i_k$ be integral part of $2m_k$.
    + Let $m_(k+1)$ be fractional part of $2m_k$.
  + Then
    $
      x = (.i_1 i_2 ⋯)_2
    $
]

#example[#figure(
    align(
      horizon,
      stack(
        dir: ltr,
        spacing: 1em,
        table(columns: 3,
          "iteration",$m$,$i$,
          table.hline(),table.vline(x: 1),
          $1$,$.625$, $1$,
          $2$,$.25$, $0$,
          $3$,$.5$, $1$,
        ),
        $(.625)_10 |-> (.101)_2$,
      ),
    ),
  )
]

== Mantissa and Exponent

#definition[Given base $b$ and $t,s in ZZ^+$, the set of *floating point number* (FPN) in base $b$ with *mantissa* $t$ and exponent $s$ is

$
RR_b (t,s) &= {±F × b^e:F in [0,1), e in NN}\
&={±(. d_1 d_2⋯d_t)_b × b^((c_1 c_2 ⋯ c_s)_b): d_k,c_k in ZZ_b}
$
where $(d_1 d_2 ⋯d_t)_b$ is the *mantissa*, and $(c_1 c_2 ⋯c_s)_b$ is the *exponent*.
]
#definition[
An nonzero FPN $hx=(d_1,⋯,d_t,c_1,⋯,c_s)$ is *normalised* iff $d_1  ≠ 0$.
]
#definition[
The *significant* digits of an FPN $hx$ are the digits following and including the first nonzero digit (in the mantissa).
]
#remark[An FPN is normalised iff all digits are significant.]

#theorem[
The largest (by absolute value) number in $RR_b (t,s)$ is

$
(.a ⋯ a)_b × b^((a ⋯ a)_b)=(.a ⋯ a)_b × b^M
$
where $a=b-1$ and $M=b^s - 1$.

The smallest (i.e. closest to zero) number in $RR_b (t,s)$ is

- normalised $(.10 ⋯ 0)_b × b ^(-M)$
- unormalised $(.0 ⋯ 01)_b × b^(-M)$
]
#definition[
*Overflow/underflow* occurs when the absolute value is too big/small.
]

#remark[$RR_b (t,s)$ is finite whereas $RR$ is infinitely dense.]

#definition[
Given $x in RR$, the *representation* of $x$ in $Rbst$ is $fl(x)=hx$ defined as

+ Normalise the mantissa:
  $
  x &= ± (d_k d_(k-1) ⋯ d_0.d_(-1) d_(-2) ⋯)_b\
  &= ±(.D_1 D_2 ⋯)_b ×  b^(k+1)
  $
+ _Chop/Round_ the mantissa
  - _Chopping:_ chop until (including) $D_t$.
  - _Rounding:_ chop until $D_t$, roundup if $D_(t+1) ⩾ b"/"2$.\
    Alternatively, add $b"/"2$ to $D_{t+1}$, then chop (cheaper)
]

== Rounding Error & Error Propagation

#definition[
The (relative) *roundoff error* (RRO) between $x in RR$ and its representation $hat(x) in RR_b(t,s)$ is

$
δ_x=(hat(x)-x)/x.
$
In other words, $hx=x(1-δ_x)$.
]
#theorem[
Given $Rbst$, the relative roundoff error (RRO) $δ$ is bounded by

- $0 ⩽ δ < b^(1-t)$ for chopping (normalised)
- $|δ| ⩽ ½ b^(1-t)$ for rounding (normalised)
]

#theorem[
Let $eps in Rbst$ be the smallest nonnormalised float such that $1+eps > 1$, then
- $eps = b^(1-t)$ for chopping
- $eps=½ b^(1-t)$ for rounding
]

#theorem[The error propagation of multiplication is
$
fl(hx dot hy)approx(x dot y)(1-δ) "where" |δ| ⩽ 3 eps
$
Thus multiplication is _safe._
]
#proof[
$
fl(hx dot hy) &= fl(x(1-δ_1) dot y(1-δ_2))\
&= x(1-δ_1) dot y(1-δ_2) dot (1-δ_3)\
&= (x dot y)(1-δ_1)(1-δ_2)(1-δ_3)\
&= (x dot y)(1-δ_1-δ_2-δ_3+δ_1 δ_2+δ_1 δ_3+δ_2 δ_3-δ_1 δ_2 δ_3)\
&approx (x dot y)(1-δ_1-δ_2-δ_3)=(x dot y)(1-δ)
$
where $δ=δ_1+δ_2+δ_3$, thus $|δ| ⩽ 3 eps$. Note that the approximation is very good because 
$
|δ| < eps ==> δ^2 lt.double eps "and" |δ^3| lt.triple eps.
$
]

#theorem[
The error propagation of addition is

$
fl(hx+hy) approx (x+y)(1-δ) "where" |δ| ⩽ cases(
2 eps & "if" sgn x=sgn y,
2 eps (|x-y|)/(|x+y|) & "if" sgn x ≠ sgn y
)
$
Thus addition is safe, but substraction is not safe and can causes _substractive cancellation._
]

#proof[

$
fl(hx+hy)&=(x(1-δ_1)+y(1-δ_2))(1-δ_3) & \
&= x(1-δ_1)(1-δ_3)+y(1-δ_2)(1-δ_3) & \
&approx x(1-δ_1-δ_3)+y(1-δ_2-δ_3) & (δ^2 lt.double |δ| < eps)\
&= (x+y)(1-x/(x+y)(δ_1+δ_3)-y/(x+y)(δ_2+δ_3))\
&= (x+y)(1-δ)
$
where

$
|δ| ⩽ abs(x/(x+y)) 2 eps+abs(y/(x+y)) 2 eps=2(|x|+|y|)/(|x+y|) eps
$

]

== Condition & Norm

#definition[
The *relative residual* of continuous $f:RR->RR$ on $x in RR$ is

$
(|f(x)-f(hx)|)/(|f(x)|)=(|x-hx|)/(|x|) cond f
$
where $cond f$ is the *condition* of $f$, defined as
$
cond f ≝ (|x f'(x)|)/(|f(x)|)
$
]
#proof[
Taylor expansion at $hx$:
$
f(x) approx f(hx)+(x-hx) f'(hx)
$
]

#example[
- $cond sqrt(x)=1"/"2$ is bounded, so $sqrt(x)$ is *well-conditioned*.
- $cond c/(1-x^2)=abs((2x^2)/(1-x^2))$ is unbounded at $x=±1$, so it's *ill-conditioned*.
]

#definition[
$|| - ||:V->RR$ is a *norm* for vectorspace $V$ iff

- $||x|| ⩾ 0$ for any $x in V$, and $||x||=0 <==> x=0$
- $||λ x|| = |λ| ||x||$
- $||x+y|| ⩽ ||x||+||y||$
]
#definition[
The vector *p-norm* of $RR^n$ is $||-||_p:RR^n -> RR$ defined as

$
||xx||_p ≝  (sum_(i=1)^n |x_i|^p)^(1"/"p)
$
]
#theorem[
$
||x||_∞ ≝ lim_(p-> ∞) ||x||_p = max_i |x_i|
$
]
#definition[
The matrix *p-norm* of $RR^(n × n)$ is $||-||_p ::RR^(n × n)->RR$ defined as

$
||A||_p ≝ max_(x in RR^n) (||A x||_p)/(||x||_p)=max_(||x||_p=1)||A x||_p
$
]
#theorem[
- $||A||_1$ is max sum of norm of col vectors
  $
  ||A_1|| = max_j sum_i |a_(i j)|
  $
- $||A||_∞$ is max sum of row vectors
  $
  ||A||_∞ = max_i sum_j |a_(i j)|=||A^T||_1
  $
// - $||A||_F = sqrt(sum_(i,j) |A_(i j)|^2)$
]

== Substraction Cancellation

#example(name:[(CSCC37 2023 Midterm)])[
Write an algorithm that takes input $n in NN$ and computes $sum_(k=1)^n 1"/"k$. Your algorithm must be protected against performing unnecessary floating point operations in any floating point number system in which it is implemented.

_Solution._ Just compute until is less than machine epsilon.
```
sum = 0
for i in 1..n 
  computer r as 1/k
  if sum + r is not greater than sum
    return sum
  sum = sum + r
return sum
```
]

When an expression $f(x)$ is evaluated using FP arithmetic, the _substraction cancellation_ can cause poor results to be obtained for certain range of $x$. However, sometime an _alternate expression_ can be used for such values of $x$. Note that if we are not given a specific FP system $Rbst$, one can only determine an _approximate_ range where the poor results are obtained.

#example(name:[(CSCC37 2023 Midterm)])[
- $(2-(2-x))$\
  When $x approx 0$, we have that $2-x approx 2$, so substractive cancellation can occur at $x approx 0$, leading to poor results. An alternative expression is $x$, which has no subtraction, thus no subtractive cancellation at $x approx 0$.

  Note that when $x approx 2$, the expression $2-x$ has subtractive cancellation, but $(2-(2-x))$ evaluates to approximately $2$, so subtraction cancellation cannot happen for the original expresion.
- $1-sin x$\
  Subtractive cancellation occurs at $x approx 2 k π+π"/"2$ because $sin x$ evaluates to approximately $1$. An alternative expression is

  $
  1-sin x=(1-sin^2 x)/(1+sin x)=(cos^2 x)/(1+sin x).
  $
  When $x approx 2 k π + π"/"2$, we have that $sin x approx 1$, so no subtractive cancellation for the alternative expression.
- $ sqrt(1+x)-sqrt(1-x)$\
  Note that when $x approx 1$, subtractive cancellation can happen on $1-x$, but not in the original expression because it approximates to $sqrt(2)$.

  When $x approx 0$, both $sqrt(1+x)$ and $sqrt(1-x)$ approximates to $1$, so subtractive cancellation occurs. An alternative expression is

  $
  sqrt(1+x)-sqrt(1-x)=(1+x-(1-x))/(sqrt(1+x)+sqrt(1-x))=(2x)/(sqrt(1+x)+sqrt(1-x))
  $
  which is fine for $x approx 0$ as the denominator evaluates to approximately $1+1$ (addition on the same sign is safe).
- $ e^x-1$\
  Subtractive cancellation occurs on $x approx 0$ (causes addtion between different sign, similar magnitude). An alternative expression is (Tayler expansion)
  $
  e^x-1=sum_(1 ⩽ k < N) x^k/(k!)
  $
  #todo for some large $N in ZZ^+$ (which?). (why no subtractive cancellation?)
]
