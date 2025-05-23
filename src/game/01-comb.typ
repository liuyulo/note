#import "preamble.typ": *
#import "../array.typ"

#import "@preview/suiji:0.3.0"
#let Hex = smallcaps[Hex]
#let Y = smallcaps[Y]

= Combinatorial Games

#definition[A *combinatorial game* is a structure $G=⟨X,R_1,R_2⟩$ where

  - $X$ is the set of *positions*,
  - $R_i ⊆ X × X$ is the set of *moves* for player $i$.
]

We say that $x in X$ is a *terminal* position for player $i$ if there exists no $y$ such that $x R_i y$. A game is *impartial* if the players have the same move (i.e. $R_1=R_2$), otherwise it is *partisan*.


#definition[
  A game is *determined* if some player has a winning strategy.
]

#lemma[
  In a game with finitely many positions and no ties, if the players cannot repeat the game state, then the game is determined.
]

== Hex

We introduce the game of #Hex and show its determinacy. In particular, we show that #Hex has no ties through a reduction to another game #Y. We conclude the section with a proof of Brower Fixed Point Theorem using #Hex.

#let hexagons(x, y, styles) = {
  // draw n adjacent hexagons vertically
  import cetz.draw: *
  set-style(polygon: (stroke: 2pt))
  for (i, style) in styles.enumerate() {
    polygon((x * 1.5, (y - i) * calc.sqrt(3)), 6, ..style)
  }
}

#definition(name: Hex)[
  The game of #Hex is played on a rhombus-shaped board tiled with hexagons (see @hex). Two players are assigned different colors and opposite sides of the board. They take turns to color all the empty hexagons, and the player who connects the two sides wins.
]

#let n = 4
#let rng = suiji.gen-rng-f(42)
#figure(
  cetz.canvas(
    length: 17pt,
    {
      import cetz.draw: *
      let arr = (..range(n), n, ..range(n).rev())
      let arr = arr.map(n => n + 2)
      let ss = ()
      for (x, n) in arr.enumerate() {
        let ss = array.replicate(n - 2, none)
        let ss = if x < n { (blue, ..ss, yellow) } else { (yellow, ..ss, blue) }
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }

      translate(x: 16)
      for (x, n) in arr.enumerate() {
        (rng, ss) = suiji.choice-f(rng, (blue, yellow), size: n - 2)
        let ss = if x < n { (blue, ..ss, yellow) } else { (yellow, ..ss, blue) }
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }
    },
  ),
  caption: [An empty #Hex board (left) and a filled #Hex board (right)],
)<hex>

Notably, the players do not have to alternate between turns, and do not need to terminate the game once the opposite sides have a connecting path. This generalisation is alluded by the theorem that every filled #Hex board has one and only one connecting path from opposite sides. It then follows that #Hex has no ties.

To prove this theorem, we reduce a game of #Hex to a game of #Y.

=== Reduction to Y

#definition(
  name: Y,
)[The game of #Y is played on a triangular board tiled with hexagons. Similar to #Hex, the players are assigned two colors, and they take turns coloring each hexagon. The winner is the player who establishes a monochrmatic connected region (a "Y") that meets all three sides of the triangle.]

#figure(
  cetz.canvas(
    length: 17pt,
    {
      import cetz.draw: *
      let arr = range(n * 2).rev()
      for (x, n) in arr.enumerate() {
        hexagons(x, n / 2, array.replicate(n, ()))
      }
      translate(x: 16)
      let ss = ()
      for (x, n) in arr.enumerate() {
        (rng, ss) = suiji.choice-f(rng, (blue, yellow), size: n)
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }
    },
  ),
  caption: [An empty #Y board (left) and a filled #Y board (right)],
)

Playing #Hex is equivalent to playing #Y with some hexagons precolored, as show in @reduce.

#figure(
  cetz.canvas(
    length: 17pt,
    {
      import cetz.draw: *
      let arr = (..range(n), n, ..range(n).rev())
      let arr = arr.map(n => n + 2)
      let ss = ()
      for (x, n) in arr.enumerate() {
        let ss = array.replicate(n - 2, none)
        let ss = if x < n { (blue, ..ss, yellow) } else { (yellow, ..ss, blue) }
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }
      translate(x: 16)
      let arr = range(n * 2).rev()
      for (x, i) in arr.enumerate() {
        let ss = (
          ..array.replicate(i - 4, blue),
          ..array.replicate(calc.min(i, n * 2 - i), none),
          ..array.replicate(i - 4, yellow),
        ).map(c => (fill: c))
        hexagons(x, i / 2, ss)
      }
    },
  ),
  caption: [Reduction from #Hex to #Y],
)<reduce>


We prove that every filled #Y board contains exactly one Y. This is done via reduction to smaller boards.
#theorem[
  Every filled #Y board of side length $n$ contains exactly one Y.
]
#proof[
  We reduce a filled #Y board of length $n$ to a board of $n-1$. It then it follows from induction that every filled board has exactly one Y, because a board of length $1$ has exactly one.

  Intuitively, given a filled $n$ board, we construct a $n-1$ board by disregarding the left-most column.
  #let arrs = ()
  #arrs.push((
    (yellow, yellow, blue, yellow, blue),
    (blue, blue, yellow, yellow),
    (yellow, yellow, blue),
    (blue, yellow),
    (yellow,),
  ))
  #arrs.push((
    (yellow, blue, yellow, yellow),
    (blue, yellow, yellow),
    (yellow, yellow),
    (yellow,),
  ))
  #arrs.push((
    (blue, yellow, yellow),
    (yellow, yellow),
    (yellow,),
  ))
  #arrs.push((
    (yellow, yellow),
    (yellow,),
  ))
  #arrs.push(((yellow,),))
  #figure(
    cetz.canvas(
      length: 14pt,
      {
        import cetz.draw: *
        let s = calc.sqrt(3)
        group({
          for (i, arrs) in arrs.enumerate() {
            let arr = range(arrs.len() + 1).rev()
            for (x, arr) in arrs.enumerate() {
              hexagons(x, arr.len() / 2, arr.map(f => (fill: f)))
            }
            translate(x: 10 - i)
          }
        })

        let arr = (
          (1, s * 1.5),
          (.5, s * 2),
          (1, s * 2.5),
          (2, s * 2.5),
          (2.5, s * 2),
          (3.5, s * 2),
          (4, s * 1.5),
        )
        let arr = (..arr, ..arr.map(((x, y)) => (x, -y + s * 3)).rev())

        line(..arr, stroke: red + 3pt)
        polygon((11.5, s * 1.5), 6, stroke: red + 3pt)
        translate(x: -1.5, y: s * -2.5)
        line(..arr, stroke: green + 3pt)
        polygon((11.5, s * 1.5), 6, stroke: green + 3pt)
      },
    ),
    caption: [Reduction from a filled $5$ board to smaller boards],
  )
]
