p = 1
angle = pi/200

x <- (p)*1i*sin(angle) - (p)*cos(angle)
x <- x^(1:1004)

plot(x = Re(x), y = Im(x), type = "l", asp = 1)
