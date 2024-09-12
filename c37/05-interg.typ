#import "./preamble.typ": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
= Numerical Integration

== Quadrature
We wish to compute

$
I(f) ≝ ∫_a^b f(x) d x approx I(p)
$

#let re = text.with(fill: red)
#let bl = text.with(fill: blue)
#definition(name:[(Standard quadrature formula)])[
Given $re(A_i):RR->RR$ *weights* and $bl(x_i) in RR$ nodes, the *interpolation quadrature* for $f(x)$ is

$
Q(f) ≝ I(p)=sum_(i=0)^n re(A_i) f(bl(x_i))
$
]
#let sumin = $sum_(i=0)^n$
#let intab = $∫_a^b$
#example[
If we approximate $f(x)$ in _Lagrange form_, as

$
p(x)= sum_(i=0)^n f(x_i) ℓ_i (x)
$
Then the interpolation quadrature is

$
Q(f)&=I(p)= ∫_a^b sum_(i=0)^n f(x_i)ℓ_i (x) dx\
&= sumin (intab ℓ_i (x) dx) f(x_i)=sumin A_i f(x_i)
$
where

$
A_i (x)=intab ℓ_i (x) dx
$
]
#lemma[
$Q$ is a linear operator, i.e.

$
Q(α f+g) = α Q(f)+Q(g)
$
Thus if $Q(f)$ integrates $1,x,⋯,x^n$ exactly, then $Q$ integrates every $p(x) in Pn$ exactly.
]

#theorem(name:[(Existence of interpolating quadrature rules)])[
Given any distinct nodes ${x_0,⋯,x_n}$, there exists _unqiue_ weights $A_i$ such that the $Q(f)$ integrates $Pn$ exactly.
]
#proof[
We wish to find $A_i$ such that for each $k$,

$
Q(x^k) ≝  sumin A_i x_i^k = intab x^k dx=(b^(k+1)-a^(k+1))/(k+1)
$
which is equivalent to solving $V^T bold(A)=bold(b)$

$
amat(1,1,⋯,1,b-a;x_0,x_1,⋯,x_n,(b^2-a^2)"/"2;⋮,⋮,⋱,⋮,⋮;x_0^n,x_1^n,⋯,x_n^n,(b^(n+1)-a^(n+1))"/"(n+1))
$

where $V^T$ is transposed Vandermonde matrix (i.e. invertible), thus solution exists and is unique.
]

== Precision
#definition(name:[(Precision)])[
The *presion* of $Q$ is the largest $m in NN$ such that $Q$ integrates every $p(x) in cal(P)_m$ exactly.
]

#theorem[
The *midpoint rule* ($n=0$), defined as

$
I(f) approx M(f)=I(p_0) ≝ (re(b-a)) f (bl((a+b)/2))
$
has precision $m=1$.
]
#proof[
$
M(1) &= b-a=I(1)\
M(x) &= (b-a) (a+b)/2=(b^2-a^2)/2=I(x)\
M(x^2) &= (b-a) ((a+b)/2)^2 ≠ (b^3-a^3)/3=I(x^2)
$
#todo figure
]
#theorem[The *trapezoidal rule* $(n=1)$, defined as

$
I(f) approx T(f)=I(p_1) ≝ re((b-a)/2) [f(bl(a))+f(bl(b))]
$
has precision $m=1$
]
#todo figure

#theorem[
The *Simpson's rule* $(n=2)$, defined as

$
I(f) approx S(f) = I(p_2) ≝ re((b-a)/6)[f(bl(a))+re(4)f(bl((a+b)/2))+f(bl(b))]
$
]

== Error in Interpolating Quadrature

#definition[
THe *error* is

$
e_n ≝ I(f)-Q_n (f) = intab[f(x)-p_n (x)] dx\
= intab [(f^((n+1))(η))/((n+1)!) product_(i=0)^n (x-x_i)] dx
$
]
#theorem[
Let $f in C[a,b]$ and $Q_n (f)= sumin A_i^((n)) f(x_i^((n)))$, then $lim_(n→ ∞) Q_n (f)=I(f)$ if and only if

$
∃k ∀n  quad sumin abs(A_i^((n))) ≤ k
$
]

