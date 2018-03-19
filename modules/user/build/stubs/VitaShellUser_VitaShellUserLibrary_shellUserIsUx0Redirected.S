.arch armv7a

.section .vitalink.fstubs.VitaShellUserLibrary,"ax",%progbits

	.align 4
	.global shellUserIsUx0Redirected
	.type shellUserIsUx0Redirected, %function
shellUserIsUx0Redirected:
.if GEN_WEAK_EXPORTS
	.word 0x00000008
.else
	.word 0x00000000
.endif //GEN_WEAK_EXPORTS
	.word 0xB07DBDD0
	.word 0x1E3A154B
	.align 4

