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

# Utility rule file for i2c_communication_genlisp.

# Include the progress variables for this target.
include i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/progress.make

i2c_communication_genlisp: i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/build.make

.PHONY : i2c_communication_genlisp

# Rule to build all files generated by this target.
i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/build: i2c_communication_genlisp

.PHONY : i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/build

i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/clean:
	cd /home/ubuntu/project_theia/ws/build/i2c_communication && $(CMAKE_COMMAND) -P CMakeFiles/i2c_communication_genlisp.dir/cmake_clean.cmake
.PHONY : i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/clean

i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/depend:
	cd /home/ubuntu/project_theia/ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/project_theia/ws/src /home/ubuntu/project_theia/ws/src/i2c_communication /home/ubuntu/project_theia/ws/build /home/ubuntu/project_theia/ws/build/i2c_communication /home/ubuntu/project_theia/ws/build/i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : i2c_communication/CMakeFiles/i2c_communication_genlisp.dir/depend

