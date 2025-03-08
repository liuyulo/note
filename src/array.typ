// itertools

#let cartesian(xs, ys) = xs.fold((), (acc, x) => acc + ys.map(y => (x, y)))
