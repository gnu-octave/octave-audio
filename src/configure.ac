#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
#
### Copyright (C) 2019-2023 John Donoghue <john.donoghue@ieee.org>
###
### This program is free software; you can redistribute it and/or
### modify it under the terms of the GNU General Public License as
### published by the Free Software Foundation; either version 3 of the
### License, or (at your option) any later version.
###
### This program is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
### General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with this program; if not, see
### <http://www.gnu.org/licenses/>.

AC_PREREQ([2.67])
AC_INIT([octave audio package], [2.0.9])
AC_CONFIG_HEADERS([config.h])

# Avoid warnings for redefining AH-generated preprocessor symbols of
# Octave.
AH_TOP([#include "undef-ah-octave.h"])

AC_CONFIG_MACRO_DIRS([m4])

AC_CANONICAL_HOST
AC_CANONICAL_TARGET

# Checks for programs.
AC_PROG_SED
AC_PROG_CXX
AC_LANG(C++)

AC_CHECK_TOOL([MKOCTFILE], [mkoctfile], [none])
if [ test "$MKOCTFILE" = "none" ]; then
  AC_MSG_ERROR([mkoctfile required to install $PACKAGE_NAME])
fi

# try get around possible spaces in the path
if test "X${IGNORE_MINGW_PATH_MODIFICATION}" == "X"; then
case $host_os in
  mingw*)
    # try demangle spaces in escaped input strings
    MKOCTFILE=`echo $MKOCTFILE | $SED "s,\\\\\ ,?,g"`
    ;;
  *)
    ;;
esac
fi

# Check for RTMIDI
save_CXXFLAGS="$CXXFLAGS"
save_LIBS="$LIBS"
PKG_CHECK_MODULES(RTMIDI,rtmidi,[have_rtmidi=yes],[have_rtmidi=no])
if test "$have_rtmidi" = "yes"; then
  AC_DEFINE(HAVE_RTMIDI, 1, [Define to 1 to use the rtmidi library.])
  CXXFLAGS="$CXXFLAGS $RTMIDI_CFLAGS"
  LIBS="$LIBS $RTMIDI_LIBS"
else
  AC_MSG_ERROR([RTMIDI required to install $PACKAGE_NAME])
fi

# Check for RtMidi::getApiName
AC_MSG_CHECKING([RtMidi::getApiName])
have_get_api_name=no
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
   #include <RtMidi.h>
   #include <string>
  ]], [
    std::string n = RtMidi::getApiName(RtMidi::LINUX_ALSA);
  ])],
 [AC_MSG_RESULT([yes])
  have_api_name=yes],
 [AC_MSG_RESULT([no])]
)
CXXFLAGS=$save_CXXFLAGS
LIBS=$save_LIBS

if test $have_get_api_name = yes; then
  AC_DEFINE([HAVE_RTMIDI_GETAPINAME], [1], [have the RtMidi::getApiName function])
fi

# Check for pthreads

AX_PTHREAD([],[AC_MSG_ERROR([thread library is needed to install $PACKAGE_NAME])])

# Checks for octave depreciated symbols
## Simple symbol alternatives of different Octave versions.
save_altsyms_CXX="$CXX"
save_altsyms_CXXFLAGS="$CXXFLAGS"
save_altsyms_LDFLAGS="$LDFLAGS"
save_altsyms_LIBS="$LIBS"
OCTINCLUDEDIR="${OCTINCLUDEDIR:-`$MKOCTFILE -p OCTINCLUDEDIR`}/.."
OCTLIBDIR=${OCTLIBDIR:-`$MKOCTFILE -p OCTLIBDIR`}

if test "X${IGNORE_MINGW_PATH_MODIFICATION}" == "X"; then
  MSYSTEM="${MSYSTEM}"
else
  MSYSTEM="none"
fi

