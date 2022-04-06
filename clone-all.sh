#!/bin/sh

# Clone script for the RISC-V tool chain

# Copyright (C) 2009, 2013, 2014, 2015, 2016, 2017 Embecosm Limited
# Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

# This file is part of the Embecosm GNU toolchain build system for RISC-V.

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 3 of the License, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.
# This file is part of the Embecosm LLVM build system for AAP.

#		    SCRIPT TO CLONE THE RISC-V TOOL CHAIN
#		    =====================================

# Invocation Syntax

#     clone-all.sh

# Set the top level directory.
topdir=$(cd $(dirname $0)/..;pwd)
cd ${topdir}

# Toolchain
git clone -b psx https://github.com/gmarkall/binutils-gdb.git
git clone -b psx https://github.com/gmarkall/gcc.git
git clone -b psx https://github.com/gmarkall/newlib.git
git clone -b grm-newlib-toolchain https://github.com/Lameguy64/PSn00bSDK.git

# Bristol / Embecosm Embedded Benchmark Suite (BEEBS)
#git clone -b grm-size-wip https://github.com/embecosm/riscv-beebs.git beebs

# Emulator
#git clone https://git.qemu.org/git/qemu.git
