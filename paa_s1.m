%***************************************
% Author Name: Romika Sairam
% Author Email: romikasa@buffalo.edu
% Course: CSE454 - CI for CEN
% Assignment: Time Series Project
% Date of Initial Creation: November 8, 2021
% Description of Program Purpose: This programs loads the data. 
%
% How the program works: This program loads the given dataset into an [x,y]
% coordinate system. It is called in the time_series.m file which also
% serves as the main function for this project.
%
% Functions and Modules in this file: paa_s1 function in included in this file.
%
% Additional Required Files: None
%***************************************
function [x,y] = paa_s1(name)
    x = load(name)
    y = 27;
end 