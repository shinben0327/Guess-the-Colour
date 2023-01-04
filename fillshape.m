% Create a function to fill shapes
% Jihwan Shin

function fillshape(shape, colour)
%FILLSHAPE Fills the given shape
%   Fill the input shape given the matrix of the path around its outside

% Extract x and y coordinates
x = shape(1,:);
y = shape(2,:);

% Fills the shape
fill(x, y, colour)

end
