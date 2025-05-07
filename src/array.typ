// itertools
#let replicate(n,x) = range(n).map(_ => x)
#let cartesian(xs, ys) = xs.fold((), (acc, x) => acc + ys.map(y => (x, y)))
