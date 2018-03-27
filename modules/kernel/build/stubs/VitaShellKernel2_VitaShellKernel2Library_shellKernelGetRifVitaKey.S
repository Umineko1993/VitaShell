.arch armv7a

.section .vitalink.fstubs.VitaShellKernel2Library,"ax",%progbits

	.align 4
	.global shellKernelGetRifVitaKey
	.type shellKernelGetRifVitaKey, %function
shellKernelGetRifVitaKey:
.if GEN_WEAK_EXPORTS
	.word 0x00000008
.else
	.word 0x00000000
.endif //GEN_WEAK_EXPORTS
	.word 0x81BBB7E2
	.word 0xA28967DA
	.align 4

