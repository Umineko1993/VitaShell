# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake.exe

# The command to remove a file.
RM = /usr/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yusk5/VitaShell/modules/kernel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yusk5/VitaShell/modules/kernel/build

# Include any dependencies generated for this target.
include CMakeFiles/kernel.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/kernel.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kernel.dir/flags.make

CMakeFiles/kernel.dir/main.c.obj: CMakeFiles/kernel.dir/flags.make
CMakeFiles/kernel.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yusk5/VitaShell/modules/kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/kernel.dir/main.c.obj"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/kernel.dir/main.c.obj   -c /home/yusk5/VitaShell/modules/kernel/main.c

CMakeFiles/kernel.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kernel.dir/main.c.i"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yusk5/VitaShell/modules/kernel/main.c > CMakeFiles/kernel.dir/main.c.i

CMakeFiles/kernel.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kernel.dir/main.c.s"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yusk5/VitaShell/modules/kernel/main.c -o CMakeFiles/kernel.dir/main.c.s

CMakeFiles/kernel.dir/main.c.obj.requires:

.PHONY : CMakeFiles/kernel.dir/main.c.obj.requires

CMakeFiles/kernel.dir/main.c.obj.provides: CMakeFiles/kernel.dir/main.c.obj.requires
	$(MAKE) -f CMakeFiles/kernel.dir/build.make CMakeFiles/kernel.dir/main.c.obj.provides.build
.PHONY : CMakeFiles/kernel.dir/main.c.obj.provides

CMakeFiles/kernel.dir/main.c.obj.provides.build: CMakeFiles/kernel.dir/main.c.obj


# Object files for target kernel
kernel_OBJECTS = \
"CMakeFiles/kernel.dir/main.c.obj"

# External object files for target kernel
kernel_EXTERNAL_OBJECTS =

kernel: CMakeFiles/kernel.dir/main.c.obj
kernel: CMakeFiles/kernel.dir/build.make
kernel: CMakeFiles/kernel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yusk5/VitaShell/modules/kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable kernel"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kernel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kernel.dir/build: kernel

.PHONY : CMakeFiles/kernel.dir/build

CMakeFiles/kernel.dir/requires: CMakeFiles/kernel.dir/main.c.obj.requires

.PHONY : CMakeFiles/kernel.dir/requires

CMakeFiles/kernel.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kernel.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kernel.dir/clean

CMakeFiles/kernel.dir/depend:
	cd /home/yusk5/VitaShell/modules/kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yusk5/VitaShell/modules/kernel /home/yusk5/VitaShell/modules/kernel /home/yusk5/VitaShell/modules/kernel/build /home/yusk5/VitaShell/modules/kernel/build /home/yusk5/VitaShell/modules/kernel/build/CMakeFiles/kernel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kernel.dir/depend

