function stim_showGrating(trials,cycleDuration,interstimulusInterval)
% stim_showGrating
% ��դ�̼�ʵ��


%% ��������
numCycles = 3; % �̼����ֵ�������
orientations = [0:30:150]; % �˶��ķ���
f = 0.04; % �ռ�Ƶ��
% O_index = randperm(length(orientations));
O_index = [1:length(orientations)];
phase = [0:10:360];  % ͨ���ı���λʵ�ֹ�դƯ��

%% ���ɱ�ǩ���������
len_oris = length(orientations);
label = zeros(numCycles*len_oris*trials,2);

label(:,2) = f;
i_ori = 1;

for t = 1:trials
    for i = 1:len_oris  %% �������Ŀ
        
        % ��ʾ�̼�
        for j = 1:numCycles
            label(i_ori,1) = orientations(O_index(i));
            i_ori=i_ori+1;
        end
    end
end

save("label"+datestr(now,30)+".mat",'label');

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

%% ���ɴ̼�
disp('���ɴ̼���...');
grating = GenerateGrating(window,f,orientations,phase);
fprintf('���ɴ̼��ɹ�');

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
            for p_i = 1:length(phase)
            
            Screen('DrawTexture', window, grating(O_index(i),p_i));
            Screen('Flip', window);
%             WaitSecs(0.1);

            end
            
            Screen('FillRect', window, grey);
            Screen('Flip', window);
            WaitSecs(interstimulusInterval);
        end        
    end
end

% ����̼�����
Screen('Close', grating);
% �ر���Ļ
Screen('CloseAll');
