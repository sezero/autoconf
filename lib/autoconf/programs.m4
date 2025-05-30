# This file is part of Autoconf.                       -*- Autoconf -*-
# Checking for programs.

# Copyright (C) 1992-1996, 1998-2017, 2020-2025 Free Software
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


## ----------------------------- ##
## Generic checks for programs.  ##
## ----------------------------- ##


# _AC_CHECK_PROG(VARIABLE, PROG-TO-CHECK-FOR,
#               [VALUE-IF-FOUND], [VALUE-IF-NOT-FOUND],
#               [PATH], [REJECT])
# -----------------------------------------------------
AC_DEFUN([_AC_CHECK_PROG],
[# Extract the first word of "$2", so it can be a program name with args.
set dummy $2; ac_word=$[2]
AC_MSG_CHECKING([for $ac_word])
AC_CACHE_VAL(ac_cv_prog_$1,
[if test -n "$$1"; then
  ac_cv_prog_$1="$$1" # Let the user override the test.
else
m4_ifvaln([$6],
[  ac_prog_rejected=no])dnl
_AS_PATH_WALK([$5],
[for ac_exec_ext in '' $ac_executable_extensions; do
  if AS_EXECUTABLE_P(["$as_dir$ac_word$ac_exec_ext"]); then
m4_ifvaln([$6],
[    if test "$as_dir$ac_word$ac_exec_ext" = "$6"; then
       ac_prog_rejected=yes
       continue
     fi])dnl
    ac_cv_prog_$1="$3"
    _AS_ECHO_LOG([found $as_dir$ac_word$ac_exec_ext])
    break 2
  fi
done])
m4_ifvaln([$6],
[if test $ac_prog_rejected = yes; then
  # We found a bogon in the path, so make sure we never use it.
  set dummy $ac_cv_prog_$1
  shift
  if test $[@%:@] != 0; then
    # We chose a different compiler from the bogus one.
    # However, it has the same basename, so the bogon will be chosen
    # first if we set $1 to just the basename; use the full file name.
    shift
    ac_cv_prog_$1="$as_dir$ac_word${1+' '}$[@]"
m4_if([$2], [$4],
[  else
    # Default is a loser.
    AC_MSG_ERROR([$1=$6 unacceptable, but no other $4 found in dnl
m4_default([$5], [\$PATH])])
])dnl
  fi
fi])dnl
dnl If no 4th arg is given, leave the cache variable unset,
dnl so AC_CHECK_PROGS will keep looking.
m4_ifvaln([$4],
[  test -z "$ac_cv_prog_$1" && ac_cv_prog_$1="$4"])dnl
fi])dnl
$1=$ac_cv_prog_$1
if test -n "$$1"; then
  AC_MSG_RESULT([$$1])
else
  AC_MSG_RESULT([no])
fi
])# _AC_CHECK_PROG


# AC_CHECK_PROG(VARIABLE, PROG-TO-CHECK-FOR,
#               [VALUE-IF-FOUND], [VALUE-IF-NOT-FOUND],
#               [PATH], [REJECT])
# -----------------------------------------------------
AC_DEFUN([AC_CHECK_PROG],
[_AC_CHECK_PROG($@)
AC_SUBST([$1])dnl
])


# AC_CHECK_PROGS(VARIABLE, PROGS-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND],
#                [PATH])
# ------------------------------------------------------------------
AC_DEFUN([AC_CHECK_PROGS],
[for ac_prog in $2
do
  AC_CHECK_PROG([$1], [$ac_prog], [$ac_prog], , [$4])
  test -n "$$1" && break
done
m4_ifvaln([$3], [test -n "$$1" || $1="$3"])])


# _AC_PATH_PROG(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# ------------------------------------------------------------------------
AC_DEFUN([_AC_PATH_PROG],
[# Extract the first word of "$2", so it can be a program name with args.
set dummy $2; ac_word=$[2]
AC_MSG_CHECKING([for $ac_word])
AC_CACHE_VAL([ac_cv_path_$1],
[case $$1 in
  [[\\/]]* | ?:[[\\/]]*)
  ac_cv_path_$1="$$1" # Let the user override the test with a path.
  ;;
  *)
  _AS_PATH_WALK([$4],
[for ac_exec_ext in '' $ac_executable_extensions; do
  if AS_EXECUTABLE_P(["$as_dir$ac_word$ac_exec_ext"]); then
    ac_cv_path_$1="$as_dir$ac_word$ac_exec_ext"
    _AS_ECHO_LOG([found $as_dir$ac_word$ac_exec_ext])
    break 2
  fi
done])
dnl If no 3rd arg is given, leave the cache variable unset,
dnl so AC_PATH_PROGS will keep looking.
m4_ifvaln([$3],
[  test -z "$ac_cv_path_$1" && ac_cv_path_$1="$3"])dnl
  ;;
esac])dnl
$1=$ac_cv_path_$1
if test -n "$$1"; then
  AC_MSG_RESULT([$$1])
else
  AC_MSG_RESULT([no])
fi
])# _AC_PATH_PROG


# AC_PATH_PROG(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# -----------------------------------------------------------------------
AC_DEFUN([AC_PATH_PROG],
[_AC_PATH_PROG($@)
AC_SUBST([$1])dnl
])


