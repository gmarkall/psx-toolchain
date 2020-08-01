GNU / Newlib C/C++ Toolchain build for PSX
==========================================

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
PSn00bSDK builds and appears to execute correctly on ePSXe. The hello world
example converted to C++ and using the STL (creating and traversing a vector)
also works correctly.

Further testing is needed to establish what does and doesn't work more fully.


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
