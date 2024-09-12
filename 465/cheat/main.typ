#import "../preamble.typ": *

#show raw: set text(font: "Iosevka Custom", discretionary-ligatures: true)
#set page(paper: "us-letter", columns: 2, margin: .1in)
#show math.equation: set text(font: "STIX Two Math")
#set grid.vline(stroke: .5pt)
#set grid.hline(stroke: .5pt)
#set text(size: 9pt)
#set grid(inset: 2pt)
#set heading(numbering: "1.")
#let wh(b, P) = $ap(bold("while"),#b,bold("do"),#P,bold("od"))$
#let ex(A, b, C) = $ap(bold("do"),seq(A,bold("exit when") #b, #C),bold("od"))$

$->$ is $⇒$ with lower precedence
= Binary Theory

#grid(columns: (1fr, 1fr), align: center)[
  $φ <==> φ ← top$][$not φ <==> φ → bot$]

Connection Law (p49) $a ≤ b ⇒ t ≤ a ⇒ t ≤ b$

== Monotonicity

#grid(
  columns: 3,
  [$f$ is _monotonic_], [iff], $e → e' ==> f(e) -> f(e')$,
  [$f$ is _antimonotonic_], [iff], $e → e' <== f(e) -> f(e')$,
)

#grid(
  columns: 4,
  grid.vline(x: 2),
  $- and b$,
  [monotonic],
  $- or b$,
  [monotonic],
  $- -> b$,
  [antimonotonic],
  $a -> -$,
  [monotonic],
  $cond(b,-,y)$,
  [monotonic],
  $cond(b,x,-)$,
  [monotonic],
  $not -$,
  [antimonotonic],
)

== Context
#[
  #set text(size: .94em)

  #grid(
    columns: 6,
    grid.vline(x: 3),
    [*expression*],
    [*assume*],
    [*change*],
    [*expression*],
    [*assume*],
    [*change*],
    $e_0 and e_1$,
    $e_0$,
    $e_1$,
    $e_0 or e_1$,
    $e_0$,
    $e_1$,
    $e_0 -> e_1$,
    $e_0$,
    $e_1$,
    $e_0 -> e_1$,
    $not e_1$,
    $e_0$,
    $cond(b,e_0,e_1)$,
    $b$,
    $e_0$,
    $cond(b,e_0,e_1)$,
    $not b$,
    $e_1$,
    $cond(b,e_0,e_1)$,
    $e_0 ≠ e_1$,
    $b$,
  )
]

#counter(heading).update(3)

= Program Theory

== Specification

