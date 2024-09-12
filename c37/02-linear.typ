#import "./preamble.typ": *
#import "@preview/cetz:0.3.1"
= Linear System of Equations

#definition[$A$ is *orthorgonal* iff $A^T=A^(-1)$.]
#lemma[
  If $A=mat(a,b;c,d)$, then $A^(-1)=1/(det A) mat(d,-b;-c,a)$.
]

== Gaussian Elimination

#theorem(name: [(LU Factorisation)])[
  Let $A=(a_(i j)) in RR^(n × n)$, there exists _unit lower triangular_ $L$ and _upper triangular_ $U$ such that
  $
    A = L U.
  $

  Thus, $A x =b$ can be solved by
  + Solve $L d=b$ for $d$ (forward substitution).
  + Solve $U x=d$ for $x$ (backward substitution).
]
#proof[
  Define $L_1$ as

  $
    L_1 = mat(1,0,0;-a_(2 1)"/"a_(1 1),1,0;-a_(3 1)"/"a_(1 1),0,1)
  $

  Thus $L_1$ is the matrix that "eliminates" $a_(2 1)$ and $a_(3 1)$. That is, $L_1 A$ is in the form

  $
    L_1 A=mat(a_(1 1),a_(1 2),a_(1 3);0,tilde(a)_(2 2),tilde(a)_(2 3);0,tilde(a)_(3 2),tilde(a)_(3 3))
  $

  Next, let $L_2$ (which eliminates $ta_32)$ be

  $
    L_2=mat(1,0,0;0,1,0;0,-ta_32"/"ta_22,1)
  $
  We have that $U ≝ L_2 L_1 A$ is upper triangluar. Finally, let $L ≝ L_1^(-1) L_2^(-2)$, thus

  $
    A=L U
  $
]
#lemma[
  $L=L^(-1)_1+L_2^(-1)-I$
]
#lemma[
  If $A=L U$, then $det A=det L$.
]
#proof[ $det:RR^(n × n) -> RR$ is homomorphism. ]

