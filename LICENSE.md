相关开源代码的说明
administrator:

判断是否管理员模式运行

直接call，如果是管理员模式运行会将admin的值设为1.如果不是会将admin的值设置为2



network:

判断网络是否连接

call之后如果有连接network的值为1，如果无连接会将network的值设为2



gamemode:

要下载folder文件夹

用于检测CPU、内存等硬件实时状态

并生成实时报告



networkrn:

从内到外的网络检测，并生成详细报告

这块代码是以前的

后续会上个新的



learnning:

英语学习软件（支持听写和默写）



typing_test_install

用bat+wget实现的在线安装包

这个我老早之前的代码了，不知道有啥问题



cpuinfo:

获取CPU的信息

对应的变量值

变量cpuname:cpu名字

变量cpuspeed:主频

变量cpudescript:架构

变量cpuid:设备id

变量cputype:设备总类

变量cpucore:cpu核心数

变量cpul2cache:cpu二级缓存

变量cpuprocess:CPU线程数

变量cpul3cache:cpu三级缓存

用法：例如得到CPU名字

call cpuinfo

echo %cpuname%



gpuinfo:

获取GPU的信息

对应的变量值

变量gpuname=GPU名字               

变量gpucompany=GPU公司

变量minfresh=最小刷新率

变量minfresh=最大刷新率

变量currentfresh=当前刷新率

变量gpudriver=gpu驱动版本

变量drivedata=驱动日期

变量gpuram=显存大小

变量colorse=支持的分辨率和颜色

用法：例如得到GPU名字

call gpuinfo

echo %gpuname%



OSinfo:

获取OS的信息

对应的变量值

变量osname=名字

变量osversion=版本

变量debugmode=调试模式是否开启

变量memmemory=虚拟内存大小

变量memory=安装内存

变量freememory=可用内存

变量numberofuser=用户数

变量firectorsize=系统目录

变量systemstored=系统文件所占空间

其他文件夹都是支持运行的文件夹

用法：例如得到OS名字

call osinfo

echo %cpuname%
