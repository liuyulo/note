#import "preamble.typ": *

= Cardinals

#corollary[
  Let $α$ be an ordinal and $κ$ be a cardinal. If $|α| < κ$, then $α < κ$.
]<ord-card>
#proof[
  BWOC assume $κ ⩽ α$, then $|α|=|κ|=κ$, contradicting $α < κ$.
]

== Cardinal Arithmetic

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
