% Generates a random rgb and returns it as an array (and a string)
% Jihwan Shin

function [rgbarray,rgbstring] = rgbgen()
%RGBGEN Generates a random rgb and returns it as an array (and a string)
%   R, G, B values are generated between 0 and 255. For use in some Matlab
%   functions, these may need to be divided by 255 to make a RGB triplet.

% Generates an array with three random values in range [0, 255]
rgbarray = randi([0 255],1,3);

% Combines into a string of the form "R,G,B"
rgbstring = append(int2str(rgbarray(1)),",",int2str(rgbarray(2)),",",int2str(rgbarray(3)));

end
