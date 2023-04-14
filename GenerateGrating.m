function grating = GenerateGrating(window)
%GENERATEGRATING 生成光栅矩阵并制作成纹理

    c = 0.95;  % 对比度
    f = 0.25; % 空间频率
    
    orientations = [0:30:150];
    O_index = randperm(length(orientations));
    
   
    [x, y] = meshgrid(-960:959,539:-1:-540);

    s= 24;
    
    for i = 1:length(orientations)
        
        t = orientations(O_index(i))*pi/180; % 调节角度
        % M1 =uint8(127*(1 + c*sin(2.0*pi*f*(y*sin(t) + x*cos(t)))));
        M1 =uint8(127*(1 + c*sin(2.0*pi*f*(x+y))));
        
        grating(i) = Screen('MakeTexture', window, M1);
    end
end