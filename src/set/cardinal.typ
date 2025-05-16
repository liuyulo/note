#import "preamble.typ": *

= Cardinals

#definition[A set $A$ is said to be *equinumerous*  to $B$, denoted $|A|=|B|$, iff there is a bijection from $A$ to $B$.]

#definition[Let $A$ be well-orderable. The *cardinality* of $A$, denoted $|A|$, is the smallest ordinal equinumerous to $A$.]
#definition[An ordinal $α$ is a *cardinal* iff $|α|=α$.]

For convenience, let $|A|⩽ |B|$ denote the statement "there is an injection from $A$ to $B$".

#theorem(name:[Cantor-Berstein])[
  Let $A$ and $B$ be well-orderable sets. If $|A| ⩽ |B|$ and $|B| ⩽ |A|$, then $|A|=|B|$.
]

#lemma[Let $α$ and $β$ be ordinals. If $|α| ⩽ β ⩽ α$, then $|α|=|β|$.]
#proof[
  $β ⩽ α$ implies $|β| ⩽ |α|$; and $|α| ⩽ β$ implies $|a|=||a|| ⩽ |β|$.
]
#corollary[
  Let $α$ be an ordinal and $κ$ be a cardinal. If $|α| < κ$, then $α < κ$.
]<ord-card>
#proof[
  BWOC assume $κ ⩽ α$, then $|α|=|κ|=κ$, contradicting $α < κ$.
]

== Cardinal Arithmetics

#definition[
  Let $κ$ and $λ$ be cardinals. 
  $
  κ plus.square λ &≝ |κ × {0} ∪ λ × {1}|\
  κ times.circle λ &≝ |κ × λ|
  $
]

Notice that $plus.square$ and $times.circle$ are commutative.

#theorem[
  Every infinite cardinal is a limit ordinal.
]
#proof[
  BWOC assume some infinite cardinal $κ=α+1$ for some ordinal $α$. Since $α$ must be infinite, we have that $|1+α|=|α|$. It then follows that
  $
  κ=|κ|=|α+1|=|1+α|=|α|.
  $
  Thus $κ ⩽ α$, contradicting that $κ=α+1 > α$.
]

#theorem(name: [Product Theorem])[(#ac) For any infinite cardinal $κ$

  $
    κ times.circle κ=κ.
  $
]
#proof[
  An injection from $κ$ to $κ × κ$ is straight forward, so we are left to show that $κ times.circle κ ⩽ κ$. Assume $α times.circle α=α$ for any infinite cardinal $α < κ$. Define the following well-order $prec$ on $κ × κ$:

  $
    (α,β) prec (α',β') "iff" & (α ∪ β,α,β) class("binary", <)_"lex" (α' ∪ β',α',β')
  $
  where $class("binary", <)_"lex"$ is the lexicographic order on $κ × κ × κ$.

  To complete the proof, it suffices to show that
  $
    |κ × κ| ⩽ otp_prec (κ × κ) ⩽ sup_(δ < κ) otp_prec (δ × δ) ⩽ κ.
  $

  The left-most inequality follows from the definition of cardinality. To show $otp_prec (κ × κ) ⩽ sup_(δ < κ) otp_prec (δ × δ)$, let any $xi < otp(κ × κ)$, and we claim that $xi < otp(δ × δ)$ for some $δ < κ$. Let $(α,β)dn$ be the initial segment of $κ × κ$ order isomorphic to $xi$. Define $δ= (α ∪ β)+1 < κ$ (notice $κ$ is a limit ordinal), then it follows that for any $(α',β') prec (α,β)$
  $
  α' ∪ β' ⩽ α ∪ β < δ.
  $
  Therefore, $(α',β') in δ × δ$ and $(α,β)dn$ (which is order isomorphic to $α$) is also an initial segment of $δ × δ$. Thus $α < otp(δ × δ)$.

  To show $otp(δ × δ) < κ$, let any $δ < κ$. By induction hypothesis, it follows that
  $
  |otp(δ × δ)|=|δ × δ|=|δ| ⩽ δ < κ.
  $
  Thus $otp(δ × δ)<κ$ by @ord-card.
]
