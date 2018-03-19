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

# Utility rule file for kernel.skprx.

# Include the progress variables for this target.
include CMakeFiles/kernel.skprx.dir/progress.make

CMakeFiles/kernel.skprx: kernel.velf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yusk5/VitaShell/modules/kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Creating SELF kernel.skprx"
	/usr/local/vitasdk/bin/vita-make-fself -c kernel.velf kernel.skprx

kernel.velf: kernel
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yusk5/VitaShell/modules/kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Converting to Sony ELF kernel.velf"
	/usr/local/vitasdk/bin/vita-elf-create -e /home/yusk5/VitaShell/modules/kernel/exports.yml kernel kernel.velf

kernel.skprx: CMakeFiles/kernel.skprx
kernel.skprx: kernel.velf
kernel.skprx: CMakeFiles/kernel.skprx.dir/build.make

.PHONY : kernel.skprx

# Rule to build all files generated by this target.
CMakeFiles/kernel.skprx.dir/build: kernel.skprx

.PHONY : CMakeFiles/kernel.skprx.dir/build

CMakeFiles/kernel.skprx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kernel.skprx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kernel.skprx.dir/clean

CMakeFiles/kernel.skprx.dir/depend:
	cd /home/yusk5/VitaShell/modules/kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yusk5/VitaShell/modules/kernel /home/yusk5/VitaShell/modules/kernel /home/yusk5/VitaShell/modules/kernel/build /home/yusk5/VitaShell/modules/kernel/build /home/yusk5/VitaShell/modules/kernel/build/CMakeFiles/kernel.skprx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kernel.skprx.dir/depend

