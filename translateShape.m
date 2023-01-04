% Create a function to translate shapes
% Jihwan Shin

function shapeT = translateShape(shape,a,b)
%TRANSLATESHAPE Translates a given shape
%   Translates the shape to the right by a and up by b

% Extract x and y coordinates
x = shape(1,:); 
y = shape(2,:); 

% Perform translation on x and y coordinates
xT = x + a;  
yT = y + b;  

% Create the new translated matrix
shapeT = [xT ; yT]; 

end
