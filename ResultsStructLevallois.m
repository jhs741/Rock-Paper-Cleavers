%initialise structure to store results.
%expected number of participants
n=1;%not super clear how n=10, it seems to only do one trial? 
pauseframe=[1,469,1068,1537,2032,2579,3022,3595,4194,4741,5444,6174,6539,6877,7320,7789,8414];
%Remove string function if ID and group are not strings

BigArray=zeros(n,3+2*length(pauseframe));
time=[1 1 1];
num=1;
filename1='Levallois 10x.mp4'
filename2='Levallois_Box_Compressed2.mov'
save('results.mat','BigArray','pauseframe','filename1','filename2')
%%
load('results.mat')
answer=askprompt();
%function call to give time would go here
Instructions
BigBoi(filename1,1);%change filename to actual speeded up vid
Time=BigBoi(filename2,pauseframe);

BigArray(num,1)=answer(1);
BigArray(num,2)=answer(2);
BigArray(num,3)=answer(3)
BigArray(num,4:length(pauseframe)+3)=Time(:);
%BigArray(num,3+length(pauseframe):2+length(pauseframe)*2)=Time2(:);

num=num+1;
save('results.mat','BigArray')

time=array2table(BigArray);
 writetable(time,'test.xlsx');