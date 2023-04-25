  function stim_show_rest(stim)
%STIM_SHOW2 ���ȴ̼�ʵ�飬����ÿ�δ̼�֮�������Ϣ

trials=stim.trials;%%�ظ�����
one_color_time=stim.one_color_time;

%% ���ɴ̼�ģʽ


    % To do:��ż������
    times = [5 15 50 100];
    luminaries = round( rand(1,trials) * 255); 
    time_index = round( rand(1,trials) * 3 +1);
    save("sequence_restnone.mat",'luminaries');
    time_cumsum = [];
    for i = 1:trials
        time_cumsum(i) = times(time_index(i));
    end
    
    time_cumsum = cumsum(time_cumsum);
    save("time_restnone.mat",'time_cumsum');
    
%% ��Ļ����



    screens           = Screen('Screens');
    screenNumber      = max(screens);
    Screen('Preference', 'SkipSyncTests', 1);
    [window,windowRect] = Screen(screenNumber,'OpenWindow',0,[],[],2); % ����Ļ
    WaitSecs(.05);
    
% Show the movie, first forwards, then backwards.  We don't need offscreen
    % windows as in OS 9.  FillOval is now fast enough to draw ovals during the
    % animation.
    black              = BlackIndex(window);
    white              = WhiteIndex(window);
    grey               = (white+black)/2;
    Screen(window,'FillRect', grey);
    

    WaitSecs(2); 
    t                  = 0;
%     object             = io64;
%     status             = io64(object);
%     io64(object,16424,0);
    priorityLevel      = MaxPriority(window);   
    Priority(priorityLevel);
    HideCursor;
    s                  = [];
    
    %config_io;%%�����ĸ�λ��
%% ��ʾ

    for j = 1:trials  %%% ʵ���ܴ���
              
        for k = 1:times(time_index(j))   %%ON%%%����ʵ��ON/OFF�ظ�����                 
            Screen(window,'FillRect', luminaries(j)); %% �Բ�ͬ�����������Ļ
            Screen(window, 'Flip');   % ��������ˢ�µ���Ļ��
%              io64(object,16424,1); % �趨���
%              WaitSecs(0.0001);
%              io64(object,16424,0);
        end
        
        for r = 1:12
             Screen(window,'FillRect', black);
             Screen(window, 'Flip'); 
%              io64(object,16424,1); % �趨���
%              WaitSecs(0.0001);
%              io64(object,16424,0); 
        end
        
    end

   
    Screen(window,'FillRect', grey );
    Screen(window, 'Flip');
    ShowCursor;
    s1Diffs            = diff(s);
    sound(sin(2*pi*25*(1:4000)/100))
    while true 
        [locx,locy,buttons,focus]= GetMouse(window);
        if buttons(3)
            break;
        end
    end
    %this is strange, raising the priority seems to cause the first call to
    %flip to return immediatly.  Needs investigation.
    Priority(0);
    frameRate=1/median(s1Diffs);
    frames1=sum(s1Diffs)*frameRate-length(s1Diffs);
    % Close the on- and off-screen windows
    sca;
    if round(frames1)==0
        T=sprintf('Success! The movie was shown twice. Both showings were frame-accurate.');
    else
        T=sprintf('The movie was shown twice, running over by %.0f frames in the first .',frames1);
    end
    fprintf('%s\n',WrapString(T));
    %savemat(PATHFile,trials,stim_ser);
% catch
%     %this "catch" section executes in case of an error in the "try" section
%     %above.  Importantly, it closes the onscreen window if its open.
%     sca;
%     ShowCursor;
%     Priority(0);
%     psychrethrow(psychlasterror);
% end % try..catch


end

