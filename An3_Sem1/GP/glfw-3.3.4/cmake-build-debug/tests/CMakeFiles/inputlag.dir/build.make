# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.2.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.2.2\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Facultate\An3_Sem1\GP\glfw-3.3.4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug

# Include any dependencies generated for this target.
include tests/CMakeFiles/inputlag.dir/depend.make
# Include the progress variables for this target.
include tests/CMakeFiles/inputlag.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/inputlag.dir/flags.make

tests/CMakeFiles/inputlag.dir/inputlag.c.obj: tests/CMakeFiles/inputlag.dir/flags.make
tests/CMakeFiles/inputlag.dir/inputlag.c.obj: tests/CMakeFiles/inputlag.dir/includes_C.rsp
tests/CMakeFiles/inputlag.dir/inputlag.c.obj: ../tests/inputlag.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/inputlag.dir/inputlag.c.obj"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\inputlag.dir\inputlag.c.obj -c D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\inputlag.c

tests/CMakeFiles/inputlag.dir/inputlag.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/inputlag.dir/inputlag.c.i"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\inputlag.c > CMakeFiles\inputlag.dir\inputlag.c.i

tests/CMakeFiles/inputlag.dir/inputlag.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/inputlag.dir/inputlag.c.s"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\inputlag.c -o CMakeFiles\inputlag.dir\inputlag.c.s

tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.obj: tests/CMakeFiles/inputlag.dir/flags.make
tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.obj: tests/CMakeFiles/inputlag.dir/includes_C.rsp
tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.obj: ../deps/getopt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.obj"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\inputlag.dir\__\deps\getopt.c.obj -c D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\getopt.c

tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/inputlag.dir/__/deps/getopt.c.i"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\getopt.c > CMakeFiles\inputlag.dir\__\deps\getopt.c.i

tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/inputlag.dir/__/deps/getopt.c.s"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\getopt.c -o CMakeFiles\inputlag.dir\__\deps\getopt.c.s

tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj: tests/CMakeFiles/inputlag.dir/flags.make
tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj: tests/CMakeFiles/inputlag.dir/includes_C.rsp
tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj: ../deps/glad_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\inputlag.dir\__\deps\glad_gl.c.obj -c D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c

tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/inputlag.dir/__/deps/glad_gl.c.i"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c > CMakeFiles\inputlag.dir\__\deps\glad_gl.c.i

tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/inputlag.dir/__/deps/glad_gl.c.s"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c -o CMakeFiles\inputlag.dir\__\deps\glad_gl.c.s

# Object files for target inputlag
inputlag_OBJECTS = \
"CMakeFiles/inputlag.dir/inputlag.c.obj" \
"CMakeFiles/inputlag.dir/__/deps/getopt.c.obj" \
"CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj"

# External object files for target inputlag
inputlag_EXTERNAL_OBJECTS =

tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/inputlag.c.obj
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/__/deps/getopt.c.obj
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/__/deps/glad_gl.c.obj
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/build.make
tests/inputlag.exe: src/libglfw3.a
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/linklibs.rsp
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/objects1.rsp
tests/inputlag.exe: tests/CMakeFiles/inputlag.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable inputlag.exe"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\inputlag.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/inputlag.dir/build: tests/inputlag.exe
.PHONY : tests/CMakeFiles/inputlag.dir/build

tests/CMakeFiles/inputlag.dir/clean:
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && $(CMAKE_COMMAND) -P CMakeFiles\inputlag.dir\cmake_clean.cmake
.PHONY : tests/CMakeFiles/inputlag.dir/clean

tests/CMakeFiles/inputlag.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Facultate\An3_Sem1\GP\glfw-3.3.4 D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests\CMakeFiles\inputlag.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/inputlag.dir/depend

