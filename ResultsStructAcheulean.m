%initialise structure to store results.
%expected number of participants
n=1;%not super clear how n=10, it seems to only do one trial? 
pauseframe2=[1,456,864,1320,1728,2328,3048,3816,4224,4656,5088,5448,6192,6888,7368,7584,7848];
%Remove string function if ID and group are not strings

BigArray=zeros(n,3+2*length(pauseframe2));
time=[1 1 1];
num=1;
filename3='Acheulean 10x.mp4'
filename4='Acheulean_Crane_Compressed.mov'
save('results.mat','BigArray','pauseframe2','filename3','filename4')
%%
load('results.mat')
answer=askprompt();
%function call to give time would go here
Instructions
BigBoi(filename3,1);%change filename to actual speeded up vid
Time=BigBoi(filename4,pauseframe2);

BigArray(num,1)=answer(1);
BigArray(num,2)=answer(2);
BigArray(num,3)=answer(3)
BigArray(num,4:length(pauseframe2)+3)=Time(:);
%BigArray(num,3+length(pauseframe):2+length(pauseframe)*2)=Time2(:);

num=num+1;
save('results.mat','BigArray')

time=array2table(BigArray);
 writetable(time,'test.xlsx');