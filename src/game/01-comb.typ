#import "preamble.typ": *
= Combinatorial Games

Before defining combinatorial games, we first introduce a generalisation, called _logical games_ @logic.

#definition[A *logical game* is a structure $Γ=⟨Ω,τ,W_1,W_2⟩$ where

- $Ω$ is a *domain*,
- $τ:Ω^(< ω)->2$ is a *turn function*,
- $W_0,W_1 ⊆ Ω^(⩽ ω)$ are *rules* such that they are _disjoint_ and both sets are _closed upward_; that is, if $bold(a) in W_i$ and $bold(b) in Ω^(⩽ ω)$ extends $bold(a)$, then $bold(b) in W_i$.
]


#definition[A *combinatorial game* is a structure $G=⟨X,R_1,R_2⟩$ where

- $X$ is the set of *positions*,
- $R_i ⊆ X × X$ is the set of *moves* for player $i$.
]

We say that $x in X$ is a *terminal* position for player $i$ if there exists no $y$ such that $x R_i y$. A game is *impartial* if the players have the same move (i.e. $R_1=R_2$), otherwise it is *partisan*.