# AC_PATH_PROGS(VARIABLE, PROGS-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND],
#               [PATH])
# -----------------------------------------------------------------
AC_DEFUN([AC_PATH_PROGS],
[for ac_prog in $2
do
  AC_PATH_PROG([$1], [$ac_prog], , [$4])
  test -n "$$1" && break
done
m4_ifvaln([$3], [test -n "$$1" || $1="$3"])dnl
])




## -------------------------- ##
## Generic checks for tools.  ##
## -------------------------- ##


# AC_CHECK_TOOL_PREFIX
# --------------------
AU_DEFUN([AC_CHECK_TOOL_PREFIX])


# _AC_TOOL_WARN
# -------------
AC_DEFUN([_AC_TOOL_WARN],
[case $cross_compiling:$ac_tool_warned in
yes:)
AC_MSG_WARN([using cross tools not prefixed with host triplet])
ac_tool_warned=yes ;;
esac])

# AC_PATH_TOOL(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# -----------------------------------------------------------------------
# (Use different variables $1 and ac_pt_$1 so that cache vars don't conflict.)
AC_DEFUN([AC_PATH_TOOL],
[if test -n "$ac_tool_prefix"; then
  AC_PATH_PROG([$1], [${ac_tool_prefix}$2], , [$4])
fi
if test -z "$ac_cv_path_$1"; then
  ac_pt_$1=$$1
  _AC_PATH_PROG([ac_pt_$1], [$2], [], [$4])
  if test "x$ac_pt_$1" = x; then
    $1="$3"
  else
    _AC_TOOL_WARN
    $1=$ac_pt_$1
  fi
else
  $1="$ac_cv_path_$1"
fi
])# AC_PATH_TOOL


# AC_CHECK_TOOL(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# ------------------------------------------------------------------------
# (Use different variables $1 and ac_ct_$1 so that cache vars don't conflict.)
AC_DEFUN([AC_CHECK_TOOL],
[if test -n "$ac_tool_prefix"; then
  AC_CHECK_PROG([$1], [${ac_tool_prefix}$2], [${ac_tool_prefix}$2], , [$4])
fi
if test -z "$ac_cv_prog_$1"; then
  ac_ct_$1=$$1
  _AC_CHECK_PROG([ac_ct_$1], [$2], [$2], [], [$4])
  if test "x$ac_ct_$1" = x; then
    $1="$3"
  else
    _AC_TOOL_WARN
    $1=$ac_ct_$1
  fi
else
  $1="$ac_cv_prog_$1"
fi
])# AC_CHECK_TOOL


# AC_CHECK_TOOLS(VARIABLE, PROGS-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND],
#                [PATH])
# ------------------------------------------------------------------
# Check for each tool in PROGS-TO-CHECK-FOR with the cross prefix. If
# none can be found with a cross prefix, then use the first one that
# was found without the cross prefix.
AC_DEFUN([AC_CHECK_TOOLS],
[if test -n "$ac_tool_prefix"; then
  for ac_prog in $2
  do
    AC_CHECK_PROG([$1],
		  [$ac_tool_prefix$ac_prog], [$ac_tool_prefix$ac_prog],,
		  [$4])
    test -n "$$1" && break
  done
fi
if test -z "$$1"; then
  ac_ct_$1=$$1
  AC_CHECK_PROGS([ac_ct_$1], [$2], [], [$4])
  if test "x$ac_ct_$1" = x; then
    $1="$3"
  else
    _AC_TOOL_WARN
    $1=$ac_ct_$1
  fi
fi
])# AC_CHECK_TOOLS


# AC_PATH_TARGET_TOOL(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# ------------------------------------------------------------------------------
# (Use different variables $1 and ac_pt_$1 so that cache vars don't conflict.)
AC_DEFUN([AC_PATH_TARGET_TOOL],
[AC_REQUIRE([AC_CANONICAL_TARGET])dnl
AC_PATH_PROG([$1], [$target_alias-$2], , [$4])
if test -z "$ac_cv_path_$1"; then
  if test "$build" = "$target"; then
    ac_pt_$1=$$1
    _AC_PATH_PROG([ac_pt_$1], [$2], [$3], [$4])
    $1=$ac_pt_$1
  else
    $1="$3"
  fi
else
  $1="$ac_cv_path_$1"
fi
])# AC_PATH_TARGET_TOOL


# AC_CHECK_TARGET_TOOL(VARIABLE, PROG-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND], [PATH])
# -------------------------------------------------------------------------------
# (Use different variables $1 and ac_ct_$1 so that cache vars don't conflict.)
AC_DEFUN([AC_CHECK_TARGET_TOOL],
[AC_REQUIRE([AC_CANONICAL_TARGET])dnl
AC_CHECK_PROG([$1], [$target_alias-$2], [$target_alias-$2], , [$4])
if test -z "$ac_cv_prog_$1"; then
  if test "$build" = "$target"; then
    ac_ct_$1=$$1
    _AC_CHECK_PROG([ac_ct_$1], [$2], [$2], [$3], [$4])
    $1=$ac_ct_$1
  else
    $1="$3"
  fi
else
  $1="$ac_cv_prog_$1"
fi
])# AC_CHECK_TARGET_TOOL


