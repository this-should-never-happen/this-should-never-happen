define(`a', `e')dnl
define(`b', `d')dnl
define(`c', `n')dnl
define(`x', $1)dnl
x(`'b`'a`'f`'i`'c`'a`'(``y'', `'b`'a`'f`'c`'(``'b`'a`'f`'i`'c`'a`'')))dnl
x(`y'(``z'', `'b`'a`'f`'c`'(``'b`'c`'l`'')))z
divert(`9')z
!
divert(`8')z
x(`b')`'z
divert(`7')z
x(``l'')`'z
divert(`6')z
`r'z
divert(`5')z
x(x(```o'''))`'z
divert(`4')z
x(W)`'z
divert`'z
y(World, Hello)z
World z
