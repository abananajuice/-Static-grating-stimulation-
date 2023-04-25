  function stim_show2(stim)
%STIM_SHOW2 亮度刺激实验随机亮度和随机频率出现


trials=stim.trials;%%重复次数

%% 生成刺激模式

    % To do:向偶数舍入
    times = [5 15 50 100];
    luminaries = round( rand(1,trials) * 255); 
    time_index = round( rand(1,trials) * 3 +1);
    save("luminaries_restnone.mat",'luminaries');
    time_cumsum = [];
    for i = 1:trials
        time_cumsum(i) = times(time_index(i));
    end
    
    time_cumsum = cumsum(time_cumsum);
    save("time_restnone.mat",'time_cumsum');
 
%% 屏幕配置

    screens           = Screen('Screens');
    screenNumber      = max(screens);
    Screen('Preference', 'SkipSyncTests', 1);
    [window,windowRect] = Screen(screenNumber,'OpenWindow',0,[],[],2); % 打开屏幕
    WaitSecs(.05);
    

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
    
    %config_io;%%放在哪个位置
%% 显示

    for j = 1:trials  %%% 实验总次数
              
        for k = 1:times(time_index(j))                  
            Screen(window,'FillRect', luminaries(j)); %% 以不同的亮度填充屏幕
            Screen(window, 'Flip');   % 将缓冲屏刷新到屏幕上
%              io64(object,16424,1); % 设定打标
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
.
    Priority(0);
    frameRate=1/median(s1Diffs);
    frames1=sum(s1Diffs)*frameRate-length(s1Diffs);

    sca;
    if round(frames1)==0
        T=sprintf('Success! The movie was shown twice. Both showings were frame-accurate.');
    else
        T=sprintf('The movie was shown twice, running over by %.0f frames in the first .',frames1);
    end
    fprintf('%s\n',WrapString(T));



end

