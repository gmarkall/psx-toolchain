GNU / Newlib Toolchain build for PSX
====================================

This repository contains scripts that build:

- Binutils (as, ld, binary utilities, etc.)
- GCC Stage 1
- Newlib
- GCC Stage 2
- PSn00bSDK with newlib (instead of its own libc)

targeting the Sony PlayStation (PSX / PSone, etc...) by default. This is early /
in-progress work. Initially I started putting it together because I planned to
port a C++ GDB RSP server to the playstation, but found the existing toolchains
don't have good coverage of C++ support. I'm not sure I'll do that now, but I
still think that a Newlib-based C/C++ (or Fortran, and other GCC frontends, if
of interest in future) could be interesting.


Current status
--------------

All toolchain components build successfully, and the hello world example from
PSn00bSDK builds and appears to execute correctly on ePSXe.

A very quick test of linking a C++ program with g++ fails with:

```
/data/gmarkall/psxdev/psx-gnu-toolchain/install-psx/lib/gcc/mipsel-psx-elf/11.0.0/../../../../mipsel-psx-elf/bin/ld: /data/gmarkall/psxdev/psx-gnu-toolchain/install-psx/lib/gcc/mipsel-psx-elf/11.0.0/../../../../mipsel-psx-elf/lib/libc.a(lib_a-signalr.o): in function `_kill_r':
(.text+0x18): undefined reference to `kill'
/data/gmarkall/psxdev/psx-gnu-toolchain/install-psx/lib/gcc/mipsel-psx-elf/11.0.0/../../../../mipsel-psx-elf/bin/ld: /data/gmarkall/psxdev/psx-gnu-toolchain/install-psx/lib/gcc/mipsel-psx-elf/11.0.0/../../../../mipsel-psx-elf/lib/libc.a(lib_a-signalr.o): in function `_getpid_r':
(.text+0x50): undefined reference to `getpid'
collect2: error: ld returned 1 exit status
```

This may be something trivial, like having the link line in the wrong order - I
have not yet had time to look into this.


Cloning and building
--------------------

To clone:

```
export PSX_TOOLCHAIN_DIR=`pwd`/psx-toolchain
git clone git@github.com:gmarkall/psx-toolchain.git
cd ${PSX_TOOLCHAIN_DIR}
./clone-all.sh
```

To build:

```
./build-psx.sh
```

Once building is completed, add `${PSX_TOOLCHAIN_DIR}/../install-psx/bin` to
your `PATH`.


Building the hello example from PSn00bSDK
-----------------------------------------

Run `make` in `PSn00bSDK/examples/beginner/hello`. The resulting `hello.exe`
should be executable in the normal way.


To do
-----

An unsorted wishlist of ideas:

- Test the toolchain / debug any issues preventing execution of generated code
  on hardware or an emulator.
- Add PlayStation-specific linker script and configure GCC to automatically use
  it (psx.ld from impiaaa).
- Add support for PlayStation-specific instructions to binutils.
- Setup testsuite runs (Binutils, GCC compilation, Newlib)
- Setup execution tests (either using emulator or PSX serial)
- Add build of the Bristol / Embecosm Embedded Benchmark Suite (BEEBS) for code
  size evaluation / optimization.


Origin of this repository
-------------------------

This is forked from [The Embecosm RISC-V toolchain
repository](https://github.com/embecosm/riscv-toolchain/tree/grm-compare-wip).
The original README can be found in [README.original].
