pkg load symbolic;

x = sym("x");
# Symbolic pkg v3.2.1: Python communication link active, SymPy v1.10.1.
y = sym("y");
z = sym("z");
t = sym("t");
a = sym("a");
b = sym("b");

x  = a + b;

y = a^2 - b^2;

z = x*y
%z = (sym)

%          / 2    2\
%  (a + b)*\a  - b /

t = x^3/z

#        2
#  (a + b)
#  --------
#   2    2
#  a  - b
