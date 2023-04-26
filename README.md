# -visual-stimulation-

使用matlab中ptb模块生成基本的视觉刺激。

环境：Matlab R2020a,Psychtoolbox 3.0.18

## 亮度刺激

生成随机亮度值的全屏幕亮度刺激，并以不同的时长呈现。

### 运行

运行程序```./Luminance/start.m```

### 参数

stim.trials：实验次数

## 静态光栅刺激

生成不同空间频率、不同朝向的静态光栅，并通过ptb模块随机现实至屏幕上。

### 运行

运行程序```./StaticGrating/start.m```  
stim_show_rest 在每次刺激之后添加休息

### 参数设置


#### start.m 

trials:实验试次  
cycleDuration：刺激持续时间  
interstimulusInterval：刺激间隔时间  

#### stim_showGrating.m

- 呈现光栅

numCycles：每个刺激连续呈现的次数
f:光栅的空间频率
orientations：光栅的朝向  

#### GenerateGrating.m

- 生成光栅

c:光栅的对比度  

生成的纹理默认是1920x1080分辨率的屏幕，如分辨率不同可以修改```[x, y] = meshgrid(-960:959,539:-1:-540);```中的参数。

