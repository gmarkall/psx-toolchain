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

All toolchain components build successfully, but compiling the hello example
from PSn00bSDK when using the psx.ld script from impiaaa fails linking with:

```
/data/gmarkall/psxdev/psx-gnu-toolchain/install-psx/lib/gcc/mipsel-psx-elf/11.0.0/../../../../mipsel-psx-elf/bin/ld: section .data LMA [0000000080013890,00000000800142a3] overlaps section .rel.dyn LMA [0000000080013884,00000000800138a3]
```

This section should not appear in the output, so something is set up wrongly
somewhere.


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
- Add build of SDK (e.g. PXn00bSDK)
- Add build of the Bristol / Embecosm Embedded Benchmark Suite (BEEBS) for code
  size evaluation / optimization.


Origin of this repository
-------------------------

This is forked from [The Embecosm RISC-V toolchain
repository](https://github.com/embecosm/riscv-toolchain/tree/grm-compare-wip).
The original README can be found in [README.original].
