#### 重要的更新说明
```
引导的目标系统版本：适用于MacOS Catalina 10.15.5/4/3/2/1/0正式版，10.14.X以及10.13.X未经测试

其它说明：由于本机OpenCore引导已经较为完善，且出于各种原因，经过慎重考虑后决定以后将不再对本机的Clover引导提供更新支持

关于蓝牙无法加载或引导进系统慢/卡进度的问题：
    有可能是蓝牙驱动（IntelBluetoothFirmware.kext和IntelBluetoothInjector.kext）导致的，
    1.0.3的蓝牙驱动使用了新的依赖固件，如果你遇到了蓝牙无法加载或进系统慢/卡进度等问题，
    可以尝试回退蓝牙驱动版本（蓝牙驱动：https://github.com/zxystd/IntelBluetoothFirmware/releases）。
```
- 2020-04-27：EFI已经趋于稳定，没什么大问题以后仅仅只更新官方的Release版驱动以及引导文件。

- 2020-05-05：AppleALC 1.4.9官方发布版合并了我提交的 [Thunderobot G7000S 定制声卡（layout-id为77）](https://github.com/acidanthera/AppleALC/releases/1.4.9)

#### OpenCore更新记录

- 2020-06-04
    1. 更新OpenCore至0.5.9官方发布版
    2. 更新Lilu至1.4.5
    3. 更新WhateverGreen至1.4.0
    4. 更新VoodooPS2至2.1.5
    5. 更新VoodooI2C至2.4.2
    6. 更新VoodooInput至1.0.6
    7. 更新VirtualSMC至1.1.4
    8. 更新AppleALC至1.5.0
    9. 更新VirtualSMC至1.1.4

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
