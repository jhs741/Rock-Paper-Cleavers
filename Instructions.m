function Instructions()
    message={'Thank you for taking part in this pilot! Before you is an origami model, you will be asked to recreate this as accurately and quickly as you can from the blank base provided. You can refer to the exemplar at any time. You will first be shown a demonstration video of this origami model being constructed at high speed. Pay careful attention to how the shape evolves towards the end product. You will then be shown the video at normal speed, in segmented steps. Follow along with each step of the video, but DO NOT go ahead of the video. Between each step, there will be a pause, along with a black screen. Use this time to catch up with the current step in the video if you need to (e.g. completing the origami step in your own model) if needed. Pressing the space bar will initiate the next segment of video. Bear in mind that you cannot go back, so it is a good idea to make sure you have caught up before continuing. While speed is important, so is accuracy! However, each time the black screen shows, the timer starts, and you are penalised for taking longer! You may stop the pilot at any point for any reason, though this will render you unusable as a pilot. Please ask any questions before we begin. Pressing ok will begin the task.'};
    Title='Instructions';
    %uiwait(msgbox(message,Title));




mh = msgbox(message, Title);                         %create msgbox
th = findall(mh, 'Type', 'Text');                   %get handle to text within msgbox
th.FontSize = 20;                                   %Change the font size
deltaWidth = sum(th.Extent([1,3]))-mh.Position(3) + th.Extent(1);
deltaHeight = sum(th.Extent([2,4]))-mh.Position(4) + 10;
mh.Position([3,4]) = mh.Position([3,4]) + [deltaWidth, deltaHeight];
uiwait(mh)

end