#grid(
  columns: 3,
  [$S$ is _satisfiable_ for prestate $σ$], [iff], [$∃ σ' · S$],
  [$S$ is _deterministic_ for prestate $σ$], [iff], [$¢ (§ σ' · S)≤ 1$],
  [$S$ is _implementable_], [iff], [$∀ σ · ∃ σ' · S$],
  [$S$ is _refined_ by $P$], [iff], [$∀ σ,σ' · S <- P$],
)

$
  seq(S,R)=∃σ'' · ap(⟨σ' · S⟩,σ'') and ap(⟨σ · R⟩,σ'')
$

== Time

add $t ≔ t+1$ before each recursive call

== Hoare

#grid(
  columns: 2,
  [The _exact precondition_ for $P$ to be refined by $S$ is $P_"pre"$ is],
  [$∀σ' · P <- S$],

  [The _exact postcondition_ for $P$ to be refined by $S$ is $P_"post"$ is],
  [$∀ σ · P <- S$],
)

- Thus $S ==> P_"pre" ==> P$ and $S ==> P_"post" ==> P$
- Notice sufficient $⇒$ exact $⇒$ necessary

Assertion $I$ is an _invariant_ for specification $S$ iff $I -> I'$ is refined by $S$

$
  ∀σ,σ' · S -> I -> I'
$

// The exact precond for $x' > 5$ to be refined by $x ≔ x+1$ is
//
// $
// &= ∀x' · x' > 5 ⇐ x ≔ x+1 quad  & "expand assignment"\
// &= ∀x' · x' > 5 ⇐  x'=x+1 & "one-point"\
// &= x + 1 > 5 & "simplify"\
// &= x > 4
// $

= Programming Language

== Scope

#let new(x) = ap(math.bold("new"), x)
#let frame(x) = ap(math.bold("frame"), x)
$
  new(x) : T ≔ e · P & <==> ∃x:e · ∃x':T · P\
  frame(x_1 comma x_2) · P & <==> P and x'_3=x_3 and x'_4=x_4 and ⋯
$

$s := Sigma L <== frame(s) · new(n):nat · s'=Sigma L$

== Data Structure
=== Array

no substitution law for array assignment

$
  ap(A,i) := e & <==> A:= i |-> e | A\
  ap(A,i,j) := e & <==> A := (i;j)|->e | A
$

=== Record

array but index is text

```
person = "name" -> text | "age" -> nat
new p: person
p := "name" -> "Josh" | "age" -> 17
p "age" := 18 <==> p := "age" -> 18 | p
```

== Control Structure

$
  W ← wh(b,P) & <==> W ⇐ cond(b,seq(P,W),ok)\
  L ⇐ ex(A,b,C) & <==> L ⇐ seq(A, cond(b,ok,seq(C,L)))\
$

/*
== Deep exit

#stack(dir: ltr)[
```
P ⇐ DO
A. EXIT 1 WHEN b. C.
DO
D.
EXIT 2 WHEN e.
F.
EXIT 1 WHEN g.
H
OD.
I
OD
```
][means

$
P &<== seq(A,cond(b,ok,seq(C,Q)))\
Q &<== seq(D,cond(e,ok,seq(F,cond(g,seq(I, P),seq(H,Q)))))
$
]
*/

=== For Loop

#let fo(i, m, n, e) = [
  $ap(bold("for"), #i := #m semi ..#n, bold("do"), #e, bold("od"))$
]

Let $ap(F,i)$ be the computation from index $i$ to end

$
  "To prove:" && ap(F,0) & <== fo(i,0,n,P)\
  "Prove:" && ap(F,i) & <== i:0,..n and (seq(P,ap(F,(i+1))))\
  && ap(F,n) & <== ok
$

- specification: $x'=2^n$
- define: $ap(F,i) <==> x'=x × 2^(n-i)$
- refine:
$
  x'=2^n & <== seq(x := 1,ap(F,0))\
  ap(F,0) & <== fo(i,0,n,x :=2 × x)
$
- proof:
$
  ap(F,i) & <== i:m, .. n and (seq(P,ap(F,(i+1))))\
  ap(F,n) & <== ok
$

=== For Loop (Invariant)

Let $A=⟨i:nat · e⟩$ be an invariant, then the refinement

$
  ap(A,0) ⇒ ap(A',n) <== fo(i,0,n,i : 0 comma .. n and ap(A,k)⇒ ap(A',(k+1)))
$
does not need a proof.

- specification: $s'=n^2$
- invariant: $A=⟨i:nat · s=i^2⟩$
- first refinement:
$
  s'=n^2 <== seq(s≔ 0,ap(A,0)⇒ ap(A',n))
$
- refine (no proof need):
$
  ap(A,0) ⇒ ap(A',n) <== fo(i,0,n,i : 0 comma .. n and ap(A,k)⇒ ap(A',(k+1)))
$
- last refinement:
$
  k:0,..n and ap(A,k) ⇒ ap(A',(k+1)) <== s ≔ s+k+k+1
$

= Recursive Definition

_Construction axiom_ says what's in $nat$
$
  0 &:nat\
  nat+1 &:nat
$

_Induction axiom_ says what's not in $nat$

$
  0,B+1: B ==> nat: B
$

_Predicate_

$
  ap(P,0) and ∀ n:nat · ap(P,n) ⇒ ap(P,(n+1)) <==> ∀n:nat · ap(P,n)
$
where $==>$ is induction axiom, $<==$ is construction axiom

== Recursive Data Construction: Least Fixed Point

Given $x=φ(x)$

+ Let $x_0=null$, define $x_(n+1)=φ(x_n)$.
+ Guess $x_n$ that involves $n$, but not $x$.
+ Let $x_∞$ by replacing $n$ in $x_n$ by $∞$
+ Prove $x_∞$ is a fixpoint by verifying $x_∞ = φ(x_∞)$
+ Prove $x_∞$ is the least by verifying $B=φ(B) ==> x_∞:B$

== Recursive Specification Construction

same as data construction
- without time: start with $P_0 = top $
- with time: start with $P_0 = t' ≥ t $
- then do $P_n = φ(P_n)$

== Recursive Loop Construction

(Similar to each axiom of $nat$) Construction axioms (with time)

$
  t'≥ t &<== text(#blue,wh(b,P))\
  cond(b,seq(P,t≔ t+1,text(#blue,wh(b,P))),ok) & <== text(#blue,wh(b,P))
$

Induction axioms (with time)

$
  ∀σ,σ' · t'≥t and cond(b,seq(P,t≔ t+1,text(#blue,W)),ok) <- text(#blue,W)\
  ==>\
  ∀σ,σ' · wh(b,P) <- text(#blue,W)
$

= Theory Design and Implementation

== Program Theory

Treat data structure as a (global) program state/variable

_user variable_: used to access/modify the state\
_implementer variable_: used to implement the theory

=== Example: Program Stack

#let sta = math.italic("stack")
#let push(..args) = ap(math.italic("push"), ..args)
#let pop = math.italic("pop")
#let top = math.italic("top")

- user variable: $italic("push"), italic("pop"), italic("top")$
- implementer variable: $s$
- axioms:
  #grid(
    inset: (x: 1em),
    columns: 2,
    $top'=x <== push(x)$, $ok <== seq(push(x),pop)$,
  )
- implementation:
  $
    push() & <==> ⟨x:X · s := s;;[x]⟩\
    pop & <==> s := ap(s,[0;..\#s-1])\
    top & <==> ap(s,(\#s-1))
  $

== Data Transformer

To transform impl var $v$ with $w$, define binary expression $D$ such that
$
  ∀w · ∃v · D
$
then, each specification $S$ is transformed to
$
  ∀ v · D -> ∃v' · D' and S
$

=== Example

Given user variable $u: bin$, impl variable $v:nat$, define theory
#let ev(body) = ap(math.italic("even"), body)

$
  italic("zero") &<==> v≔ 0\
  italic("incr") &<==> v≔ v+1\
  italic("inquire") &<==> u≔ ev(v)
$
Define transformer $w=ev(v)$ we have

#grid(
  columns: 3,
  [*operation*], [*becomes*], [*becomes*],
  $italic("zero")$,
  $text(#blue,∀v · w= ev(v) -> ∃v' · w'=ev(v')) and (v≔ 0)$,
  $w≔ ⊤$,

  $italic("incr")$, $text(#blue,...) and (v≔v+1)$, $w≔ not w$,
  $italic("inquire")$, $text(#blue,...) and (u≔ ev(v))$, $u≔ w$,
)

= Concurrency

wr./re. means write/read, means assign/use

#smallcaps[If] (1) $P$ and $Q$ #strike[wr.] the same variable, (2) each variable wr. in $P$ #strike[re.] in $Q$, #smallcaps[then]
$
  seq(P(bold(x)),Q(bold(x))) <==> seq(bold(y) :=bold(x),P(bold(x)) || Q(bold(y)))
$
- for all variables $bold(x)$ used in $P$ and assigned in $Q$

#smallcaps[If] variable assigned in $P$ #strike[used] in $Q$ and vice versa, #smallcaps[then]

$
  seq(P,Q) <==> P || Q
$

= Interaction
== Communication Channels
#grid(
  columns: 3,
  [message script], $bold(M)c$, [string constant],
  [time script], $bold(T)c$, [string constant],
  [read cursor], $bold(r)c$, [xnat],
  [write cursor], $bold(w)c$, [xnat],
)

- $bold(T)$ is string of nondecreasing numbers
- $bold(r)$ and $bold(w)$ may increase, but never decreases

#grid(
  columns: 2,
  $c!e$, [write expression $e$ at channel $c$],
  $c?$, [read channel $c$, i.e. move read cursor],
  $c$, [refer the value at channel $c$ just read],
  $✓c$, [check if there written but unread message on channel $c$],
)
== Transit Time
#grid(
  columns: 3,
  $c?$, [becomes], $seq(t :=t ↑ (bold(t)c_(bold(r)c)+1), c?)$,
  $checkmark c$, [becomes], $bold(T)c_(bold(r)c)+1 ≤ t$,
)
$
W &<==> seq(t :=t ↑ (bold(t)c_(bold(r)c)+1), c?) \
W &<== cond(checkmark c,c?,seq(t ≔ t+1,W))
$

== Monitor

#let inn = $sans("in")$
#let ack = $sans("ack")$
#let req = $sans("req")$
#let out = $sans("out")$

The monitor consists of the channels $x p A$ for each variable $x$, process $p in {0,1}$, and $A in {inn,ack,req,out}$ for read input, acknowledge read, request write, write output.

Let $m = ⇓[bold(T)x p A_(bold(r)x p A) · x in X, p in {0,1}, A in {sans("in"),sans("req")}]$

$
sans("monitor") = & (✓x 0inn or bold(T)x 0inn_(bold(r)x 0inn)=m) and (seq(x 0inn?,x ≔ x 0inn, x 0ack!⊤))\
or &(✓x 1inn or bold(T)x 1inn_(bold(r)x 1inn)=m) and (seq(x 1inn?,x ≔ x 1inn, x 1ack!⊤))\
or & (✓x 0req or bold(T)x 0req_(bold(r)x 0req)=m) and (seq(x 0req?,x 0out!x))\
or & (✓x 1req or bold(T)x 1req_(bold(r)x 1req)=m) and (seq(x 1req?,x 1out!x)).\
& sans("monitor")
$

Can be implemented by four $bold("if")$s, followed by $seq(t := t+1,sans("monitor"))$

== Local Channels

=== Deadlock

happens when $bold(T)=t ↑ (bold(T)+1)$, which implies $t'=∞$

= Laws++

$
  seq(x := e, P[x]) &<==> P[e]\
  seq((x := e_1 || y:=e_2), P[x,y]) & <==> P[e_1,e_2]\
  P[t'] || Q[t'] & <==> ∃t_P,t_Q · P[t_P] and Q[t_Q] and t'=t_P arrow.t t_Q
$
