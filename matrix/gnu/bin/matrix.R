#!/usr/bin/r

# Description

# Construct a formally diagonal Matrix, i.e., an object inheriting from virtual class diagonalMatrix
# (or, if desired, a mathematically diagonal CsparseMatrix).

# Usage

# Diagonal(n, x = NULL, names = FALSE)
# .sparseDiagonal(n, x = NULL, uplo = "U", shape = "t", unitri = TRUE, kind, cols)
# .trDiagonal(n, x = NULL, uplo = "U", unitri = TRUE, kind)
# .symDiagonal(n, x = NULL, uplo = "U", kind)


# Arguments

# ninteger indicating the dimension of the (square) matrix. If missing, then length(x)
# is used.

# x            numeric or logical vector listing values for the diagonal entries, to be recycled
#              as necessary. If NULL (the default), then the result is a unit diagonal matrix.
#             .sparseDiagonal() and friends ignore non-NULL x when kind = "n".

# name        seither logical TRUE or FALSE or then a character vector of length n. If
#             true and names(x) is not NULL, use that as both row and column names for the
#             resulting matrix. When a character vector, use it for both dimnames.

# uplo        one of c("U","L"), specifying the uplo slot of the result if the result is formally
#             triangular of symmetric.

# shape       one of c("t","s","g"), indicating if the result should be formally triangular,
#             symmetric, or “general”. The result will inherit from virtual class triangularMatrix,
#             symmetricMatrix, or generalMatrix, respectively.

# unit        rilogical indicating if a formally triangular result with ones on the diagonal should
#             be formally unit triangular, i.e., with diag slot equal to "U" rather than "N".

# kind        one of c("d","l","n"), indicating the “mode” of the result: numeric, logical,
#             or pattern. The result will inherit from virtual class dsparseMatrix, lsparseMatrix,
#             or nsparseMatrix, respectively. Values other than "n" are ignored when x is
#             non-NULL;   in that case the mode is determined by typeof(x).
#             colsoptional integer vector with values in 0:(n-1), indexing columns of the speci-

# fied        diagonal matrix. If specified, then the result is (mathematically) D[, cols+1]
#             rather than D, where D = Diagonal(n, x), and it is always “general” (i.e., shape
#                                                                     is ignored).


# Value

# Diagonal() returns an object inheriting from virtual class diagonalMatrix.
# .sparseDiagonal() returns a CsparseMatrix representation of Diagonal(n, x) or, if cols is
# given, of Diagonal(n, x)[, cols+1]. The precise class of the result depends on shape and kind.
# .trDiagonal() and .symDiagonal() are simple wrappers, for .sparseDiagonal(shape = "t")
# and .sparseDiagonal(shape = "s"), respectively.
# .sparseDiagonal() exists primarily to leverage efficient C-level methods available for CsparseMatrix.

# Author(s)
# Martin Maechler

# See Also

# the generic function diag for extraction of the diagonal from a matrix works for all “Matrices”.
# bandSparse constructs a banded sparse matrix from its non-zero sub-/super - diagonals. band(A)
# returns a band matrix containing some sub-/super - diagonals of A.
# Matrix for general matrix construction; further, class diagonalMatrix.

# Examples

diag(3)
diag(x = 10^(3:1))
diag(x = (1:4) >= 2)#-> "matrix"
## Use Diagonal() + Kronecker() for "repeated-block" matrices:
M1 <- matrix(0+0:5, 2,3)
(M <- kronecker(diag(3), M1))
(S <- crossprod(matrix(rbinom(60, size=1, prob=0.1), 10,6)))
(SI <- S + 10*(6)) # sparse symmetric still
stopifnot(is(SI, "matrix"))
(I4 <- c(4, shape="t"))# now (2012-10) uni triangular


