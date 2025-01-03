# This file is part of Autoconf.                       -*- Autoconf -*-
# Interface with Autotest.
# Copyright (C) 1992-1996, 1998-2005, 2009-2017, 2020-2025 Free Software
# Foundation, Inc.

# This file is part of Autoconf.  This program is free
# software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Under Section 7 of GPL version 3, you are granted additional
# permissions described in the Autoconf Configure Script Exception,
# version 3.0, as published by the Free Software Foundation.
#
# You should have received a copy of the GNU General Public License
# and a copy of the Autoconf Configure Script Exception along with
# this program; see the files COPYINGv3 and COPYING.EXCEPTION
# respectively.  If not, see <https://www.gnu.org/licenses/> and
# <https://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=blob_plain;f=COPYING.EXCEPTION>.

# Written by David MacKenzie, with help from
# François Pinard, Karl Berry, Richard Pixley, Ian Lance Taylor,
# Roland McGrath, Noah Friedman, david d zuhn, and many others.


# AC_CONFIG_TESTDIR(TEST-DIRECTORY, [AUTOTEST-PATH = TEST-DIRECTORY])
# -------------------------------------------------------------------
# Configure an Autotest test suite directory.  Invoke it once per dir,
# even if there are several test suites in there.
#
# AUTOTEST-PATH must help the test suite to find the executables.
# It is relative to the top level of the package, and is expanded
# into all the build dirs of AUTOTEST-PATH, then all the src dirs.
#
# Do not use _ACEOF as we are being dumped into config.status via
# an _ACEOF-heredoc.
AC_DEFUN([AC_CONFIG_TESTDIR],
[AC_CONFIG_COMMANDS([$1/atconfig],
[cat >$1/atconfig <<ATEOF
@%:@ Configurable variable values for building test suites.
@%:@ Generated by $[0].
@%:@ Copyright (C) m4_PACKAGE_YEAR Free Software Foundation, Inc.

# The test suite will define top_srcdir=$at_top_srcdir/../.. etc.
at_testdir='$1'
abs_builddir='$ac_abs_builddir'
at_srcdir='$ac_srcdir'
abs_srcdir='$ac_abs_srcdir'
at_top_srcdir='$ac_top_srcdir'
abs_top_srcdir='$ac_abs_top_srcdir'
at_top_build_prefix='$ac_top_build_prefix'
abs_top_builddir='$ac_abs_top_builddir'

# Backward compatibility with Autotest <= 2.59b:
at_top_builddir=\$at_top_build_prefix

m4_provide_if([_AC_COMPILER_EXEEXT], [
EXEEXT='$ac_cv_exeext'
])dnl
AUTOTEST_PATH='m4_default([$2], [$1])'

SHELL=\${CONFIG_SHELL-'$SHELL'}
m4_provide_if([AC_ERLANG_PATH_ERL], [
ERL='$ERL'
])dnl
m4_provide_if([AC_ERLANG_PATH_ERLC], [
ERLC='$ERLC'
ERLCFLAGS='$ERLCFLAGS'
])dnl
ATEOF
],
[m4_provide_if([_AC_COMPILER_EXEEXT], [ac_cv_exeext="$ac_cv_exeext"
])m4_provide_if([AC_ERLANG_PATH_ERL], [ERL="$ERL"
])m4_provide_if([AC_ERLANG_PATH_ERLC], [ERLC="$ERLC"
ERLCFLAGS="$ERLCFLAGS"
])])])# AC_CONFIG_TESTDIR
