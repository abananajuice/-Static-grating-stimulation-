# -visual-stimulation-

使用matlab中ptb模块生成基本的视觉刺激。

环境：Matlab R2020a,Psychtoolbox 3.0.18

## 静态光栅刺激

生成不同空间频率、不同朝向的静态光栅，并通过ptb模块随机现实至屏幕上。

## 运行

运行程序```./StaticGrating/start.m```


## 参数设置

### start.m 

trials:实验试次  
cycleDuration：刺激持续时间  
interstimulusInterval：刺激间隔时间  

### stim_showGrating.m

numCycles：每个刺激连续呈现的次数

### GenerateGrating.m

c:光栅的对比度
f:光栅的空间频率
orientations：光栅的朝向