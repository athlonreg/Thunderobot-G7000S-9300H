#### 更新说明
`
目标MacOS : Catalina 10.15.4正式版（10.15.5 Beta4已经通过引导测试，理论上也可以用于引导之后的10.15.5正式版，或者比10.15.4正式版更低的版本）
`
- 2020-04-27：EFI已经趋于稳定，没什么大问题以后仅仅只更新官方的Release版驱动以及引导文件。

#### OpenCore更新记录

- 2020-05-05

    1. 更新OpenCore至0.5.8官方发布版
    2. 更新OpenCore GUI的资源
    3. ApfsDriverLoader模块集成到OpenCore中
    4. 配置中添加了关机ColdReset和WarmReset菜单
    5. 更新WhateverGreen至1.3.9
    6. 更新VoodooPS2至2.1.4
    7. 更新VoodooI2C至2.4.2
    8. 更新VoodooInput至1.0.5
    9. 更新VirtualSMC至1.1.3
    10. 更新Lilu至1.4.4
    11. 更新NVMeFix
    12. 更新AppleALC至1.4.9
    13. 更新CPUFriend
    14. 更新NoTouchID

- 2020-04-27

    1. 更新OC引导到4月27号开发版（详细更新内容请查看OC官方的git提交）
    2. 更新WhateverGreen到1.3.9自编译版本
    3. 更新VoodooPS2到2.1.4自编译版本
    4. 更新VoodooI2C到2.4.1自编译版本
    5. 更新VoodooInput到1.0.5自编译版本
    6. 更新VirtualSMC到1.1.3自编译版本
    7. 更新Lilu到1.4.4自编译版本
    8. 一些驱动更新到最新的官方发布版
    9. 移除掉一些不需要的ACPI热补丁

</br>

------------

</br>

#### Clover更新记录

- 2020-05-05

    1. 将CLOVER更新为5115
    2. 其它更新参考OpenCore部分

- 2020-04-27

    1. 更新CLOVER引导到5114版本
    2. 其它更新参考OpenCore部分