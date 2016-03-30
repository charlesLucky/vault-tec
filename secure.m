function vault = secure(key,points)
% SECURE() takes a key of 512 bits (32 ASCII) and a
% set of points of the form { x } stored in a field
% of order GF(2^16) and locks it in a fuzzy vault,
% returning a set of points called `vault` of the form
% vault = { x,y }.
% PARAMETERS:
%	key    --- 256b (32 ascii) string
%	points --- column vector of arbitrary length stored
%			   inside a GF(2^16) array.

addpath('./src/');

% work over GF(2^16):
FIELD = 16;

% number of chaff points to generate:
NUM_CHAFFS = 30;

% degree of polynomial
DEGREE = 35;

% ===== 1. Generate a polynomial from the key: =====
% inputs: key, field, degree of polynomial
pol = genPoly(key,FIELD,DEGREE);

% ===== 2. Project the points through the polynomial: =====
% make sure that `points` exists inside of a GF(2^FIELD) array:
% FINISH THIS

% form projected points:
projection = projectPointSet(points,pol,FIELD);

% ===== 3. Mix up the projected points with chaff points: =====
vault = mixChaffs(projection,NUM_CHAFFS,FIELD,1);

end