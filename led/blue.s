.global _start

_start:

@ CSI_VSYNC GPIO4_IO19

@ 1. 使能GPIO时钟 p704 12, 13 bit = 1
@ CCM_CCGR3
ldr r0, =0x20c4074
ldr r1, =0xffffffff
str r1, [r0]

@ 2. 设置引脚复用为GPIO p1665 0b0101=0x05
@ IOMUXC_SW_MUX_CTL_PAD_CSI_VSYNC
ldr r0, =0x20e01dc
ldr r1, =0x05
str r1, [r0]

@ 3. 设置引脚属性(上下拉、速率、驱动能力) p1981
@ 32.6.250 SW_PAD_CTL_PAD_CSI_VSYNC SW PAD Control
@ Register (IOMUXC_SW_PAD_CTL_PAD_CSI_VSYNC)
ldr r0, =0x20e0468
ldr r1, =0x10b0
str r1, [r0]

@ 4. 控制GPIO引脚输出高低电平 output p1359, p1358
@ 4.1 GPIOx_GDIR 1<<19
ldr r0, =0x020a8004
ldr r1, =0x80000
str r1,[r0]

@ 4.2 GPIOx_DR
ldr r0,=0x020a8000
ldr  r1, =0x00
str r1,[r0]