# AC_CHECK_TARGET_TOOLS(VARIABLE, PROGS-TO-CHECK-FOR, [VALUE-IF-NOT-FOUND],
#	                [PATH])
# -------------------------------------------------------------------------
# Check for each tool in PROGS-TO-CHECK-FOR with the cross prefix. If
# none can be found with a cross prefix, then use the first one that
# was found without the cross prefix.
AC_DEFUN([AC_CHECK_TARGET_TOOLS],
[AC_REQUIRE([AC_CANONICAL_TARGET])dnl
for ac_prog in $2
do
  AC_CHECK_PROG([$1],
		[$target_alias-$ac_prog], [$target_alias-$ac_prog],,
		[$4])
  test -n "$$1" && break
done
if test -z "$$1"; then
  if test "$build" = "$target"; then
    ac_ct_$1=$$1
    AC_CHECK_PROGS([ac_ct_$1], [$2], [$3], [$4])
    $1=$ac_ct_$1
  else
    $1="$3"
  fi
fi
])# AC_CHECK_TARGET_TOOLS



## ---------------- ##
## Specific tests.  ##
## ---------------- ##

# Please, keep this section sorted.
# (But of course when keeping related things together).

# AC_PROG_AR
# --------------
AN_MAKEVAR([AR], [AC_PROG_AR])
AN_PROGRAM([ar], [AC_PROG_AR])
AC_DEFUN([AC_PROG_AR],
[AC_CHECK_TOOL(AR, ar, :)])


# Check for gawk first since it's generally better.
AN_MAKEVAR([AWK],  [AC_PROG_AWK])
AN_PROGRAM([awk],  [AC_PROG_AWK])
AN_PROGRAM([gawk], [AC_PROG_AWK])
AN_PROGRAM([mawk], [AC_PROG_AWK])
AN_PROGRAM([nawk], [AC_PROG_AWK])
AC_DEFUN([AC_PROG_AWK],
[AC_CHECK_PROGS([AWK], [gawk mawk nawk awk 'busybox awk'])])


# AC_PROG_EGREP
# -------------
AC_DEFUN([AC_PROG_EGREP],
[AC_REQUIRE([AC_PROG_GREP])dnl
AC_CACHE_CHECK([for egrep], ac_cv_path_EGREP,
   [if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
   then ac_cv_path_EGREP="$GREP -E"
   else
     _AC_PROG_GREP(EGREP, egrep, ['EGREP$'])
   fi])
 EGREP="$ac_cv_path_EGREP"
 AC_SUBST([EGREP])
 dnl
 dnl Also set EGREP_TRADITIONAL even though unnecessary here,
 dnl for wrong but too-common code with the following pattern:
 dnl   AC_PROG_EGREP
 dnl   if false; then
 dnl      AC_EGREP_HEADER([printf], [stdio.h], [has_printf=yes])
 dnl   fi
 dnl   AC_EGREP_HEADER([malloc], [stdlib.h], [has_malloc=yes])
 EGREP_TRADITIONAL=$EGREP
 ac_cv_path_EGREP_TRADITIONAL=$EGREP
])# AC_PROG_EGREP

# _AC_PROG_EGREP_TRADITIONAL
# --------------------------
# Check for a grep -E program or equivalent.
# Less stringent than AC_PROG_EGREP, as it succeeds even if there
# is no working 'grep' or if the -e option does not work (e.g., AT&T UnixPC).
AC_DEFUN([_AC_PROG_EGREP_TRADITIONAL],
[AC_CACHE_CHECK([for egrep -e], [ac_cv_path_EGREP_TRADITIONAL],
   [_AC_PROG_GREP([EGREP_TRADITIONAL], [grep ggrep],
      [-E 'EGR(EP|AC)_TRADITIONAL$'], [:])
    AS_IF([test "$ac_cv_path_EGREP_TRADITIONAL"],
      [ac_cv_path_EGREP_TRADITIONAL="$ac_cv_path_EGREP_TRADITIONAL -E"],
      [_AC_PROG_GREP([EGREP_TRADITIONAL], [egrep],
	 ['EGR(EP|AC)_TRADITIONAL$'])])])
 EGREP_TRADITIONAL=$ac_cv_path_EGREP_TRADITIONAL
])

# AC_PROG_FGREP
# -------------
AC_DEFUN([AC_PROG_FGREP],
[AC_REQUIRE([AC_PROG_GREP])dnl
AC_CACHE_CHECK([for fgrep], ac_cv_path_FGREP,
   [if echo 'ab*c' | $GREP -F 'ab*c' >/dev/null 2>&1
   then ac_cv_path_FGREP="$GREP -F"
   else
     _AC_PROG_GREP(FGREP, fgrep, [FGREP])
   fi])
 FGREP="$ac_cv_path_FGREP"
 AC_SUBST([FGREP])
])# AC_PROG_FGREP


# AC_PROG_GREP
# ------------
# Check for a fully functional grep program that handles
# the longest lines possible and which respects multiple -e options.
# Prefer GNU grep if found.
AC_DEFUN([AC_PROG_GREP],
[AC_CACHE_CHECK([for grep that handles long lines and -e], ac_cv_path_GREP,
   [_$0(GREP, [grep ggrep], [-e 'GREP$' -e '-(cannot match)-'])])
 GREP="$ac_cv_path_GREP"
 AC_SUBST([GREP])
])


