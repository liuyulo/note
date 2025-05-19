#import "preamble.typ": *

= Cofinality

#definition[
  A subset $A$ of an ordinal $α$ is a *cofinal* subset iff $A$ is unbounded in $α$. Formally,
  $
    forall beta in alpha quad exists a in A quad beta ⩽ a.
  $
]
#remark[
  If $alpha$ is a successor ordinal, say $alpha=beta+1$ where $beta=max alpha$, then ${beta} ⊆ alpha$ is cofinal.
]
#definition[
  A map $f:α->β$ is *cofinal* iff its range is a cofinal subset of its codomain.
]
#definition[
  The *confinality* of an ordinal $α$, denoted $cof α$, is the minimum ordinal from which there exists a cofinal map into $α$.
]

#proposition[
  + $cof α$ is the minimum cardinality of $A$ for which $A ⊆ α$ is cofinal.
  + $cof α ⩽ α$
]
#lemma[
  For any ordinal $alpha$, there exists a strictly increasing cofinal map $f:cof α->α$.
]
#proof[
  Let $g:cof α->α$ be a cofinal map (as per definition of $cof α$). We proceed to construct an strictly increasing cofinal $f:cof α->α$ by recursion.

  Fix $β in cof α$ and assume $f(xi)$ is defined for any $xi < β$. Define
  $
    f(beta)=g(beta) ∪ sup_(xi<beta) f(xi)+1.
  $
]

Notice that this union ensures that $f$ is increasing and cofinal. If we were to define $f'(beta)=sup_(xi<beta) f'(xi)+1$, its range might be bounded.


#theorem[
  Let $alpha$ be a limit ordinal and $beta$ be an ordinal. If there exists a strictly increasing cofinal map $f:alpha->beta$, then $cof alpha=cof beta$.
]
#proof[
  Let $g_alpha:cof alpha->alpha$ and $g_beta:cof beta->beta$ be strictly increasing cofinal maps. Since $f$ is increasing, the composition $f compose g_alpha:cof alpha -> beta$ is cofinal. Therefore, $cof beta ⩽ cof alpha$.

  For the other direction, define $h:cof beta->alpha$ where $h(gamma)$ is the least ordinal such that $f(h(gamma)) > g_beta (gamma)$; see @h. Since $f:alpha->beta$ is cofinal, there is some $xi in alpha$ such that $f(xi) ⩾ g_beta (gamma)$; and because $alpha$ is a limit ordinal and $f$ is strictly increasing, $f(xi+1) > g_beta (gamma)$ and thus $h$ is well-defined.

  For any $xi in alpha$, choose $gamma in cof beta$ such that $f(xi) ⩽ g_beta (gamma)$. Since $f(xi) ⩽ g_beta (gamma) < f(h(gamma))$ where $f$ is increasing, it follows that $xi ⩽ h(gamma)$. Thus $h: cof beta->alpha$ is cofinal.
]

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(
      content: (padding: .1),
      circle: (radius: .05, fill: black),
      line: (
        mark: (end: "straight"),
      ),
    )
    for (x, (name, c)) in (a: $alpha$, b: $beta$, cofb: $cof beta$)
      .pairs()
      .enumerate() {
      let x = x * 3
      line(name: name, (x, 0), (x, 5))
      content(name + ".end", c, anchor: "south")
    }
    for y in range(1, 5) {
      let c = if y < 3 { gray } else { black }
      circle(name: "a" + str(y), (0, y), stroke: c, fill: c)
      circle(name: "b" + str(y), (3, y + .5), stroke: c, fill: c)
      line("a" + str(y), "b" + str(y), name: "f", stroke: c, fill: c)
    }
    content("a3.west", $h(gamma)$, anchor: "east")
    content("f.mid", $f$, anchor: "south")
    circle(name: "g", (6, 2))
    content("g.east", $gamma$, anchor: "west")
    circle(name: "gg", (3, 3))
    line("g", "gg", name: "g")
    content("g.mid", $g_beta$, anchor: "south")
  }),
  caption: $h(gamma)=min{xi in alpha:f(xi)>g_beta (gamma)$,
)<h>
