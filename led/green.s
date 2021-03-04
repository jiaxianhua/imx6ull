.global _start

_start:

@ CSI_HSYNC GPIO4_IO20

@ 1. 使能GPIO时钟 p704 12, 13 bit = 1
@ CCM_CCGR3
ldr r0, =0x20c4074
ldr r1, =0xffffffff
str r1, [r0]

@ 2. 设置引脚复用为GPIO p1665 0b0101=0x05
@ IOMUXC_SW_MUX_CTL_PAD_CSI_HSYNC
ldr r0, =0x20e01e0
ldr r1, =0x05
str r1, [r0]

@ 3. 设置引脚属性(上下拉、速率、驱动能力) p1981
@ 32.6.250 SW_PAD_CTL_PAD_CSI_HSYNC SW PAD Control
@ Register (IOMUXC_SW_PAD_CTL_PAD_CSI_HSYNC)
ldr r0, =0x20e046c
ldr r1, =0x10b0
str r1, [r0]

@ 4. 控制GPIO引脚输出高低电平 output p1359, p1358
@ 4.1 GPIOx_GDIR 1<<20
ldr r0, =0x020a8004
ldr r1, =0x100000
str r1,[r0]

@ 4.2 GPIOx_DR
ldr r0,=0x020a8000
ldr  r1, =0x00
str r1,[r0]
