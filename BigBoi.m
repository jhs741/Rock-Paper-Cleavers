function Time=BigBoi(filename,pauseframe)

  % answer=askprompt()%%dialogue box for input
  %ResultsStruct
  %%something about results 
   
   %%Instructions=msgbox()
    
   %untitled09
   
    v = VideoReader(filename);
    index=1;
    pauseframe=[pauseframe,0];
    Time=zeros(length(pauseframe)-1,1);
    testFrame=readFrame(v);
    w=size(testFrame,2);
    h=size(testFrame,1);
    s=get(0,'ScreenSize');
    
    figure('MenuBar', 'none','ToolBar', 'none',...
              'BusyAction','cancel',...
              'CloseRequestFcn', @locClosefcn,...
              'NumberTitle','off','Name','none',...
               'Position', [s(3)/2-w/2,s(4)/2-h/2,s(3)/2+w/2,s(4)/2+h/2]*0.75);%scale here

    currAxes = gca;
    bKillAll=0;
    while hasFrame(v) && ~bKillAll
        CurrentFrame=round(v.CurrentTime*v.FrameRate);
        if CurrentFrame==pauseframe(index)
            T=tic;
            index=index+1;
            currkey=0;
            imagesc(zeros(h*2,w*2,3));%make this match the real video, currAxes might work but if not remove
            currAxes.Visible = 'off';
            % do not move on until enter key is pressed
            while currkey~=1 && ~bKillAll
                try
                    waitforbuttonpress; % wait for a keypress
                    currkey=get(gcf,'CurrentKey'); 
                if strcmp(currkey, 'space') % You also want to use strcmp here.
                    currkey=1; 
                    Time(index-1)=toc(T);

                else
                    currkey=0; 
                end
                catch

                end

            end
        end
        if bKillAll==1
            break
        end

        vidFrame = readFrame(v);
        t0=tic;
        imagesc(vidFrame, 'Parent', currAxes);
        currAxes.Visible = 'off';
        tf=toc(t0);
        pause(1/v.FrameRate-tf);
    end
    
function locClosefcn(~,~)
    bKillAll = 1;
    delete(gcf);

    
    
end     
end
