function grating = GenerateGrating(window,f,orientations,phase)
% GenerateGrating 
% 生成漂移光栅矩阵并制作成纹理

    c = 0.95;  % 对比度
    
    [x, y] = meshgrid(-960:959,539:-1:-540);
    
    
    
    for i = 1:length(orientations)
        for p_i = 1:length(phase)
        
        t = orientations(i)*pi/180; % 调节角度
        M1 =uint8(127*(1 + c*sin(2.0*pi*f*(y*sin(t) + x*cos(t))+ phase(p_i) * pi / 180)));
        
        % 另一种表示方法
        % M1 =uint8(127*(1 + c*sin(2.0*pi*f*(x+y))));
        
        grating(i,p_i) = Screen('MakeTexture', window, M1);
        end 
    end
    
%     save("grating.mat",'grating');
    
% end
end