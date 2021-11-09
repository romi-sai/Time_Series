%***************************************
% Author Name: Romika Sairam
% Author Email: romikasa@buffalo.edu
% Course: CSE454 - CI for CEN
% Assignment: Time Series Project
% Date of Initial Creation: November 8, 2021
% Description of Program Purpose: This program loads the given dataset,
% preprocesses the data and performs various functions and classifications
% to it. 
%
% How the program works: This program loads the given dataset, preprocesses
% data by first finding the missing informations and removing the
% unnecessary data from the dataset. Preprocesses it further by normalizing
% the dataset. Then, calls on the PAA function to find the PAA
% representation of the given data. This program then performs various
% classifications on this data by pulling out the classes and printing
% them. 
%
% Functions and Modules in this file: No functions or modules are included
% in this file.
%
% Additional Required Files: None
%***************************************
clc
clear
% loading the given dataset
[x,y] = paa_s1('synthetic_control.data')
% Preprocessing data by picking the missing information and removing them. 
for i=1:x
    if i(1)==0
        x(i,:)=[]
    end
end

% loading the given dataset
load("synthetic_control.data");
% Preprocessing data by normalizing the given dataset.
synthetic_control(1,:)=[];
normal=normalize(synthetic_control,"zscore")

plotting the time series data
[r,c] = size(synthetic_control)
time = 1:r;
plot(time, synthetic_control)
title('Regular Representation of the given data')

%calling on the paa function 
paa = paagen(60,synthetic_control)

%pull classes - Classification begins
class = synthetic_control(:,1);
classFree=synthetic_control(1,:)
classFree(:,1)
% pulls out how many observations there are in each series.
m=length(classFree)
t=linspace(100,1,m)
plot(t,classFree)
classF=synthetic_control