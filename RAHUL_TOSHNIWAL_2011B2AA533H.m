% The following program implements arithmetic encoding for alphanumeric
% input. The same can be extended to include special characters as well.

%Note- whenever any 2 or more characters have same probabilty, then the
%order of encoding is decided based on the sequence given in variable b.
%The character that appears first in the variable b is taken first and so
%on..
% The input alphabets are required to be in lowercase

%Author- Rahul Toshniwal
%Id. No.- 2011B2AA533H

% Using long format for more precision
format long;

%taking user input
clc;
clear all;
t = input('enter the sequence to be coded: ', 's');

%calculating the number of times a particular character appears in the
%sequence
a(1) = numel( find(t == 'a') ) ;
a(2) = numel( find(t == 'b') ) ;
a(3) = numel( find(t == 'c') );
a(4) = numel( find(t == 'd') );
a(5) = numel( find(t == 'e') );
a(6) = numel( find(t == 'f') );
a(7) = numel( find(t == 'g') );
a(8) = numel( find(t == 'h') );
a(9) = numel( find(t == 'i') );
a(10) = numel( find(t == 'j') );
a(11) = numel( find(t == 'k') );
a(12) = numel( find(t == 'l') );
a(13) = numel( find(t == 'm') );
a(14) = numel( find(t == 'n') );
a(15) = numel( find(t == 'o') );
a(16) = numel( find(t == 'p') );
a(17) = numel( find(t == 'q') );
a(18) = numel( find(t == 'r') );
a(19) = numel( find(t == 's') );
a(20) = numel( find(t == 't') );
a(21) = numel( find(t == 'u') );
a(22) = numel( find(t == 'v') );
a(23) = numel( find(t == 'w') );
a(24) = numel( find(t == 'x') );
a(25) = numel( find(t == 'y') );
a(26) = numel( find(t == 'z') );
a(27) = numel( find(t == '1') );
a(28) = numel( find(t == '2') );
a(29) = numel( find(t == '3') );
a(30) = numel( find(t == '4') );
a(31) = numel( find(t == '5') );
a(32) = numel( find(t == '6') );
a(33) = numel( find(t == '7') );
a(34) = numel( find(t == '8') );
a(35) = numel( find(t == '9') );
a(36) = numel( find(t == '0') );

% Defining a sequence that will help encoding when characters have same
% probability
b='abcdefghijklmnopqrstuvwxyz1234567890';

len=length(t);
j=0;

%calculating probability
for i=1:1:36
     
    if(a(i)~=0)
       
        prob(i)=a(i)/len;
        j=j+1;
    else prob(i)=0;
   
    end
end

% sorting prob in descending order
[sorted_prob,y]= sort(prob,'descend');

string(1)=0;

%making 0 to 1 scale
for i=2:1:j+1
   
 string(i)=(string(i-1)+sorted_prob(i-1));
end
string_initial=string;

%assigning alphabets with decreasing prob to scale
for i=1:1:j
string_char(i)=b(y(i));
end


% applying arithmetic encoding, final interval is between final values of x1 and x2
for i=1:1:length(t)
    
    for k=1:1:length(string_char)
        if(t(i)==string_char(k))
          x2(i)=string(k+1);
          x1(i)=string(k);
          
        end
    end
    string(1)=x1(i);
    string(length(string))=x2(i);
    
   for l=2:1:length(string)-1
        string(l)=(string(length(string))-string(1))*string_initial(l)+string(1);
   end
end

% since code can be any number in the final interval, we choose the avg value
   
    final_code_decimal=(x1(length(x1))+x2(length(x2)))/2;
   

% converting the decimal part to binary
FC1=(num2str(final_code_decimal));
FC1(2)=0;
FC1(1)=0;

FC_bin=de2bi(str2num(FC1));
FC_in_binary=fliplr(num2str(FC_bin));


%displaying final output in decimal as well as the binary format of the
%fractional part

disp( final_code_decimal);

disp(FC_in_binary);










