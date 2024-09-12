#import "../preamble.typ": *
#import "../preamble.typ": preamble as _preamble
#import "../details.typ": *
#let amat = math.mat.with(augment: -1)
#let Rb = $RR_b (s,t)$
#let ta = $tilde(a)$
#let eps = raw("eps")
#let dx = $d x$
#let sgn = $op("sgn")$
#let cond =$op("cond")$
#let Rbst = $RR_b (s,t)$
#let xx = $arrow(x)$
#let yy = $arrow(y)$
#let bb = $arrow(b)$
#let dd = $arrow(d)$
#let cc = $arrow(c)$
#let hx = $hat(x)$
#let hz = $hat(z)$
#let ha = $hat(a)$
#let hy = $hat(y)$
#let tx = $tilde(x)$
#let fl = $op("fl")$
#let Pn = $cal(P)_n$
#let dx = $d x$

#let preamble(..args) = {
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  _preamble(..args)
}
