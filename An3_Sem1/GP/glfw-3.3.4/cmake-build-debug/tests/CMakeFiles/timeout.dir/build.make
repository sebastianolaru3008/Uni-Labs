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
include tests/CMakeFiles/timeout.dir/depend.make
# Include the progress variables for this target.
include tests/CMakeFiles/timeout.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/timeout.dir/flags.make

tests/CMakeFiles/timeout.dir/timeout.c.obj: tests/CMakeFiles/timeout.dir/flags.make
tests/CMakeFiles/timeout.dir/timeout.c.obj: tests/CMakeFiles/timeout.dir/includes_C.rsp
tests/CMakeFiles/timeout.dir/timeout.c.obj: ../tests/timeout.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/timeout.dir/timeout.c.obj"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\timeout.dir\timeout.c.obj -c D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\timeout.c

tests/CMakeFiles/timeout.dir/timeout.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/timeout.dir/timeout.c.i"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\timeout.c > CMakeFiles\timeout.dir\timeout.c.i

tests/CMakeFiles/timeout.dir/timeout.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/timeout.dir/timeout.c.s"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests\timeout.c -o CMakeFiles\timeout.dir\timeout.c.s

tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj: tests/CMakeFiles/timeout.dir/flags.make
tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj: tests/CMakeFiles/timeout.dir/includes_C.rsp
tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj: ../deps/glad_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\timeout.dir\__\deps\glad_gl.c.obj -c D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c

tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/timeout.dir/__/deps/glad_gl.c.i"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c > CMakeFiles\timeout.dir\__\deps\glad_gl.c.i

tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/timeout.dir/__/deps/glad_gl.c.s"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Facultate\An3_Sem1\GP\glfw-3.3.4\deps\glad_gl.c -o CMakeFiles\timeout.dir\__\deps\glad_gl.c.s

# Object files for target timeout
timeout_OBJECTS = \
"CMakeFiles/timeout.dir/timeout.c.obj" \
"CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj"

# External object files for target timeout
timeout_EXTERNAL_OBJECTS =

tests/timeout.exe: tests/CMakeFiles/timeout.dir/timeout.c.obj
tests/timeout.exe: tests/CMakeFiles/timeout.dir/__/deps/glad_gl.c.obj
tests/timeout.exe: tests/CMakeFiles/timeout.dir/build.make
tests/timeout.exe: src/libglfw3.a
tests/timeout.exe: tests/CMakeFiles/timeout.dir/linklibs.rsp
tests/timeout.exe: tests/CMakeFiles/timeout.dir/objects1.rsp
tests/timeout.exe: tests/CMakeFiles/timeout.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable timeout.exe"
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\timeout.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/timeout.dir/build: tests/timeout.exe
.PHONY : tests/CMakeFiles/timeout.dir/build

tests/CMakeFiles/timeout.dir/clean:
	cd /d D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests && $(CMAKE_COMMAND) -P CMakeFiles\timeout.dir\cmake_clean.cmake
.PHONY : tests/CMakeFiles/timeout.dir/clean

tests/CMakeFiles/timeout.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Facultate\An3_Sem1\GP\glfw-3.3.4 D:\Facultate\An3_Sem1\GP\glfw-3.3.4\tests D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests D:\Facultate\An3_Sem1\GP\glfw-3.3.4\cmake-build-debug\tests\CMakeFiles\timeout.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/timeout.dir/depend