# _AC_PROG_GREP(VARIABLE, PROGNAME-LIST, [PROG-ARGUMENTS],
#		[ACTION-IF-NOT-FOUND])
# --------------------------------------------------------
# Solaris 9 /usr/xpg4/bin/*grep is suitable, but /usr/bin/*grep lacks -e.
# AIX silently truncates long lines before matching.
# NeXT understands only one -e and truncates long lines.
m4_define([_AC_PROG_GREP],
[_AC_PATH_PROGS_FEATURE_CHECK([$1], [$2],
	[_AC_FEATURE_CHECK_LENGTH([ac_path_$1], [ac_cv_path_$1],
		["$ac_path_$1" $3], [$1])], [$4],
	[$PATH$PATH_SEPARATOR/usr/xpg4/bin])dnl
])


# _AC_PATH_PROGS_FEATURE_CHECK(VARIABLE, PROGNAME-LIST, FEATURE-TEST,
#                              [ACTION-IF-NOT-FOUND], [PATH=$PATH])
# -------------------------------------------------------------------
# FEATURE-TEST is called repeatedly with $ac_path_VARIABLE set to the
# name of a program in PROGNAME-LIST found in PATH.  FEATURE-TEST must set
# $ac_cv_path_VARIABLE to the path of an acceptable program, or else
# ACTION-IF-NOT-FOUND is executed; the default action (for internal use
# only) issues a fatal error message.  If a suitable $ac_path_VARIABLE is
# found in the FEATURE-TEST macro, it can set $ac_path_VARIABLE_found=':'
# to accept that value without any further checks.
m4_define([_AC_PATH_PROGS_FEATURE_CHECK],
[if test -z "$$1"; then
  ac_path_$1_found=false
  # Loop through the user's path and test for each of PROGNAME-LIST
  _AS_PATH_WALK([$5],
  [for ac_prog in $2
   do
    for ac_exec_ext in '' $ac_executable_extensions; do
      ac_path_$1="$as_dir$ac_prog$ac_exec_ext"
      AS_EXECUTABLE_P(["$ac_path_$1"]) || continue
$3
      $ac_path_$1_found && break 3
    done
  done])dnl
  if test -z "$ac_cv_path_$1"; then
    m4_default([$4],
      [AC_MSG_ERROR([no acceptable m4_bpatsubst([$2], [ .*]) could be dnl
found in m4_default([$5], [\$PATH])])])
  fi
else
  ac_cv_path_$1=$$1
fi
])


# AC_PATH_PROGS_FEATURE_CHECK(VARIABLE, PROGNAME-LIST,
#                             FEATURE-TEST, [ACTION-IF-NOT-FOUND=:],
#                             [PATH=$PATH])
# ------------------------------------------------------------------
# Designed to be used inside AC_CACHE_VAL.  It is recommended,
# but not required, that the user also use AC_ARG_VAR([VARIABLE]).
# If VARIABLE is not empty, set the cache variable
# $ac_cv_path_VARIABLE to VARIABLE without any further tests.
# Otherwise, call FEATURE_TEST repeatedly with $ac_path_VARIABLE
# set to the name of a program in PROGNAME-LIST found in PATH.  If
# no invocation of FEATURE-TEST sets $ac_cv_path_VARIABLE to the
# path of an acceptable program, ACTION-IF-NOT-FOUND is executed.
# FEATURE-TEST is invoked even when $ac_cv_path_VARIABLE is set,
# in case a better candidate occurs later in PATH; to accept the
# current setting and bypass further checks, FEATURE-TEST can set
# $ac_path_VARIABLE_found=':'.  Note that, unlike AC_CHECK_PROGS,
# this macro does not have any side effect on the current value
# of VARIABLE.
m4_define([AC_PATH_PROGS_FEATURE_CHECK],
[_$0([$1], [$2], [$3], m4_default([$4], [:]), [$5])dnl
])


# _AC_FEATURE_CHECK_LENGTH(PROGPATH, CACHE-VAR, CHECK-CMD, [MATCH-STRING])
# ------------------------------------------------------------------------
# For use as the FEATURE-TEST argument to _AC_PATH_PROGS_FEATURE_TEST.
# On each iteration run CHECK-CMD on an input file, storing the value
# of PROGPATH in CACHE-VAR if the CHECK-CMD succeeds.  The input file
# is always one line, starting with only 10 characters, and doubling
# in length at each iteration until approx 10000 characters or the
# feature check succeeds.  The feature check is called at each
# iteration by appending (optionally, MATCH-STRING and) a newline
# to the file, and using the result as input to CHECK-CMD.
m4_define([_AC_FEATURE_CHECK_LENGTH],
[# Check for GNU $1 and select it if it is found.
  _AC_PATH_PROG_FLAVOR_GNU([$$1],
    [$2="$$1" $1_found=:],
  [ac_count=0
  AS_ECHO_N([0123456789]) >"conftest.in"
  while :
  do
    cat "conftest.in" "conftest.in" >"conftest.tmp"
    mv "conftest.tmp" "conftest.in"
    cp "conftest.in" "conftest.nl"
    AS_ECHO(['$4']) >> "conftest.nl"
    $3 < "conftest.nl" >"conftest.out" 2>/dev/null || break
    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
    AS_VAR_ARITH([ac_count], [$ac_count + 1])
    if test $ac_count -gt ${$1_max-0}; then
      # Best one so far, save it but keep looking for a better one
      $2="$$1"
dnl   # Using $1_max so that each tool feature checked gets its
dnl   # own variable.  Don't reset it otherwise the implied search
dnl   # for best performing tool in a list breaks down.
      $1_max=$ac_count
    fi
    # 10*(2^10) chars as input seems more than enough
    test $ac_count -gt 10 && break
  done
  rm -f conftest.in conftest.tmp conftest.nl conftest.out])dnl
])


