#import "preamble.typ": *

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
#figure(
  cetz.canvas(
    length: 17pt,
    {
      import cetz.draw: *
      let arr = (..range(n), n, ..range(n).rev())
      let arr = arr.map(n => n + 2)
      for (x, n) in arr.enumerate() {
        let ss = range(n - 2).map(_ => none)
        let ss = if x < n { (blue, ..ss, yellow) } else { (yellow, ..ss, blue) }
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }

      translate(x: 16)
      let (rng, ss) = (suiji.gen-rng-f(42), ())
      for (x, n) in arr.enumerate() {
        (rng, ss) = suiji.choice-f(rng, (blue, yellow), size: n - 2)
        let ss = if x < n { (blue, ..ss, yellow) } else { (yellow, ..ss, blue) }
        hexagons(x, n / 2, ss.map(f => (fill: f)))
      }
    },
  ),
  caption:[An empty #Hex board (left) and a filled #Hex board (right)]
)<hex>

Notably, the players do not have to alternate between turns, and do not need to terminate the game once the opposite sides have a connecting path. The following theorem encapsulates this generalisation, and implies that #Hex has no ties.

#theorem[
  Every filled #Hex board has exactly one connecting path from opposite sides.
]

#cetz.canvas(
  length: 15pt,
  {
    import cetz.draw: *
    let arr = range(n * 2).rev()
    for (x, n) in arr.enumerate() {
      hexagons(x, n / 2, range(n).map(_ => ()))
    }
  },
)
