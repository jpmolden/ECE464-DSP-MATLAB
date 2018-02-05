function [ ] = FuncTesting( varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        

    n = 1;
    for n = 1:size(varargin,2)
            if varargin{n} == '/'
                display('slash')
                display(n-1)
            end
    end
    
    
    
    
% 
%     while n < size(varargin,2)
%         if n == 0
%             display('Hello')
%         end
%         if varargin{n} == '/'
%             display('slash')
%         end
%       n = n + 1;
%     end
    
display('Done')
end

