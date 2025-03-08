#import "preamble.typ": *
= Combinatorial Games

#definition[A *combinatorial game* is a structure $G=⟨X,R_1,R_2⟩$ where

- $X$ is the set of *positions*,
- $R_i ⊆ X × X$ is the set of *moves* for player $i$.
]

We say that $x in X$ is a *terminal* position for player $i$ if there exists no $y$ such that $x R_i y$. A game is *impartial* if the players have the same move (i.e. $R_1=R_2$), otherwise it is *partisan*.
