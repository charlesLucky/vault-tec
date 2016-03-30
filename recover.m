function key = recover(vault,points)
% RECOVER() takes a secure vault of the form { (x,y) }
% and a set of points of the form { p }, and proceeds
% to recover a polynomial [ c0 c1 ... cN ] from the
% vault; it then turns the polynomial into a key.
% PARAMETERS:
%	vault  --- N x 2 matrix over GF(2^FIELD)
%   points --- M x 1 matrix over GF(2^FIELD)
%

% add path to src folder:
addpath('./src/');

% work over GF(2^16):
FIELD = 16;

% specify degree of polynomial:
DEGREE = 35;

% ===== 1. Recover polynomial from vault: =====
polynom = recoverPoly2(points,vault,FIELD,DEGREE);

% ===== 2. Recover key from polynomial: =====
key = keyFromPoly(polynom,FIELD);

end