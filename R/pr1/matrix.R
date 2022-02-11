x <- 1:5
y <- 2:7

X <- outer(x, y, FUN = function(x, y) x * (-y))

X


Y <- matrix(data = 1:10, nrow = 2)

Z <- matrix(data = 1:10, nrow = 2, byrow = T)

X_1 <- 1:9
X_2 <- 2:12

X_22 <- cbind(X_1, X_2)
X_22

X_11 <- rbind(X_1, X_2)
X_11


X_11 %*% X_22


X_11 + X_11
X_11 / X_11


# Слайсинг матриц ---------------------------------------------------------


X <- matrix(1:25, nrow = 5, byrow = T)
X

X[1:3 + 1, c(2, 4)]
X[X[, 1] > 4, ]


