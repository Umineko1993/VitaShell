.arch armv7a

.section .vitalink.fstubs.VitaShellKernel2Library,"ax",%progbits

	.align 4
	.global shellKernelMountById
	.type shellKernelMountById, %function
shellKernelMountById:
.if GEN_WEAK_EXPORTS
	.word 0x00000008
.else
	.word 0x00000000
.endif //GEN_WEAK_EXPORTS
	.word 0x81BBB7E2
	.word 0x070EF5D9
	.align 4

