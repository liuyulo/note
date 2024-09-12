
#import "../preamble.typ": *
#import "../details.typ": *

#let ok = $o k$
#let cent = $cancel(c)$
#let bin = math.italic("bin")
#let null = math.italic("null")
#let addr = $op("address")$
#let ap(..args) = args.pos().intersperse($med$).sum()
#let ab(..args) = $(#ap(..args))$
#let seq(..args) = args.pos().intersperse($.med$).sum()
#let tri(body) = $◃ #body ▹$
#let cond(b, x, y) = (
  $ap(bold("if"),#b,bold("then"),#x,bold("else"),#y,bold("fi"))$
)
#let int = math.italic("int")
#let xnat = math.italic("xnat")
#let nat = math.italic("nat")
#let ceil = math.op("ceil")
#let div(a, b) = $ap(italic("div"),#a,#b)$
