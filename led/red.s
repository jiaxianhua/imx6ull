.global _start

_start:

@ GPIO1_IO4

@ 使能GPIO时钟 p700 26,27 bit = 1
@ CCM_CCGR1
ldr r0, =0x20c406c
ldr r1, =0xffffffff
str r1, [r0]

@ 设置引脚复用为GPIO p1572 0b0101=0x05
@ IOMUXC_SW_MUX_CTL_PAD_GPIO1_IO04
ldr r0, =0x20e006c
ldr r1, =0x05
str r1, [r0]

@ 设置引脚属性(上下拉、速率、驱动能力) p1795
@ IOMUXC_SW_PAD_CTL_PAD_GPIO1_IO04
ldr r0, =0x20e02f8
ldr r1, =0x10b0
str r1, [r0]

@ 控制GPIO引脚输出高低电平 output p1359, p1358
@ GPIOx_GDIR 1<<4
ldr r0, =0x0209c004
ldr r1, =0x10
str r1,[r0]

@ GPIOx_DR
ldr r0,=0x0209c000
ldr  r1, =0
str r1,[r0]
