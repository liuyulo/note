#import "colors.typ"

#let _details(
  color: colors.black,
  key: none,
  name: none,
  prefix: "",
  stroke: false,
  body,
) = {
  let kind = if stroke { "details" } else { "detail" }
  let key = if key == none { prefix } else { key }
  let name = if name == none [] else [ (#name)]
  let numc = "A"
  // let numh = (_, ..nums) => numbering("111", ..nums)
  let numh = "111"
  let num = n => {
    let loc = query(figure.where(kind: kind)).at(n - 1).location()
    let loc = query(selector(<meta:det>).after(loc)).first().location()
    let hea = numbering(numh, ..counter(heading).at(loc))
    let cur = numbering(numc, ..counter(key).at(loc))
    hea + cur
  }
  let (hea, cur) = (counter(heading), counter(key))
  // keep track of previous heading for this key
  let old = counter(key + " h")
  figure.with(placement: none, kind: kind, numbering: num, supplement: prefix)({
    set align(left)
    let b = if stroke {
      block.with(
        inset: .5em,
        stroke: (left: color + .25em),
        fill: color.transparentize(95%),
      )
    } else { block }.with(width: 100%)

    // if inside new heading
    context if old.get() != hea.get() {
      old.update(hea.get())
      cur.update(0)
    }

    cur.step()
    let hea = context hea.display(numh)
    let cur = context cur.display(numc)
    b[#text(color)[*#prefix #hea#cur#name.*] #body<meta:det>]
  })
}

#let definition = _details.with(prefix: "Definition", color: colors.aqua)
#let theorem = _details.with(prefix: "Theorem", color: colors.teal)
#let lemma = _details.with(prefix: "Lemma", key: "Theorem", color: colors.teal)
#let corollary = _details.with(
  prefix: "Corollary",
  key: "Theorem",
  color: colors.teal,
)
#let algorithm = _details.with(prefix: "Algorithm", color: colors.pink)
#let remark = _details.with(prefix: "Remark")
#let example = _details.with(prefix: "Example")
#let proposition = _details.with(prefix: "Proposition", color: colors.teal)

#let proof(qed: true, body) = [
  _Proof._
  #body #if qed [#h(1fr)$□$]
]

#let details(body) = {
  show figure.where(kind: "details"): set block(spacing: 0pt, breakable: true)
  show figure.where(kind: "detail"): set block(spacing: 1em, breakable: true)
  show par: block.with(spacing: 1em)
  body
}