#remark[$A = L U$ factorisation is unstable.]
#proof[ Let $ε=10^(-16)$ be a very small number, and assume

  $
    L_1 A= mat(1,2,1;0,ε,3;0,2,1)
  $
  Thus, $L_2$ would be

  $
    L_2=mat(1,0,0;0,1,0;0,text(#red,-2"/"ε),1)
  $

  which causes an overflow. Furthermore, the result upper triangular $U$ would also have overflow.

  $
    U ≝ L_2 L_1 A=mat(1,0,0;0,1,0;0,text(#red,-2"/"ε),1)mat(1,2,1;0,ε,3;0,2,1)=mat(1,2,1;0,ε,3;0,0,text(#red,1-6"/"ε))
  $
]

#example[
  $
    underbrace(mat(text(#blue,2),-1,1;2,2,2;-2,4,1),A) x= underbrace(vec(1,8,7),b)
  $
  _Solution._
  $
    "Let" L_1&=mat(1,0,0;-1,1,0;1,0,1) quad ==> quad L_1 A = mat(2,-1,1;0,text(#blue,3),1;0,3,2)\
    "Let" L_2 &= mat(1,0,0;0,1,0;0,-1,1) quad ==> quad L_2 L_1 A = mat(2,-1,1;0,3,1;0,0,1)=U\
    ∴ "Let" L &= L^(-1)_1L^(-2)_2= mat(1,0,0;1,1,0;-1,1,1)
  $

  Thus $A=L U$, so $L U x=b$. Now, consider $L d=b$

  $
    mat(1,0,0;1,1,0;-1,1,1) d &= vec(1,8,7)\
    d_1 &&&= 1\
    d_2 &= 8-d_1 &&=7\
    d_3 &= 7+d_1-d_2&&=1
  $
  Finally, consider $U x=b$

  $
    mat(2,-1,1;0,3,1;0,0,1) x &= vec(1,7,1)\
    x_3 &&&=1\
    x_2 &=(7-x_3)"/"3 &&= 2\
    x_1 &=(1+x_2-x_3)"/"2 &&=1
  $

  #let hec(..args) = $(#args.pos().intersperse(" ").sum())^T$

  Thus $x=hec(1,2,1)$. (Notice it's the same process with pivoting)
]

=== Row Pivoting

#definition[
  $P_(i j)$ is the permutation matrix such that $P_(i j)A$ swaps row $i$ and $j$ in $A$, and $A P_(i j)$ swaps column $i$ and $j$.
]
#example[
  $
    P_12=mat(0,1,0;1,0,0;0,0,1)
  $
]
#remark[$P_(i j)^2=I$]

#lemma[
  Let $P_2=P_23$, then

  $
    L_1=mat(1,0,0;a,1,0;b,0,1) quad ==> quad P_2 L_P_2= mat(1,0,0;b,1,0;a,0,1)
  $
]

A better factorsation technique involves swapping rows such that the pivot has the largest norm. This ensures that each entry of $L_k$ has norm bounded by $1$, thus no overflow occurs.

#theorem(name: [(LU Factorisation with Pivot)])[
  Let $A=(a_(i j)) in RR^(n × n)$, there exists a _permutation_ $P$, an _unit lower triangular_ $L$, and an _upper triangular_ $U$ such that
  $
    P A = L U.
  $
  Thus, $A x =b$ can be solved by $L d=L U x=P A x= P b$.
]

#proof[
  Assume, with pivot, we get
  $
    L_2 P_2 L_1 P_1 A =U
  $
  Thus let $tilde(L)_1=P_2 L_1 P_2$, i.e. $L_1$ with $a_21$ and $a_31$ swapped, it follows that
  $
    U=L_2 (P_2 L_1 P_2)P_2 P_1 A=L_2 tilde(L_1) P_2 P_1 A.
  $
  Thus, let $L=tilde(L_1)^(-1)L_2^(-1)$ and $P=P_2 P_1$, we have
  $
    P A=L U.
  $
]
#lemma[If $P A=L U$, then $det A=det L"/" det P$ where $det P=±1$ (i.e. the parity).]

#example[
  $
    underbrace(mat(2,6,6;3,5,12;6,6,12),A) x &= underbrace(vec(20,25,30),b) \
  $
  _Solution._
  $
    "Let" P_1 &= P_13 && ∴ P_1 A=mat(text(#blue,6),6,12;3,5,12;2,6,6)\
    "Let" L_1 &= mat(1,0,0;-1"/"2,1,0;-1"/"3,0,1) quad && ∴ L_1 P_1 A= mat(6,6,12;0,2,6;0,4,2)\
    "Let" P_2 &= P_(2 3) && ∴ P_2 L_1 P_1 A = mat(6,6,12;0,text(#blue,4,),2;0,2,6)\
    "Let" L_2 &= mat(1,0,0;0,1,0;0,-1"/"2,1) && ∴ L_2 P_2 L_1 P_1 A = mat(6,6,12;0,4,2;0,0,5)=U\
    "Let" tilde(L_1) &= P_2 L_1 P_2 = mat(1,0,0;-1"/"3,1,0;-1"/"2,0,1) && ∴ L=tilde(L_1)^(-1) L_2^(-1)=mat(1,0,0;1"/"3,1,0;1"/"2,1"/"2,0)
  $
  Thus, for $P=P_2 P_1=P_23 P_13$, it follows that $P A= L U$.

  - Solve for $d$ in $L d= P b$:

    $
      mat(1,0,0;1"/"3,1,0;1"/"2,1"/"2,1)d &= vec(30,20,25)\
      d_1 &&&=30\
      d_2 &= 20-d_1"/"3 &&= 10\
      d_3 &= 25-d_2"/"2-d_1"/"2 &&= 5
    $
  - Solve for $x$ in $U x=d$
    $
      mat(6,6,12;0,4,2;0,0,5) x &= vec(30,10,5)\
      x_3 &= 5"/"5 &&= 1\
      x_2 &= (10-2 x_3)"/"4 &&= 2\
      x_1 &= (30-6x_2-12x_3)"/"6 &&= 1
    $
]
=== Numerical Singularity
#remark[If at some stage $k$, the partial upper trigular matrix is $0$ for $hat(a)_(k k),hat(a)_(k+1,k),⋯$ (i.e. zero at $k$th column, below/include $k$th row), then the matrix $U$ and $A$ are *singular* (i.e. noninvertable). So we get zero or infinitely many solutions.
]

#definition[A matrix is *near singular* iff at some stage $k$, all the elements include/below $hat(a)_(k k)$ have magnitude bounded by

  $
    eps max_(1 ⩽ j ⩽ k)|u_(j j)|.
  $
  In that case, the matrix is said to have *numerical singularity*.
]

=== Complexity of Gaussian Elimination

We count the mult/add pairs (i.e. $m x +b$) as _flops_ (floating point operation). Since the flop is the most expensive step (than comparasion), we are only counting flops.

#theorem(name: [(Complexity of Factorisation)])[
  In general, stage $k$ takes $(n-k)^2$ operations, thus the complexity of $A=L U$ is

  $
    sum_(k=1)^(n-1) (n-k)^2=sum_(k=1)^(n-1) k^2=(n(n-2)(
      2n-1
    )) / 6=n^3 / 3+cal(O)(n^2)
  $
]
#remark[
  At stage $1$, we compute the matrix in the form

  $
    mat(
    a_11,a_12,dots,a_(1 n);
    0, ha_23,⋯,ha_(2n);
    dots.v,dots.v,,dots.v;
    0,ha_(n 2),dots,ha_(n n)
   )
  $
  which is $(n-1)^2$ operations.

]

#theorem(name: [(Complexity of Forward/Backward Substituion)])[
  Since $d_k$ takes $k-1$ operations to solve, the complexity of $L d=b$ is

  $
    sum_(k=1)^n k-1=n^2 / 2+cal(O)(n)
  $
  Similarly, complexity of $U x=d$ is $n^2"/"2+cal(O)(n)$ as well.
]
#remark[
  If $L d=b$ where $L=(l_(i j))$ is unitary lower triangluar, then

  $
    d_1 &= b_1 &"(0 operation)"\
    d_2 &= underline(b_2-l_21 d_1)&"(1 operation)"\
    d_3 &= underline(underline(b_3-l_32 d_2)-l_31 d_1)& quad "(2 operations)"\
    dots.v
  $
]
#remark[Thus we only factorise $A$ once, and solve different systems for different $b$.]

