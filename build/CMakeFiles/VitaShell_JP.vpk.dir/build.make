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
CMAKE_SOURCE_DIR = /home/yusk5/VitaShell

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yusk5/VitaShell/build

# Utility rule file for VitaShell_JP.vpk.

# Include the progress variables for this target.
include CMakeFiles/VitaShell_JP.vpk.dir/progress.make

CMakeFiles/VitaShell_JP.vpk: VitaShell_JP.vpk_param.sfo
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yusk5/VitaShell/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building vpk VitaShell_JP.vpk"
	/usr/local/vitasdk/bin/vita-pack-vpk -a /home/yusk5/VitaShell/pkg/sce_sys/icon0.png=sce_sys/icon0.png -a /home/yusk5/VitaShell/pkg/sce_sys/livearea/contents/bg.png=sce_sys/livearea/contents/bg.png -a /home/yusk5/VitaShell/pkg/sce_sys/livearea/contents/startup.png=sce_sys/livearea/contents/startup.png -a /home/yusk5/VitaShell/pkg/sce_sys/livearea/contents/template.xml=sce_sys/livearea/contents/template.xml -s VitaShell_JP.vpk_param.sfo -b eboot.bin VitaShell_JP.vpk

VitaShell_JP.vpk_param.sfo:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yusk5/VitaShell/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating param.sfo for VitaShell_JP.vpk"
	/usr/local/vitasdk/bin/vita-mksfoex -d PARENTAL_LEVEL=1 -s APP_VER=01.90 -s TITLE_ID=VSJP00001 VitaShell_JP VitaShell_JP.vpk_param.sfo

VitaShell_JP.vpk: CMakeFiles/VitaShell_JP.vpk
VitaShell_JP.vpk: VitaShell_JP.vpk_param.sfo
VitaShell_JP.vpk: CMakeFiles/VitaShell_JP.vpk.dir/build.make

.PHONY : VitaShell_JP.vpk

# Rule to build all files generated by this target.
CMakeFiles/VitaShell_JP.vpk.dir/build: VitaShell_JP.vpk

.PHONY : CMakeFiles/VitaShell_JP.vpk.dir/build

CMakeFiles/VitaShell_JP.vpk.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/VitaShell_JP.vpk.dir/cmake_clean.cmake
.PHONY : CMakeFiles/VitaShell_JP.vpk.dir/clean

CMakeFiles/VitaShell_JP.vpk.dir/depend:
	cd /home/yusk5/VitaShell/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yusk5/VitaShell /home/yusk5/VitaShell /home/yusk5/VitaShell/build /home/yusk5/VitaShell/build /home/yusk5/VitaShell/build/CMakeFiles/VitaShell_JP.vpk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/VitaShell_JP.vpk.dir/depend

