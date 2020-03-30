#### OpenCore更新记录

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

#### OpenCore更新记录

- 2020-03-30: 请参阅OpenCore更新。