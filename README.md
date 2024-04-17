

## Table of Contents:
[1. main.c](Chapters/1.%20main.c%20file.md)

[2. Makefile](Chapters/2.%20Makefile.md)

[3. Syscalls issue](Chapters/3.%20Syscalls%20issue.md)
- [3a. Implementation stubs of syscalls](Chapters/3a.%20Implementation%20stubs%20of%20syscalls.md)

[4. Linker script](Chapters/4.%20Linker%20script.md)

[5. Startup file](Chapters/5.%20Startup%20file.md)

[6. Compilation flags](Chapters/6.%20Compilation%20flags.md)

[7. Debug in VSCode](Chapters/7.%20Debug%20in%20VSCode.md)

[8. Structure of files in project](Chapters/8.%20Files%20structure%20in%20project.md)

[9. Modify makefiles](Chapters/9.%20Modify%20makefiles.md)

[10. Unit tests with ThrowTheSwitch Unity framework](Chapters/10.%20Unit%20tests%20with%20Unity.md)

## Prerequisities:
You should have arm-none-eabi toolchain installed [ARM GNU toolchain](https://developer.arm.com/downloads/-/gnu-rm)

If you don't have "make" program, then yo should install it by `chocolatey`:
- install [Chocolatey](https://chocolatey.org/install)
- after installing, run command `choco install make`
- now you should be able to run `make` command

If you experience an error with `rm` command on windows, you should install `CoreUtils`:
- download "Complete package, except sources" from [CoreUtils for Windows](https://gnuwin32.sourceforge.net/packages/coreutils.htm)
- install wherever you want
- add path to `bin` folder from installed package to `Path` environment variable

## Compile:
To compile current version of project, use `make` command.
