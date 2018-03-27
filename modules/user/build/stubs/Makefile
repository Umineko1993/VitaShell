ifdef VITASDK
PREFIX = $(VITASDK)/bin/
endif

ARCH ?= $(PREFIX)arm-vita-eabi
AS = $(ARCH)-as
AR = $(ARCH)-ar
RANLIB = $(ARCH)-ranlib

TARGETS = libVitaShellUser_stub.a
TARGETS_WEAK = libVitaShellUser_stub_weak.a

VitaShellUser_OBJS = VitaShellUser_VitaShellUserLibrary_shellUserIsUx0Redirected.o VitaShellUser_VitaShellUserLibrary_shellUserRedirectUx0.o VitaShellUser_VitaShellUserLibrary_shellUserUnredirectUx0.o VitaShellUser_VitaShellUserLibrary_shellUserMountById.o VitaShellUser_VitaShellUserLibrary_shellUserGetRifVitaKey.o
VitaShellUser_weak_OBJS = VitaShellUser_VitaShellUserLibrary_shellUserIsUx0Redirected.wo VitaShellUser_VitaShellUserLibrary_shellUserRedirectUx0.wo VitaShellUser_VitaShellUserLibrary_shellUserUnredirectUx0.wo VitaShellUser_VitaShellUserLibrary_shellUserMountById.wo VitaShellUser_VitaShellUserLibrary_shellUserGetRifVitaKey.wo
SceKernel_OBJS =
ALL_OBJS=

all: $(TARGETS) $(TARGETS_WEAK)

define LIBRARY_template
 $(1): $$($(1:lib%_stub.a=%)_OBJS)
 ALL_OBJS += $$($(1:lib%_stub.a=%)_OBJS)
endef
define LIBRARY_WEAK_template
 $(1): $$($(1:lib%_stub_weak.a=%)_weak_OBJS)
 ALL_OBJS += $$($(1:lib%_stub_weak.a=%)_weak_OBJS)
endef

$(foreach library,$(TARGETS),$(eval $(call LIBRARY_template,$(library))))
$(foreach library,$(TARGETS_WEAK),$(eval $(call LIBRARY_WEAK_template,$(library))))

install: $(TARGETS) $(TARGETS_WEAK)
	cp $(TARGETS) $(VITASDK)/arm-vita-eabi/lib
	cp $(TARGETS_WEAK) $(VITASDK)/arm-vita-eabi/lib

clean:
	rm -f $(TARGETS) $(TARGETS_WEAK) $(ALL_OBJS)

$(TARGETS) $(TARGETS_WEAK):
	$(AR) cru $@ $?
	$(RANLIB) $@

%.o: %.S
	$(AS) --defsym GEN_WEAK_EXPORTS=0 $< -o $@

%.wo: %.S
	$(AS) --defsym GEN_WEAK_EXPORTS=1 $< -o $@
