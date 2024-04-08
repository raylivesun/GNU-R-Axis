#!/usr/bin/r

# Description

# Class "diagonalMatrix" is the virtual class of all diagonal matrices.

# Objects from the Class

# A virtual Class: No objects may be created from it.

# Slots

# diag: character string, either "U" or "N", where "U" means ‘unit-diagonal’.
# Dim: matrix dimension, and
# Dimnames: the dimnames, a list, see the Matrix class description. Typically list(NULL,NULL)
# for diagonal matrices.

# Extends

# Class "sparseMatrix", directly.

# Methods
# 
# These are just a subset of the signature for which defined methods. Currently, there are (too) many
# explicit methods defined in order to ensure efficient methods for diagonal matrices.
# coerce signature(from = "matrix", to = "diagonalMatrix"): ...
# coerce signature(from = "Matrix", to = "diagonalMatrix"): ...
# coerce signature(from = "diagonalMatrix", to = "generalMatrix"): ...
# coerce signature(from = "diagonalMatrix", to = "triangularMatrix"): ...
# coerce signature(from = "diagonalMatrix", to = "nMatrix"): ...
# coerce signature(from = "diagonalMatrix", to = "matrix"): ...
# coerce signature(from = "diagonalMatrix", to = "sparseVector"): ...
# t signature(x = "diagonalMatrix"): ...
# and many more methods
# solve signature(a = "diagonalMatrix", b, ...): is trivially implemented, of course; see also
# solve-methods.
# which signature(x = "nMatrix"), semantically equivalent to base function which(x, arr.ind).
# "Math" signature(x = "diagonalMatrix"): all these group methods return a "diagonalMatrix",
# apart from cumsum() etc which return a vector also for base matrix.
# * signature(e1 = "ddiMatrix", e2="denseMatrix"): arithmetic and other operators from the
# Ops group have a few dozen explicit method definitions, in order to keep the results diagonal
# in many cases, including the following:
#   / signature(e1 = "ddiMatrix", e2="denseMatrix"): the result is from class ddiMatrix which
# is typically very desirable. Note that when e2 contains off-diagonal zeros or NAs, we implicitly
# use 0/x = 0, hence differing from traditional R arithmetic (where 0/0 7→ NaN), in order to
# preserve sparsity.
# summary (object = "diagonalMatrix"): Returns an object of S3 class "diagSummary" which
# is the summary of the vector object@x plus a simple heading, and an appropriate print
# method.

# See Also

# Diagonal() as constructor of these matrices, and isDiagonal. ddiMatrix and ldiMatrix are
# “actual” classes extending "diagonalMatrix".

# Examples

I5 <- diag(5)
D5 <- diag(x = 10*(1:5))
## trivial (but explicitly defined) methods:
stopifnot(identical(crossprod(I5), I5),
          identical(tcrossprod(I5), I5),
          identical(crossprod(I5, D5), D5),
          identical(tcrossprod(D5, I5), D5),
          identical(solve(D5), solve(D5, I5)),
          all.equal(D5, solve(solve(D5)), tolerance = 1e-12)
)
solve(D5)# efficient as is diagonal
# an unusual way to construct a band matrix:
rbind2(cbind2(I5, D5),
       cbind2(D5, I5))

