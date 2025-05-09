#import "preamble.typ": *
= Combinatorial Games

Before defining combinatorial games, we first introduce a generalisation, called _logical games_ @logic.

== Logical Games

#definition[A *logical game* is a structure $⟨Ω,τ,W_1,W_2⟩$ where

  - $Ω$ is a *domain*,
  - $τ:Ω^(< ω)->2$ is a *turn function*,
  - $W_0,W_1 ⊆ Ω^(⩽ ω)$ are *rules* such that they are _disjoint_ and both sets are _closed upward_; that is, if $bold(a) in W_i$ and $bold(b) in Ω^(⩽ ω)$ extends $bold(a)$, then $bold(b) in W_i$.
]

A logical game is played as follows: the players choose elements from the _domain_ $Ω$ to build an infinite sequence $bold(a)=(a_1,a_2,⋯) in Ω^ω$ called a *play*. Player $i$ *wins* at play $bold(a)$ iff $bold(a) in W_i$.

Elements of $Ω^(< ω)$ (i.e. finite sequences) are called *positions*; they record where a play might have got at a certain time. The _turn function_ determines whose turn it is to choose the next element from $Ω$; at position $bold(a)=(a_1,⋯,a_k) in Ω^(< ω)$, it is $τ(bold(a))$'s turn to choose $a_k in Ω$. If a position $bold(a)$ is in $W_i$, we say player $i$ *already wins* at $bold(a)$.

We assume logical games are *total*; that is, every play is winning for some player:

$
  Ω^ω ⊆ W_0 ∪ W_1.
$

#definition[
  A logical game $⟨Ω,τ,W_1,W_2⟩$ is

  - *well-founded* if 
    $
    ∀(a_k")"_(k < ω) in Ω^ω quad ∃n<ω quad (a_0,⋯,a_n) in W_1 ∪ W_2.
    $
    That is, in every play, some player wins at some finite position.
  - *finite* if
    $
    ∃n < ω quad ∀(a_k")"_(k < ω) quad (a_0,⋯,a_n) in W_1 ∪ W_2.
    $
    That is, there is a finite $n$ such that in every play, some player wins at the $n$th position.
]

#definition[A *combinatorial game* is a structure $G=⟨X,R_1,R_2⟩$ where

  - $X$ is the set of *positions*,
  - $R_i ⊆ X × X$ is the set of *moves* for player $i$.
]

We say that $x in X$ is a *terminal* position for player $i$ if there exists no $y$ such that $x R_i y$. A game is *impartial* if the players have the same move (i.e. $R_1=R_2$), otherwise it is *partisan*.