case X$MSYSTEM in
  XMINGW64*)
    OCTAVE_HOME=`${MKOCTFILE} -p OCTAVE_HOME | $SED 's,\\\\,/,g'`
    # change \ to / and replace octave home part with mingw part
    OCTINCLUDEDIR=`echo $OCTINCLUDEDIR | $SED -e 's,\\\\,/,g' -e "s,${OCTAVE_HOME},/mingw64,g"`
    OCTLIBDIR=`echo $OCTLIBDIR | $SED -e 's,\\\\,/,g' -e "s,${OCTAVE_HOME},/mingw64,g"`
    ;;
  XMINGW32*)
    OCTAVE_HOME=`${MKOCTFILE} -p OCTAVE_HOME | $SED 's,\\\\,/,g'`
    # change \ to / and replace octave home part with mingw part
    OCTINCLUDEDIR=`echo $OCTINCLUDEDIR | $SED -e 's,\\\\,/,g' -e "s,${OCTAVE_HOME},/mingw32,g"`
    OCTLIBDIR=`echo $OCTLIBDIR | $SED -e 's,\\\\,/,g -e "s,${OCTAVE_HOME},/mingw32,g"'`
    ;;
  *)
    ;;
esac

CXX=`${MKOCTFILE} -p CXX`
CXXFLAGS="-I$OCTINCLUDEDIR $CXXFLAGS"
LDFLAGS="-L$OCTLIBDIR $LDFLAGS"
LIBS="-loctinterp $LIBS"

OF_OCTAVE_LIST_ALT_SYMS([
[dnl
  [feval],
  [octave::feval],
  [[octave::feval ("date");]],
  [OCTAVE__FEVAL],
  [[#include <octave/parse.h>]],
  [[#include <octave/parse.h>]]
],

[dnl
  [is_float_type],
  [isfloat],
  [[octave_value ().isfloat ();]],
  [OV_ISFLOAT],
  [],
  []
],

[dnl
  [is_integer_type],
  [isinteger],
  [[octave_value ().isinteger ();]],
  [OV_ISINTEGER],
  [],
  []
],

[dnl
  [is_cell],
  [iscell],
  [[octave_value ().iscell ();]],
  [OV_ISCELL],
  [],
  []
],

[dnl
  [octave_execution_exception],
  [octave::execution_exception],
  [[octave::execution_exception err;]],
  [OCTAVE_EXECUTION_EXCEPTION],
  [#include <octave/quit.h>],
  [#include <octave/quit.h>]
],

[dnl
  [octave_base_value],
  [octave_base_dld_value],
  [[octave_base_dld_value tmp;]],
  [OCTAVE_BASE_CLASS],
  [],
  []
]

],[oct-alt-includes.h])

# check if method of getting execution exception message
AC_MSG_CHECKING([for execution_exception message field])
octave_execution_field=none
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
   #include <octave/oct.h>
   #include <octave/quit.h>
  ]], [
    OCTAVE_EXECUTION_EXCEPTION err; err.message();
  ])],
 [octave_execution_field=message],
 [
   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
     #include <octave/oct.h>
     #include <octave/quit.h>
    ]], [
      OCTAVE_EXECUTION_EXCEPTION err; err.info();
    ])],
    [octave_execution_field=info],
    [])
 ]
)
AC_MSG_RESULT([$octave_execution_field])
AC_DEFINE_UNQUOTED([OCTAVE_EXCEPTION_MESSAGE],$octave_execution_field,[execution_exception message field])

if test $octave_execution_field != none; then
AC_DEFINE([HAS_OCTAVE_EXCEPTION_MESSAGE],[1],[has some kid of execution_exception message field])
fi

AC_MSG_CHECKING([for octave_base_value count field])
octave_count_field=count
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
   #include <octave/oct.h>
   #ifdef HAVE_CONFIG_H
   #  include "config.h"
   #endif
   class test_base_class : public octave_base_value
   {
   public:
     test_base_class() {}
     ~test_base_class() {}
     void test() { m_count ++; }
     bool is_object (void) const { return true; }
   };
  ]], [
    test_base_class t;  t.is_object();
  ])],
 [octave_count_field=m_count],
 [octave_count_field=count]
)
AC_MSG_RESULT([$octave_count_field])
AC_DEFINE_UNQUOTED([OV_COUNT],$octave_count_field,[octave_base_value ref count field])

CXX=$save_altsyms_CXX
CXXFLAGS=$save_altsyms_CXXFLAGS
LDFLAGS=$save_altsyms_LDFLAGS
LIBS=$save_altsyms_LIBS

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

AC_MSG_NOTICE([

$PACKAGE_NAME is configured with:
  LIBS:     $LIBS $RTMIDI_LIBS $PTHREAD_LIBS
  CXXFLAGS: $CXXFLAGS $RTMIDI_CFLAGS $PTHREAD_CFLAGS $DEFS
])

