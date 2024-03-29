
# Арифметика --------------------------------------------------------------


5 * 9

49 / 7 * 9 + 90 + 0.9123

5 < 6


# Переменные --------------------------------------------------------------

x <- 5
z <- F
y <- 5.78
m <- -9 + 8.123i
s <- "Hello Fellows"

is.character(s)
is.numeric(x)
is.complex(m)

is.vector(x)


# Вектор ------------------------------------------------------------------

vec_1 <- c(5, 8, 9.123, T, 5 - 7i)
print(vec_1)

vec_2 <- seq(from=9, to=-8.9, by=-0.1)
vec_2

vec_3 <- seq(1, 10, length.out=5)
vec_3

vec_4 <- -9:9
vec_4

vec_5 <- -8.5:7.562
vec_5


# Операции с векторами ----------------------------------------------------

vec_11 <- -9:8
vec_12 <- -10:7

vec_11 + vec_12
vec_11 - vec_12
vec_11 / vec_12
vec_11 * vec_12

vec_11 %*% vec_12


# Правило копирования -----------------------------------------------------

vec_13 <- 1:10
cat(vec_13, "\n")
vec_14 <- 1:15
cat(vec_14, "\n")

cat(vec_13 + vec_14, "\n")


# Атрибуты класса вектор --------------------------------------------------

vec_11

length(vec_11)

names(vec_11)

names(vec_11) <- letters[1:18]

names(vec_11)

vec_11


# Индексация --------------------------------------------------------------

vec_11[c(2, 5, 9, 13)]

vec_11[9]

vec_11[1]

vec_11[1:9]

vec_11[c("f", "b", "e", "c")]

vec_11[order(vec_11)]

vec_15 <- 9:-9
vec_15

vec_15[order(vec_15)]

vec_11[-3] # Исключение элемента

vec_11[-c(7, 9, 11, 8)]

vec_11[vec_11 < 0] # Маска условия