# _AC_PATH_PROG_FLAVOR_GNU(PROGRAM-PATH, IF-SUCCESS, [IF-FAILURE])
# ----------------------------------------------------------------
m4_define([_AC_PATH_PROG_FLAVOR_GNU],
[# Check for GNU $1
case `"$1" --version 2>&1` in @%:@(
*GNU*)
  $2;;
m4_ifval([$3],
[@%:@(
*)
  $3;;
])esac
])# _AC_PATH_PROG_FLAVOR_GNU


# AC_PROG_INSTALL
# ---------------
AN_MAKEVAR([INSTALL], [AC_PROG_INSTALL])
AN_PROGRAM([install], [AC_PROG_INSTALL])
AC_DEFUN_ONCE([AC_PROG_INSTALL],
[AC_REQUIRE_AUX_FILE([install-sh])dnl
# Find a good install program.  We prefer a C program (faster),
# so one script is as good as another.  But avoid the broken or
# incompatible versions:
# SysV /etc/install, /usr/sbin/install
# SunOS /usr/etc/install
# IRIX /sbin/install
# AIX /bin/install
# AmigaOS /C/install, which installs bootblocks on floppy discs
# AIX 4 /usr/bin/installbsd, which doesn't work without a -g flag
# AFS /usr/afsws/bin/install, which mishandles nonexistent args
# SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
# OS/2's system install, which has a completely different semantic
# ./install, which can be erroneously created by make from ./install.sh.
# Reject install programs that cannot install multiple files.
AC_MSG_CHECKING([for a BSD-compatible install])
if test -z "$INSTALL"; then
AC_CACHE_VAL(ac_cv_path_install,
[_AS_PATH_WALK([$PATH],
[[# Account for fact that we put trailing slashes in our PATH walk.
case $as_dir in @%:@((
  ./ | /[cC]/* | \
  /etc/* | /usr/sbin/* | /usr/etc/* | /sbin/* | /usr/afsws/bin/* | \
  ?:[\\/]os2[\\/]install[\\/]* | ?:[\\/]OS2[\\/]INSTALL[\\/]* | \
  /usr/ucb/* ) ;;
  *)]
    # OSF/1 and SCO ODT 3.0 have their own names for install.
    # Don't use installbsd from OSF/1 since it installs stuff as root
    # by default.
    for ac_prog in ginstall scoinst install; do
      for ac_exec_ext in '' $ac_executable_extensions; do
	if AS_EXECUTABLE_P(["$as_dir$ac_prog$ac_exec_ext"]); then
	  if test $ac_prog = install &&
	    grep dspmsg "$as_dir$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
	    # AIX install.  It has an incompatible calling convention.
	    :
	  elif test $ac_prog = install &&
	    grep pwplus "$as_dir$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
	    # program-specific install script used by HP pwplus--don't use.
	    :
	  else
	    rm -rf conftest.one conftest.two conftest.dir
	    echo one > conftest.one
	    echo two > conftest.two
	    mkdir conftest.dir
	    if "$as_dir$ac_prog$ac_exec_ext" -c conftest.one conftest.two "`pwd`/conftest.dir/" &&
	      test -s conftest.one && test -s conftest.two &&
	      test -s conftest.dir/conftest.one &&
	      test -s conftest.dir/conftest.two
	    then
	      ac_cv_path_install="$as_dir$ac_prog$ac_exec_ext -c"
	      break 3
	    fi
	  fi
	fi
      done
    done
    ;;
esac
])
rm -rf conftest.one conftest.two conftest.dir
])dnl
  if test ${ac_cv_path_install+y}; then
    INSTALL=$ac_cv_path_install
  else
    # As a last resort, use the slow shell script.  Don't cache a
    # value for INSTALL within a source directory, because that will
    # break other packages using the cache if that directory is
    # removed, or if the value is a relative name.
    INSTALL=$ac_install_sh
  fi
fi
dnl Do special magic for INSTALL instead of AC_SUBST, to get
dnl relative names right.
AC_MSG_RESULT([$INSTALL])

# Use test -z because SunOS4 sh mishandles braces in ${var-val}.
# It thinks the first close brace ends the variable substitution.
test -z "$INSTALL_PROGRAM" && INSTALL_PROGRAM='${INSTALL}'
AC_SUBST(INSTALL_PROGRAM)dnl

test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL}'
AC_SUBST(INSTALL_SCRIPT)dnl

test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
AC_SUBST(INSTALL_DATA)dnl
])# AC_PROG_INSTALL


# AC_PROG_MKDIR_P
# ---------------
# Check whether 'mkdir -p' is known to be race-free, and fall back to
# install-sh -d otherwise.
#
# Automake 1.8 used 'mkdir -m 0755 -p --' to ensure that directories
# created by 'make install' are always world readable, even if the
# installer happens to have an overly restrictive umask (e.g. 077).
# This was a mistake.  There are at least two reasons why we must not
# use '-m 0755':
#   - it causes special bits like SGID to be ignored,
#   - it may be too restrictive (some setups expect 775 directories).
#
# Do not use -m 0755 and let people choose whatever they expect by
# setting umask.
#
# Some implementations (such as Solaris 10's) are vulnerable to race conditions:
# if a parallel make tries to run 'mkdir -p a/b' and 'mkdir -p a/c'
# concurrently, both version can detect that a/ is missing, but only
# one can create it and the other will error out.  Users of these
# implementations should install and use GNU mkdir instead;
# on Solaris 10, this is /opt/sfw/bin/mkdir.
#
# Automake used to define mkdir_p as 'mkdir -p .', in order to
# allow $(mkdir_p) to be used without argument.  As in
#   $(mkdir_p) $(somedir)
# where $(somedir) is conditionally defined.  However we don't do
# that for MKDIR_P.
#  * in practice we call $(MKDIR_P) on directories such as
#       $(MKDIR_P) "$(DESTDIR)$(somedir)"
#     and we don't want to create $(DESTDIR) if $(somedir) is empty.
#     To support the latter case, we have to write
#       test -z "$(somedir)" || $(MKDIR_P) "$(DESTDIR)$(somedir)"
#     so $(MKDIR_P) always has an argument.
#     We will have better chances of detecting a missing test if
#     $(MKDIR_P) complains about missing arguments.
#   * $(MKDIR_P) is named after 'mkdir -p' and we don't expect this
#     to accept no argument.
#   * having something like 'mkdir .' in the output is unsightly.
#
AN_MAKEVAR([MKDIR_P], [AC_PROG_MKDIR_P])
AC_DEFUN_ONCE([AC_PROG_MKDIR_P],
[AC_REQUIRE_AUX_FILE([install-sh])dnl
AC_MSG_CHECKING([for a race-free mkdir -p])
if test -z "$MKDIR_P"; then
  AC_CACHE_VAL([ac_cv_path_mkdir],
    [_AS_PATH_WALK([$PATH$PATH_SEPARATOR/opt/sfw/bin],
      [for ac_prog in mkdir gmkdir; do
	 for ac_exec_ext in '' $ac_executable_extensions; do
	   AS_EXECUTABLE_P(["$as_dir$ac_prog$ac_exec_ext"]) || continue
	   case `"$as_dir$ac_prog$ac_exec_ext" --version 2>&1` in #(
	     'mkdir ('*'coreutils) '* | \
	     *'BusyBox '* | \
	     'mkdir (fileutils) '4.1*)
	       ac_cv_path_mkdir=$as_dir$ac_prog$ac_exec_ext
	       break 3;;
	   esac
	 done
       done])])
  test -d ./--version && rmdir ./--version
  if test ${ac_cv_path_mkdir+y}; then
    MKDIR_P="$ac_cv_path_mkdir -p"
  else
    # As a last resort, use plain mkdir -p,
    # in the hope it doesn't have the bugs of ancient mkdir.
    MKDIR_P='mkdir -p'
  fi
fi
dnl status.m4 does special magic for MKDIR_P instead of AC_SUBST,
dnl to get relative names right.  However, also AC_SUBST here so
dnl that Automake versions before 1.10 will pick it up (they do not
dnl trace AC_SUBST_TRACE).
dnl FIXME: Remove this once we drop support for Automake < 1.10.
AC_SUBST([MKDIR_P])dnl
AC_MSG_RESULT([$MKDIR_P])
])# AC_PROG_MKDIR_P


# AC_PROG_LEX
# -----------
# Look for flex or lex.  Set its associated library to LEXLIB.
# Check if lex declares yytext as a char * by default, not a char[].
AN_MAKEVAR([LEX],  [AC_PROG_LEX])
AN_PROGRAM([lex],  [AC_PROG_LEX])
AN_PROGRAM([flex], [AC_PROG_LEX])
AC_DEFUN([AC_PROG_LEX],
[m4_case($#,
  [0], [],
  [1], [],
  [m4_fatal([too many arguments to $0])])]dnl
[_$0(m4_normalize([$1]))])

AC_DEFUN([_AC_PROG_LEX],
[m4_case([$1],
  [yywrap], [],
  [noyywrap], [],
  [yywrap noyywrap],
    [m4_fatal([AC_PROG_LEX: yywrap and noyywrap are mutually exclusive])],
  [noyywrap yywrap],
    [m4_fatal([AC_PROG_LEX: yywrap and noyywrap are mutually exclusive])],
  [],
    [m4_warn([obsolete],
      [AC_PROG_LEX without either yywrap or noyywrap is obsolete])],
  [m4_fatal([AC_PROG_LEX: unrecognized argument: $1])])]dnl
dnl We can't use AC_DEFUN_ONCE because this macro takes arguments.
dnl Silently skip a second invocation if the options match;
dnl warn if they don't.
[m4_ifdef([_AC_PROG_LEX_options],
  [m4_if([$1], m4_defn([_AC_PROG_LEX_options]), [],
    [m4_warn([syntax], [AC_PROG_LEX used twice with mismatched options])])],
[dnl
dnl _AC_PROG_LEX_options not defined: first use
m4_define([_AC_PROG_LEX_options], [$1])dnl
AC_CHECK_PROGS(LEX, flex lex, :)
  if test "x$LEX" != "x:"; then
    _AC_PROG_LEX_YYTEXT_DECL([$1])
fi])])


# _AC_PROG_LEX_YYTEXT_DECL
# ------------------------
# Check for the Lex output root, the Lex library, and whether Lex
# declares yytext as a char * by default.
AC_DEFUN([_AC_PROG_LEX_YYTEXT_DECL],
[cat >conftest.l <<_ACEOF[
%{
#ifdef __cplusplus
extern "C"
#endif
int yywrap(void);
%}
%%
a { ECHO; }
b { REJECT; }
c { yymore (); }
d { yyless (1); }
e { /* IRIX 6.5 flex 2.5.4 underquotes its yyless argument.  */
#ifdef __cplusplus
    yyless ((yyinput () != 0));
#else
    yyless ((input () != 0));
#endif
  }
f { unput (yytext[0]); }
. { BEGIN INITIAL; }
%%
#ifdef YYTEXT_POINTER
extern char *yytext;
#endif
int
yywrap (void)
{
  return 1;
}
int
main (void)
{
  return ! yylex ();
}
]_ACEOF
AC_CACHE_CHECK([for lex output file root], [ac_cv_prog_lex_root], [
ac_cv_prog_lex_root=unknown
_AC_DO_VAR(LEX conftest.l) &&
if test -f lex.yy.c; then
  ac_cv_prog_lex_root=lex.yy
elif test -f lexyy.c; then
  ac_cv_prog_lex_root=lexyy
fi])
AS_IF([test "$ac_cv_prog_lex_root" = unknown],
  [AC_MSG_WARN([cannot find output from $LEX; giving up on $LEX])
   LEX=: LEXLIB=])
AC_SUBST([LEX_OUTPUT_ROOT], [$ac_cv_prog_lex_root])dnl

AS_VAR_SET_IF([LEXLIB], [], [
  AC_CACHE_CHECK([for lex library], [ac_cv_lib_lex], [
    ac_save_LIBS="$LIBS"
    ac_found=false
    for ac_cv_lib_lex in 'none needed' -lfl -ll 'not found'; do
      AS_CASE([$ac_cv_lib_lex],
        ['none needed'], [],
        ['not found'],   [break],
        [*],             [LIBS="$ac_cv_lib_lex $ac_save_LIBS"])

      AC_LINK_IFELSE([AC_LANG_DEFINES_PROVIDED[`cat $LEX_OUTPUT_ROOT.c`]],
	[ac_found=:])
      if $ac_found; then
        break
      fi
    done
    LIBS="$ac_save_LIBS"
  ])
  AS_IF(
     [test "$ac_cv_lib_lex" = 'not found'],
	[AC_MSG_WARN([required lex library not found; giving up on $LEX])
	 LEX=: LEXLIB=],
     [test "$ac_cv_lib_lex" = 'none needed'],
        [LEXLIB=''],
	[LEXLIB=$ac_cv_lib_lex])
dnl
dnl For compatibility with autoconf 2.69 and prior, if $1 is not 'noyywrap',
dnl and we didn't already set LEXLIB to -ll or -lfl, see if one of those
dnl libraries provides yywrap and set LEXLIB to it if so.  If $1 is 'yywrap',
dnl and we don't find a library that provides yywrap, we fail.
  m4_case([$1],
    [noyywrap],
      [],
    [yywrap],
      [ac_save_LIBS="$LIBS"
      AS_IF([test -n "$LEXLIB"],
        [LIBS="$LEXLIB"
        AC_CHECK_FUNC([yywrap],
          [:],
          [AC_MSG_WARN([$LEXLIB does not contain yywrap; giving up on $LEX])
          LEX=: LEXLIB=])
        ],
        [LIBS=
        AC_SEARCH_LIBS([yywrap], [fl l], [LEXLIB="$LIBS"])
        AS_IF([test x"$ac_cv_search_yywrap" = xno],
          [AC_MSG_WARN([yywrap not found; giving up on $LEX])
          LEX=: LEXLIB=])])
      LIBS="$ac_save_LIBS"],
    [],
      [ac_save_LIBS="$LIBS"
      LIBS=
      AC_SEARCH_LIBS([yywrap], [fl l], [LEXLIB="$LIBS"])
      LIBS="$ac_save_LIBS"])dnl
])
AC_SUBST(LEXLIB)

dnl This test is done last so that we don't define YYTEXT_POINTER if
dnl any of the above tests gave up on lex.
AS_IF([test "$LEX" != :], [
AC_CACHE_CHECK(whether yytext is a pointer, ac_cv_prog_lex_yytext_pointer,
[# POSIX says lex can declare yytext either as a pointer or an array; the
# default is implementation-dependent.  Figure out which it is, since
# not all implementations provide the %pointer and %array declarations.
ac_cv_prog_lex_yytext_pointer=no
AC_COMPILE_IFELSE([AC_LANG_DEFINES_PROVIDED
  [#define YYTEXT_POINTER 1
`cat $LEX_OUTPUT_ROOT.c`]],
  [ac_cv_prog_lex_yytext_pointer=yes])
])
dnl
if test $ac_cv_prog_lex_yytext_pointer = yes; then
  AC_DEFINE(YYTEXT_POINTER, 1,
	    [Define to 1 if 'lex' declares 'yytext' as a 'char *' by default,
	     not a 'char[]'.])
fi
])
rm -f conftest.l $LEX_OUTPUT_ROOT.c
])# _AC_PROG_LEX_YYTEXT_DECL


# Require AC_PROG_LEX in case some people were just calling this macro.
AU_DEFUN([AC_DECL_YYTEXT],  [AC_PROG_LEX])


# AC_PROG_LN_S
# ------------
AN_MAKEVAR([LN], [AC_PROG_LN_S])
AN_PROGRAM([ln], [AC_PROG_LN_S])
AC_DEFUN([AC_PROG_LN_S],
[AC_MSG_CHECKING([whether ln -s works])
AC_SUBST([LN_S], [$as_ln_s])dnl
if test "$LN_S" = "ln -s"; then
  AC_MSG_RESULT([yes])
else
  AC_MSG_RESULT([no, using $LN_S])
fi
])# AC_PROG_LN_S


# AC_PROG_MAKE_SET
# ----------------
# Define SET_MAKE to set ${MAKE} if Make does not do so automatically.  If Make
# does not run the test Makefile, we assume that the Make program the user will
# invoke does set $(MAKE).  This is typical, and emitting 'MAKE=foomake' is
# always wrong if 'foomake' is not available or does not work.
AN_MAKEVAR([MAKE], [AC_PROG_MAKE_SET])
AN_PROGRAM([make], [AC_PROG_MAKE_SET])
AC_DEFUN([AC_PROG_MAKE_SET],
[AC_MSG_CHECKING([whether ${MAKE-make} sets \$(MAKE)])
set x ${MAKE-make}
ac_make=`AS_ECHO(["$[2]"]) | sed 's/+/p/g; s/[[^a-zA-Z0-9_]]/_/g'`
AC_CACHE_VAL(ac_cv_prog_make_${ac_make}_set,
[cat >conftest.make <<\_ACEOF
SHELL = /bin/sh
all:
	@printf '%s\n' '@@@%%%=$(MAKE)=@@@%%%'
_ACEOF
# GNU make sometimes prints "make[1]: Entering ...", which would confuse us.
case `${MAKE-make} -f conftest.make 2>/dev/null` in
  *@@@%%%=?*=@@@%%%*)
    eval ac_cv_prog_make_${ac_make}_set=yes;;
  *)
    eval ac_cv_prog_make_${ac_make}_set=no;;
esac
rm -f conftest.make])dnl
if eval test \$ac_cv_prog_make_${ac_make}_set = yes; then
  AC_MSG_RESULT([yes])
  SET_MAKE=
else
  AC_MSG_RESULT([no])
  SET_MAKE="MAKE=${MAKE-make}"
fi
AC_SUBST([SET_MAKE])dnl
])# AC_PROG_MAKE_SET


# AC_PROG_RANLIB
# --------------
AN_MAKEVAR([RANLIB], [AC_PROG_RANLIB])
AN_PROGRAM([ranlib], [AC_PROG_RANLIB])
AC_DEFUN([AC_PROG_RANLIB],
[AC_CHECK_TOOL(RANLIB, ranlib, :)])


# AC_RSH
# ------
# I don't know what it used to do, but it no longer does.
AU_DEFUN([AC_RSH], [],
[$0 is no longer supported.  Remove this warning when you
adjust the code.])


# AC_PROG_SED
# -----------
# Check for a fully functional sed program that truncates
# as few characters as possible.  Prefer GNU sed if found.
AC_DEFUN([AC_PROG_SED],
[AC_CACHE_CHECK([for a sed that does not truncate output], ac_cv_path_SED,
    [dnl ac_script should not contain more than 99 commands (for HP-UX sed),
     dnl but more than about 7000 bytes, to catch a limit in Solaris 8 /usr/ucb/sed.
     ac_script=s/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/
     for ac_i in 1 2 3 4 5 6 7; do
       ac_script="$ac_script$as_nl$ac_script"
     done
     echo "$ac_script" 2>/dev/null | sed 99q >conftest.sed
     AS_UNSET([ac_script])
     _AC_PATH_PROGS_FEATURE_CHECK(SED, [sed gsed],
	[_AC_FEATURE_CHECK_LENGTH([ac_path_SED], [ac_cv_path_SED],
		["$ac_path_SED" -f conftest.sed])])])
 SED="$ac_cv_path_SED"
 AC_SUBST([SED])dnl
 rm -f conftest.sed
])# AC_PROG_SED


# AC_PROG_YACC
# ------------
AN_MAKEVAR([BISON],  [AC_PROG_YACC])
AN_MAKEVAR([YACC],  [AC_PROG_YACC])
AN_MAKEVAR([YFLAGS],  [AC_PROG_YACC])
AN_PROGRAM([yacc],  [AC_PROG_YACC])
AN_PROGRAM([byacc], [AC_PROG_YACC])
AN_PROGRAM([bison], [AC_PROG_YACC])
AC_DEFUN([AC_PROG_YACC],
[AC_CHECK_PROGS(YACC, 'bison -y' byacc, yacc)dnl
AC_ARG_VAR(YACC,
[The 'Yet Another Compiler Compiler' implementation to use.  Defaults to
the first program found out of: 'bison -y', 'byacc', 'yacc'.])dnl
AC_ARG_VAR(YFLAGS,
[The list of arguments that will be passed by default to $YACC.  This script
will default YFLAGS to the empty string to avoid a default value of '-d' given
by some make applications.])])
