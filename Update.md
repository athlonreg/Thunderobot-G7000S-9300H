#### OpenCore更新记录

- 2020-04-13
	1. VoodooI2C更新到2.4版（VoodooInput集成到VoodooI2C插件中）

	2. 更新VirtualSMC全家桶

	3. 更新TPXX热补丁

	4. OpenCore更新到0.5.8自编译版

- 2020-04-07
	1. AppleALC更新到1.4.8官方发布版

	2. VoodooInput更新到1.0.4官方发布版（VoodooInput已经合并到VoodooPS2插件中）

	3. VoodooPS2更新到2.1.3官方发布版

	4. VoodooI2C更新到2.3官方发布版

	5. Lilu更新到1.4.3官方发布版

	6. WhateverGreen更新到1.3.8官方发布版

	7. VirtualSMC更新到1.1.2官方发布版

	8. NVMeFix更新到1.0.2

	9. 将CPUFriend和NoTouchID对接到Lilu 1.4.3新接口

	10. IntelBluetoothFirmware和IntelBluetoothInjector更新到1.0.3

	11. OpenCore更新到0.5.7官方发布版


- 2020-03-30
	1. 清除无用的ACPI文件。

	2. 修复更新Catalina 10.15.4后CPU变频失效的问题。


- 2020-03-25
	1. 更新GPI0中断和ACPI中断的TPXX热补丁，但APIC中断的问题仍然没有修复（不再修补，浪费时间），不建议使用APIC中断。(GPI0中断补丁和APIC中断补丁不能共存，开启GPI0时务必关闭APIC，APIC同理)

	2. 更新I2C相关驱动。


- 2020-03-23
	1. 将config.plst中的AppleALC仿冒layout-id更新为66，使声驱更稳定。

	2. 将config.plst中的TPXX热补丁与其相关补丁关闭。虽然使用TPXX可以让触控板获得APIC中断的体验，但是会让CPU和温度变得异常高，如果你需要它你可把它打开，但我不建议你这么干。

</br>

------------

</br>

#### Clover更新记录

- 2020-04-07
	1. Clover引导更新到5108版本
	2. 其它更新请参考OpenCore

- 2020-03-30: 请参阅OpenCore更新。