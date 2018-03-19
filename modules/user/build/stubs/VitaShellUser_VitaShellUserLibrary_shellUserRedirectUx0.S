.arch armv7a

.section .vitalink.fstubs.VitaShellUserLibrary,"ax",%progbits

	.align 4
	.global shellUserRedirectUx0
	.type shellUserRedirectUx0, %function
shellUserRedirectUx0:
.if GEN_WEAK_EXPORTS
	.word 0x00000008
.else
	.word 0x00000000
.endif //GEN_WEAK_EXPORTS
	.word 0xB07DBDD0
	.word 0x8B2C59BB
	.align 4

