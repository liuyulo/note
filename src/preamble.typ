#import "./details.typ": details
#import "./array.typ"

#let br(base, a) = math.attach(base, br: a)
#let tr(base, a) = math.attach(base, tr: a)
#let bij = $->^~$
#let res = math.harpoon.tr
#let inj = math.arrow.hook
#let sur = math.arrow.twohead
#let dom = math.op("dom")
#let cod = math.op("cod")
#let ran = math.op("ran")
#let cal = text.with(font: "Pxsy")
#let todo(body) = text(red, [todo: ] + body)

#let preamble(date: true, header: true, dark: false, body) = {
  show: details
  show list: set block(above: 0.5em, below: 1em)
  show enum: set block(above: 0.5em, below: 1em)
  show raw: set text(font: "Iosevka Custom NF", discretionary-ligatures: true)
  show math.equation: set text(font: "Libertinus Math")

  set heading(numbering: "1.1.1")
  set text(size: 16pt)
  set list(marker: [•])
  set page(margin: .5in, numbering: "1")
  set page(
    header: context {
      let q = query(selector(heading.where(level: 1).before(here())))
      if (q.len() == 0) {
        return
      }
      smallcaps(q.last().body)
      let q = query(selector(heading.where(level: 2).before(here())))
      if (q.len() == 0) {
        return
      }
      h(1fr)
      q.last().body
    },
  ) if header

  align(center, text(2em, context document.title))
  if date {
    align(center, datetime.today().display())
  }

  body
}