=== Round Off Error

#definition[
  Ideally, we want to solve $A x=b$, but in reality, we get

  $
    (A+E) hx=b.
  $
  Let $r ≝ E hx$ be the *residual*, then
  $
    (A+E)hx=b <==> r=b-A hx
  $
]
#theorem[In partial pivoting, for some not too large $k$ that grows with $n$, we have that
  - $||E|| lt.approx k eps ||A||$
  - $||r|| lt.approx k eps ||b||$
  Thus, the *relative residual* is bounded by

  $
    (||r||) / (||b||) lt.approx k eps
  $
]
#definition[
  The *condition* of matrix $A$ is
  $
    cond_p A ≝ ||A||_p ||A^(-1)||_p.
  $
  Notice $cond A ≥ 1$, and
  $
    underbracket((||x-hx||)/(||x||),"relative\nerror") ≤ cond A · underbracket((||r||)/(||b||),"relative\nresidual")
  $
]
#definition[
  + If $cond A gt.double 1$, then the problem is *poorly* conditioned, meaning small relative residual does not imply small RRO.
  + If $cond A approx 1$, then the problem is *well* conditioned, meaning small relative residual is a good indicator of small RRO.
  + If $cond A=1$ (e.g. orthorgonal matrices), then the problem is *perfectly* conditioned.
]
The geometric interpretation of poorly conditioned is as follows:

#cetz.canvas({
  import cetz.draw: *
  let d = .14
  let y1=.5
  intersections(
    "i",
    {
      line((0, 0), (15, y1))
      line((0, .2), (15, 0))
      line((0, 0 - d), (15, y1 - d), stroke: (dash: "dotted"))
      line((0,.2+d),(15,d),stroke:(dash:"dotted"))
    },
  )
  circle("i.0", radius: .05, fill: black)
  content("i.0", $x$,anchor:"north",padding:.2)
  content("i.3", $hx$,anchor:"north",padding:.2)
  circle("i.3", radius: .05, fill: black)
})

== Iterative Refinement

#algorithm[
+ Compute $hx^((1))$ by solving $A x=b$.
+ For each $i=0,1,⋯$ until _converges_ or _diverges_
  + Compute $r^((i))=b-A hx^((i))$
  + Solve $A hz^((i))=r^((i))$
  + Let $hx^((i+1))=hx^((i))+hz^((i))$
]
#proof[
Since we want to compute $x$ such that $A x= b$, but got $hx$ where $A hx = b-r$ where $r$ is the residual, we now have 
$ A underbrace((x-hx), z)=r $
Therefore, we wish to solve the _residual system_, $A z=r$ and obtain $x=hx+z$, where $z$ is the _correction_.

In reality, we get a computed $hz$, but $hx+hz$ is more precise than $hx$, thus we can continue the refinement.
]
