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
CMAKE_SOURCE_DIR = /home/yusk5/VitaShell/modules/user

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yusk5/VitaShell/modules/user/build

# Include any dependencies generated for this target.
include CMakeFiles/user.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/user.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/user.dir/flags.make

CMakeFiles/user.dir/main.c.obj: CMakeFiles/user.dir/flags.make
CMakeFiles/user.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yusk5/VitaShell/modules/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/user.dir/main.c.obj"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/user.dir/main.c.obj   -c /home/yusk5/VitaShell/modules/user/main.c

CMakeFiles/user.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/user.dir/main.c.i"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yusk5/VitaShell/modules/user/main.c > CMakeFiles/user.dir/main.c.i

CMakeFiles/user.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/user.dir/main.c.s"
	/usr/local/vitasdk/bin/arm-vita-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yusk5/VitaShell/modules/user/main.c -o CMakeFiles/user.dir/main.c.s

CMakeFiles/user.dir/main.c.obj.requires:

.PHONY : CMakeFiles/user.dir/main.c.obj.requires

CMakeFiles/user.dir/main.c.obj.provides: CMakeFiles/user.dir/main.c.obj.requires
	$(MAKE) -f CMakeFiles/user.dir/build.make CMakeFiles/user.dir/main.c.obj.provides.build
.PHONY : CMakeFiles/user.dir/main.c.obj.provides

CMakeFiles/user.dir/main.c.obj.provides.build: CMakeFiles/user.dir/main.c.obj


# Object files for target user
user_OBJECTS = \
"CMakeFiles/user.dir/main.c.obj"

# External object files for target user
user_EXTERNAL_OBJECTS =

user: CMakeFiles/user.dir/main.c.obj
user: CMakeFiles/user.dir/build.make
user: CMakeFiles/user.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yusk5/VitaShell/modules/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable user"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/user.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/user.dir/build: user

.PHONY : CMakeFiles/user.dir/build

CMakeFiles/user.dir/requires: CMakeFiles/user.dir/main.c.obj.requires

.PHONY : CMakeFiles/user.dir/requires

CMakeFiles/user.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/user.dir/cmake_clean.cmake
.PHONY : CMakeFiles/user.dir/clean

CMakeFiles/user.dir/depend:
	cd /home/yusk5/VitaShell/modules/user/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yusk5/VitaShell/modules/user /home/yusk5/VitaShell/modules/user /home/yusk5/VitaShell/modules/user/build /home/yusk5/VitaShell/modules/user/build /home/yusk5/VitaShell/modules/user/build/CMakeFiles/user.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/user.dir/depend

