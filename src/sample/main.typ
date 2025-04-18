#import "../preamble.typ": *
#import "../details.typ": *

#set document(title:"Sample Document")
#show: preamble

#let feature = _details.with(prefix: "Feature")

This is a sample document that lists some features I have implemented in Typst.

= Features

- *Last updated date.* The date shown at the top of the document indicates the latest date when this document is compiled.
- *Page numbers.* Every page has a footer that shows the page number.
- *Section headings.* Starting from the second page, every page has a header that shows the current section and subsection.
- *Fancy boxes.* Styled boxes for definitions and theorems. See @fancy.

= Fancy Boxes <fancy>

There are styled boxes for definitions, theorems, lemmas, corollaries, examples, remarks, etc. These boxes are implemented as figures; they are numbered too.

For example, @ord defines ordinals in set theory.

#definition(name:[Ordinals])[An *ordinal* is a set $α$ that is transitive and well-ordered by $br(in,α)$.]<ord>

#example[$ω$ is an ordinal.]

#theorem[The collection of all ordinals is not a set.]
#proof[
Suppose $OO NN$ is the set of all ordinals, then itself would be an ordinal because $OO NN$ is transitive. Therefore $OO NN in OO NN$, a contradiction.
]


= Another Section
== A Subsection

#lorem(200)
