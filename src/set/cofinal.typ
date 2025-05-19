#import "preamble.typ": *

= Cofinality

#definition[
  A subset $A$ of an ordinal $α$ is a *cofinal* subset iff $A$ is unbounded in $α$.
]
#definition[
  A map $f:α->β$ is *cofinal* iff its range is a cofinal subset of its codomain.
]
#definition[
  The *confinality* of an ordinal $α$, denoted $cof α$, is the minimum ordinal from which there exists a cofinal map into $α$.
]

#lemma[
  + $cof α$ is the minimum cardinality of $A$ for which $A ⊆ α$ is cofinal.
  + $cof α ⩽ α$
]
#lemma[
  Let $α$ be an ordinal. There exists a strictly increasing cofinal map $f:cof α->α$.
]
#proof[
  Let $g:cof α->α$ be a cofinal map (as per definition of $cof α$). We proceed to construct an strictly increasing cofinal $f:cof α->α$ by recursion.

  Fix $β in cof α$ and assume $f(xi)$ is defined for any $xi < β$. Define
  $
    f(beta)=g(beta) ∪ sup_(xi<beta) f(xi)+1.
  $
]

Notice that this union ensures that $f$ is increasing and cofinal. If we were to define $f'(beta)=sup_(xi<beta) f'(xi)+1$, its range might be bounded.
