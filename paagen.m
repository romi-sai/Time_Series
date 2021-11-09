%***************************************
% Author Name: Romika Sairam
% Author Email: romikasa@buffalo.edu
% Course: CSE454 - CI for CEN
% Assignment: Time Series Project
% Date of Initial Creation: November 8, 2021
%
% Description of Program Purpose: This program takes in the input data and
% performs PAA on the given dataset.
%
% How the program works: This program performs PAA by dividing the data
% into windows to represent the piecewise functions, then checks each of
% the observations/samples, and stores the correct samples that lie in each
% of the window ranges. 
%
% Functions and Modules in this file: paa function.
%
% Additional Required Files: None
%***************************************
function paa=paagen(c,data)
    %This function calculates the PAA for each of the piecewise functions
    %within the given dataset. 
    
   % extracts the size of the data given.
   s=size(data);
    % dt extracts the columns from the given data, to go through each of the
    % observations. 
    dt=s(2);
    % length of the segment is delta t divided by the overall duration.
    ln=dt/c;
    % ceil function is used to round up the windows. 
    ln=ceil(ln);
    % goes through each sample and processes the data. 
    for i=1:s(1)
        % for loop goes through each of the windows.
        for N=1:c
            % empty vector.
            sam=[];
            % counter.
            samCnt=1;
            % see if we need to extract samples. 
            % check if we are in the big window, then check if we are in the
            % little window.
            if (N-1)*ln<s(2)
                % lowerbound is the little window.
                bl=(N-1)*ln;
                % upperbound is the big window.
                bu=N*ln;
                % if the observation is inside the observation window. 
                for j=1:s(2)
                    % checking if the observation is between the lower and the
                    % upperbounds. 
                    if j>bl
                        if j<= bu
                            % this means that the sample is in the window.
                            % storing the sample by storing the data piece at
                            % the right index.
                            sam(samCnt)=data(i,j);
                            % increase the counter to accurate describe the
                            % number of samples. 
                            samCnt=samCnt+1;
                        end
                    end
                end
            end
            % takes in all of the samples, and takes the mean and stores
            % for that specific piece. 
            paa(i,N)=mean(sam);
        end
    end
    % plotting
    i=2;
    % vectors of observations
    paax=[];
    paay=[];
    z=1;
    n=1;
    % translating data pieces into spot that can be plotted.
    % initial observations.
    paax(z)=0;
    paay(z)=paa(i,n);
    % increments
    z=z+1;
    % go through each sample
    for n=2:c
        paax(z)=paax(z-1)+ln;
        paay(z)=paa(i,n-1);
        z=z+1;
        paax(z)=paax(z-1);
        paay(z)=paa(i,n);
        z=z+1;
    end
    plot(paax,paay);
    hold on
    t=linspace(0,s(2),s(2));
    scatter(t,data(i,:),"filled")
    title('PAA Representation of the given data')


end

