#import "./preamble.typ": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
= Nonlinear Equation

== Fixed Point Method

#definition[
  To solve for nonlinear $F(x)=0$, we consider a function $g$ such that

  $
  F(x)=0 <==> x=g(x)
  $
]
#theorem(name: [(First-form)])[
  For any nonlinear $F$, let $ g(x)=x-F(x) $ be the *first form* fixpoint problem.

  - $x$ is root of $F$ _iff_ $x$ is fixpoint of $g$.
]
#theorem(name: [(Second-form)])[
  Let arbitrary auxiliary function $h$, the *second form* fixpoint problem of $F$ is

  $
  g(x)=x-h(x) F(x)
  $

  - $x$ is root of $F$ _only if_ $x$ is fixpoint of $g$.
]

#remark[
  Second form gives more flexibility, and can make convergence faster.
]

=== Fixed Point Iteration

#algorithm(name: [(Fixed point iteration, FPI)])[
  + Define $hx_0$
  + Let $hx_(k+1)=g(hx_k)$ until _convergence_

  - _X-test_: $|hx_(k+1)-x_k| < ε$
  - _F-test_: $|f(hx_k)| < ε$
]

#let size = (n => (n, n))(7)

#stack(
  dir: ltr,
  figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      plot.plot(
        size: size,
        x-grid: true,
        y-grid: true,
        {
          plot.add(domain: (-1, 1), x => calc.root(x, 3))
          plot.add-hline(0)
        },
      )
    }),
    caption: [F-test fails, but X-test works],
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      plot.plot(
        size: size,
        x-grid: true,
        y-grid: true,
        {
          plot.add(domain: (-1, 1), x => calc.pow(x, 3))
          plot.add-hline(0)
        },
      )
    }),
    caption: [X-test fails, but F-test works],
  ),
)

#theorem(name: [(Fixed point theorem, FPT)])[
  If there is interval $[a,b]$ satisfying $∃L ∀x in [a,b]$
  + (sink) $g(x) in [a,b]$,
  + $|g'(x)| ≤ L < 1$,

  Then $g$ has an unique fixed point in $[a,b]$.
]

=== Rate Of Convergence

Let $tx$ be the fixpoint of $g$.

#definition[
  FPI $x_(k+1)=g(x_k)$ has *$bold(p)$th order of convergence* iff

  $
  lim_(x_k → tx) (|tx-x_(k+1)|) / (|tx-x_k|^p)=c ≠ 0
  $
]

#theorem(name: [(Rate of convergence theorem, RCT)])[

  If

  $
  g'(tx)=0 "and" ⋯ "and" g^((p-1))(tx)=0 "and" g^((p))(tx) ≠ 0
  $

  Then the FPI $x_(k+1)=g(x_k)$ has exactly $p$th order of convergence.

  - If $g^((p))(tx)=0$, then the FPT has _at least_ $p$th order of convergence
]

== Newton's Method

#algorithm(name: [(Newton's Method, NM)])[

  $
  x_(k+1)=x_k - (F(x_k)) / (F'(x_k))
  $

  Notice this is FPI second form, with $h(x)=1"/"F'(x_k)$
  - It has at least second order of convergence, since $g''(tx)=0$
]

#figure(
  cetz.canvas({
    let f(x) = x * x - 1
    let p(x) = (x, f(x))
    let fp(x0) = x => (2 * x0) * (x - x0) + f(x0)
    let z(x0) = (x0 * x0 + 1) / (2 * x0)
    import cetz.draw: *
    import cetz-plot: *
    plot.plot(
      axis-style: "school-book",
      size: (15, 10),
      name: "plot",
      x-tick-step: none,
      y-tick-step: none,
      {

        plot.add(domain: (-1, 4.5), f)
        let x = 4
        for i in range(1, 4) {
          plot.add(domain: (z(x), 4.5), fp(x), style: (stroke: gray))
          if i > 1 {
            x = z(x)
          }
          plot.add(((x, 0), p(x)), style: (stroke: (dash: "dashed")))
          plot.add-anchor(str(i), p(x))
          plot.add-anchor("z" + str(i), (x, 0))
        }
        plot.add-anchor("r", (1, 0))
      },
    )
    set-style(circle: (fill: black, radius: .15em), content: (padding: .2))
    for i in range(1, 4) {
      circle("plot." + str(i))
      circle("plot.z" + str(i))
      content("plot.z" + str(i), $x_#i$, anchor: "north")
    }
    circle("plot.r")
    content("plot.r", $tx$, anchor: "north")
  }),
  caption: [Geometric interpretation of NM],
)

  #figure(
    cetz.canvas({
      let k = .05
      let f(x) = x * calc.exp(-x) + k
      let p(x) = (x, f(x))
      // f'(x₀)(x - x₀) + f(x₀)
      let fp(x0) = x => (1 - x0) * calc.exp(-x0) * (x - x0) + f(x0)
      // z(x₀) is root of fp
      let z(x0) = (x0 * x0 + k * calc.exp(x0)) / (x0 - 1)
      let b = 10
      import cetz.draw: *
      import cetz-plot: *
      plot.plot(
        axis-style: "school-book",
        size: (15, 10),
        name: "plot",
        x-tick-step: none,
        y-tick-step: none,
        {

          plot.add(domain: (-0.1, b), f)
          let x = 2
          for i in range(1, 4) {
            plot.add(domain: (x - 1,z(x)), fp(x), style: (stroke: gray))
            if i > 1 {
              x = z(x)
            }
            plot.add(((x, 0), p(x)), style: (stroke: (dash: "dashed")))
            plot.add-anchor(str(i), p(x))
            plot.add-anchor("z" + str(i), (x, 0))
          }
          plot.add-anchor("r", (0, 0))
        },
      )
      set-style(circle: (fill: black, radius: .15em), content: (padding: .2))
      for i in range(1, 4) {
        circle("plot." + str(i))
        circle("plot.z" + str(i))
        content("plot.z" + str(i), $x_#i$, anchor: "north")
      }
      circle("plot.r")
      content("plot.r", $tx$, anchor: "north-west")
    }),
    caption: [NM does not always converges.]
  )

== Secant Method

NM but we approximate $f'(x)$ as 

$
f'(x) approx (f(x_k)-f(x_(k-1)))/(x_k-x_(k-1))
$

#definition(name:"(Secant Method, SM)")[
$
x_(k+1)=x_k-f(x_k)(x_k-x_(k-1))/(f(x_k)-f(x_(k-1)))
$
*Remark.* SM is not directly FPI, so FPT/RCT cannot be applied. However, it has rate of convergence $p=(1+sqrt(5))/2 approx 1.62$
]
#theorem[
SM has lower rate of convergence as NM, but NM requires two function evaluation on each iteration ($f$ and $f'$) whereas SM requires only one (i.e. $f$). Therefore, SM is *effectively faster* than NM.
]

== Bisection Method

Binary search.

#definition[
+ Choose interval $[a_0,b_0]$ such that $f(a_0) ≤ 0 ≤ f(b_0)$
+ Loop until $b_k-a_k ≤ ε$
  + Let $m=(a_k+b_k)"/"2$
  + If $f(m) ≤ 0$ then
    + $(a_(k+1),b_(k+1))=(m,b_k)$
  + else
    + $(a_(k+1),b_(k+1))=(a_k,m)$
]
#theorem[
BM
- will always converge (without FPT)
- has rate of convergence $p=1$ (with $c=1"/"2$)
]

== Hybrid

combine NM and BM


