# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/project_theia/ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/project_theia/ws/build

# Utility rule file for interpreter_geneus.

# Include the progress variables for this target.
include interpreter/CMakeFiles/interpreter_geneus.dir/progress.make

interpreter_geneus: interpreter/CMakeFiles/interpreter_geneus.dir/build.make

.PHONY : interpreter_geneus

# Rule to build all files generated by this target.
interpreter/CMakeFiles/interpreter_geneus.dir/build: interpreter_geneus

.PHONY : interpreter/CMakeFiles/interpreter_geneus.dir/build

interpreter/CMakeFiles/interpreter_geneus.dir/clean:
	cd /home/ubuntu/project_theia/ws/build/interpreter && $(CMAKE_COMMAND) -P CMakeFiles/interpreter_geneus.dir/cmake_clean.cmake
.PHONY : interpreter/CMakeFiles/interpreter_geneus.dir/clean

interpreter/CMakeFiles/interpreter_geneus.dir/depend:
	cd /home/ubuntu/project_theia/ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/project_theia/ws/src /home/ubuntu/project_theia/ws/src/interpreter /home/ubuntu/project_theia/ws/build /home/ubuntu/project_theia/ws/build/interpreter /home/ubuntu/project_theia/ws/build/interpreter/CMakeFiles/interpreter_geneus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : interpreter/CMakeFiles/interpreter_geneus.dir/depend

