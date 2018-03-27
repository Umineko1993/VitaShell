.arch armv7a

.section .vitalink.fstubs.VitaShellUserLibrary,"ax",%progbits

	.align 4
	.global shellUserGetRifVitaKey
	.type shellUserGetRifVitaKey, %function
shellUserGetRifVitaKey:
.if GEN_WEAK_EXPORTS
	.word 0x00000008
.else
	.word 0x00000000
.endif //GEN_WEAK_EXPORTS
	.word 0xB07DBDD0
	.word 0x3F50FEAC
	.align 4

