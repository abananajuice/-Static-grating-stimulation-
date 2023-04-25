function stim_showGrating(trials,cycleDuration,interstimulusInterval)
% STIM_SHOWGRATING ��դ�̼�ʵ��


%% ��������
numCycles = 3; % �̼����ֵ�������
orientations = [0:30:150]; % �˶��ķ���
f = 0.04; % �ռ�Ƶ��
O_index = randperm(length(orientations));

len_oris = length(orientations);

%% ��Ļ����

screens           = Screen('Screens');
% ������ʵ��Ļ
screenNumber      = 2;
Screen('Preference', 'SkipSyncTests', 1);
[window,~] = Screen(screenNumber,'OpenWindow',0,[],[],2); % ����Ļ




black              = BlackIndex(window);
white              = WhiteIndex(window);
grey               = (white+black)/2;
Screen(window,'FillRect', grey);
Screen(window, 'Flip');

% ���ɴ̼�
grating = GenerateGrating(window,f,orientations);

%   object             = io64;
%   status             = io64(object);
%   io64(object,16424,0);
priorityLevel      = MaxPriority(window);
Priority(priorityLevel);
HideCursor;
%     config_io;

%% �̼�����


for t = 1:trials
    for i = 1:len_oris  %% �������Ŀ
        
        % ��ʾ�̼�
        for j = 1:numCycles
            
            %             for ss = 1:60*cycleDuration
            Screen('DrawTexture', window, grating(O_index(i)));
            Screen('Flip', window);
            WaitSecs(cycleDuration);
            %         io64(object,16424,1); % �趨���
            %         WaitSecs(0.0001);
            %         io64(object,16424,0);
            %             end
            % 60 ָ��Ļˢ����
            %             for ss = 1:60*interstimulusInterval
            % ��ʾ����
            Screen('FillRect', window, grey);
            Screen('Flip', window);
            WaitSecs(interstimulusInterval);
            %         io64(object,16424,1); % �趨���
            %         WaitSecs(0.0001);
            %         io64(object,16424,0);
            %         end
        end        
    end
end

% ����̼�����
Screen('Close', grating);
% �ر���Ļ
Screen('CloseAll');
