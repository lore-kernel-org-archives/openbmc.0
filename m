Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D3F1A0F5B
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:00:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447902030654158.73632753019535;
 Wed, 18 Nov 2015 19:00:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Initial autotools support
Date: Wed, 18 Nov 2015 22:00:29 -0500
Message-Id: <1447902029-2805-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 03:00:37 -0000

From: Stewart Smith <stewart@linux.vnet.ibm.com>

This switches us over to use autotools rather than custom makefiles.
This brings us into line with the defacto standard for building userspace.

It also adds "make dist" and "make check" targets that build a source
tarball and run the test suite (respectively).

A simple "make distcheck" will build a source tarball, extract it, build
it and run tests to ensure that the distributed source tarball is buildable
and works.

If multiple tests are added "make -j20 distcheck" does exactly as you'd
expect: runs up to 20 concurrent tests.

If building from git "autoreconf -i" will generate configure, if building
from source tarball, it's already there. This is the standard autotools
method of being able to build on systems that don't have the version of
autotools that you support.

NOTE: the current library/binary split is unchanged, it's still odd
NOTE: testaddsel isn't actually built, as it doesn't build in master

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 Makefile                       |  67 --------------------
 Makefile.am                    |  28 +++++++++
 apphandler.C                   |   2 +-
 chassishandler.C               |   2 +-
 configure.ac                   |  28 +++++++++
 dcmihandler.C                  |   4 +-
 host-ipmid/ipmid-api.h         |  98 ++++++++++++++++++++++++++++++
 ipmid-api.h                    |  98 ------------------------------
 ipmid.H                        |   2 +-
 m4/ax_cxx_compile_stdcxx_14.m4 | 135 +++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C                |   2 +-
 storagehandler.C               |   2 +-
 testaddsel.C                   |   3 +-
 testit.C                       |   3 +-
 transporthandler.C             |   2 +-
 15 files changed, 300 insertions(+), 176 deletions(-)
 delete mode 100644 Makefile
 create mode 100644 Makefile.am
 create mode 100644 configure.ac
 create mode 100644 host-ipmid/ipmid-api.h
 delete mode 100644 ipmid-api.h
 create mode 100644 m4/ax_cxx_compile_stdcxx_14.m4

diff --git a/Makefile b/Makefile
deleted file mode 100644
index 1a37c0f..0000000
--- a/Makefile
+++ /dev/null
@@ -1,67 +0,0 @@
-CXX ?= $(CROSS_COMPILE)g++
-
-TESTER = testit
-
-TESTADDSEL = testaddsel
-
-DAEMON = ipmid
-DAEMON_OBJ  = $(DAEMON).o
-
-
-LIB_APP_OBJ = apphandler.o     \
-              sensorhandler.o  \
-              storagehandler.o \
-              chassishandler.o \
-              dcmihandler.o    \
-              ipmisensor.o     \
-              storageaddsel.o  \
-              transporthandler.o  \
-
-
-TESTADDSEL_OBJ = $(TESTADDSEL).o \
-                 storageaddsel.o
-
-TESTER_OBJ = ipmisensor.o 	   \
-	     testit.o
-
-LIB_APP     = libapphandler.so
-INSTALLED_LIBS += $(LIB_APP)
-INSTALLED_HEADERS = ipmid-api.h
-
-INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 
-LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
-IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
-
-DESTDIR ?= /
-SBINDIR ?= /usr/sbin
-INCLUDEDIR ?= /usr/include
-LIBDIR ?= /usr/lib
-
-all: $(DAEMON) $(LIB_APP) $(TESTER)
-
-%.o: %.C
-	$(CXX) -std=c++14 -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
-
-$(LIB_APP): $(LIB_APP_OBJ)
-	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
-
-$(DAEMON): $(DAEMON_OBJ)
-	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
-
-$(TESTER): $(TESTER_OBJ)
-	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
-
-clean:
-	rm -f $(DAEMON) $(TESTER) *.o *.so
-
-$(TESTADDSEL): $(TESTADDSEL_OBJ)
-	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
-		
-install:
-		install -m 0755 -d $(DESTDIR)$(SBINDIR)
-		install -m 0755 ipmid $(DESTDIR)$(SBINDIR)
-		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid
-		install -m 0755 $(INSTALLED_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid
-		install -m 0755 -d $(DESTDIR)$(INCLUDEDIR)/host-ipmid
-		install -m 0644 $(INSTALLED_HEADERS) $(DESTDIR)$(INCLUDEDIR)/host-ipmid
-
diff --git a/Makefile.am b/Makefile.am
new file mode 100644
index 0000000..46c6f7c
--- /dev/null
+++ b/Makefile.am
@@ -0,0 +1,28 @@
+ACLOCAL_AMFLAGS = -I m4
+
+bin_PROGRAMS = ipmid
+
+ipmid_SOURCES = ipmid.C ipmid.H
+ipmid_LDADD = host-ipmid/libapphandler.la
+ipmid_CXXFLAGS = -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
+ipmid_LDFLAGS = $(libsystemd_LIBS) $(LIBADD_DLOPEN)
+
+nobase_lib_LTLIBRARIES = host-ipmid/libapphandler.la
+nobase_include_HEADERS = host-ipmid/ipmid-api.h
+host_ipmid_libapphandler_la_SOURCES = apphandler.C apphandler.h \
+              sensorhandler.C sensorhandler.h \
+              storagehandler.C storagehandler.h \
+              chassishandler.C chassishandler.h \
+              dcmihandler.C dcmihandler.h \
+              ipmisensor.C \
+              storageaddsel.C storageaddsel.h  \
+              transporthandler.C transporthandler.h
+
+host_ipmid_libapphandler_la_CXXFLAGS = $(libsystemd_CFLAGS)
+host_ipmid_libapphandler_la_LDFLAGS = -version-info 0:0:0 $(libsystemd_LIBS)
+
+check_PROGRAMS = testit
+TESTS = $(check_PROGRAMS)
+
+testit_SOURCES = testit.C
+testit_LDFLAGS = $(libsystemd_LIBS) $(LIBADD_DLOPEN)
diff --git a/apphandler.C b/apphandler.C
index 6467397..d547ced 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -1,5 +1,5 @@
 #include "apphandler.h"
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include "ipmid.H"
 #include <stdio.h>
 #include <string.h>
diff --git a/chassishandler.C b/chassishandler.C
index d00a124..18a9f95 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -1,5 +1,5 @@
 #include "chassishandler.h"
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
diff --git a/configure.ac b/configure.ac
new file mode 100644
index 0000000..430f30a
--- /dev/null
+++ b/configure.ac
@@ -0,0 +1,28 @@
+AC_INIT([host-ipmid], [0.1], [https://github.com/openbmc/phosphor-host-ipmid/issues], [phosphor-host-ipmid], [https://github.com/openbmc/phosphor-host-ipmid])
+AC_PREREQ([2.68])
+AC_CONFIG_SRCDIR([ipmid.C])
+AC_PROG_CC
+AC_CHECK_FUNCS([memmove memset strerror])
+AC_CHECK_HEADERS([stddef.h stdint.h stdlib.h string.h unistd.h])
+AC_CHECK_HEADERS([arpa/inet.h limits.h malloc.h sys/time.h])
+AC_CHECK_FUNCS([strrchr strstr strtol strtoul])
+AC_CHECK_HEADER_STDBOOL
+AC_FUNC_MALLOC
+AC_FUNC_MKTIME
+AC_PROG_CXX
+AX_CXX_COMPILE_STDCXX_14([noext], [mandatory])
+AM_PROG_AR
+AC_TYPE_SIZE_T
+AC_TYPE_UINT32_T
+AC_TYPE_UINT64_T
+AC_TYPE_UINT16_T
+AC_TYPE_UINT8_T
+LT_INIT([dlopen])
+LT_LIB_DLLOAD
+AC_CONFIG_HEADERS([config.h])
+AC_CONFIG_MACRO_DIR([m4])
+PKG_CHECK_MODULES([libsystemd], [libsystemd >= 221])
+AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign dist-xz])
+AM_SILENT_RULES([yes])
+AC_CONFIG_FILES([Makefile])
+AC_OUTPUT
diff --git a/dcmihandler.C b/dcmihandler.C
index fafebdc..45ae940 100644
--- a/dcmihandler.C
+++ b/dcmihandler.C
@@ -1,5 +1,5 @@
 #include "dcmihandler.h"
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
@@ -37,4 +37,4 @@ void register_netfn_dcmi_functions()
     ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit);
     return;
 }
-// 956379
\ No newline at end of file
+// 956379
diff --git a/host-ipmid/ipmid-api.h b/host-ipmid/ipmid-api.h
new file mode 100644
index 0000000..34d3bbe
--- /dev/null
+++ b/host-ipmid/ipmid-api.h
@@ -0,0 +1,98 @@
+#ifndef __HOST_IPMID_IPMI_COMMON_H__
+#define __HOST_IPMID_IPMI_COMMON_H__
+#include <stdlib.h>
+#include <systemd/sd-bus.h>
+
+// length of Completion Code and its ALWAYS _1_
+#define IPMI_CC_LEN 1
+
+// IPMI Net Function number as specified by IPMI V2.0 spec.
+// Example : 
+// NETFUN_APP      =   (0x06 << 2),
+typedef unsigned char   ipmi_netfn_t;
+
+// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
+typedef unsigned char   ipmi_cmd_t;
+
+// Buffer containing data from sender of netfn and command as part of request
+typedef void*           ipmi_request_t;
+
+// This is the response buffer that the provider of [netfn,cmd] will send back
+// to the caller. Provider will allocate the memory inside the handler and then
+// will do a memcpy to this response buffer and also will set the data size
+// parameter to the size of the buffer.
+// EXAMPLE :
+// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+// *data_len = 6;
+// memcpy(response, &str, *data_len);
+typedef void*           ipmi_response_t;
+
+// This buffer contains any *user specific* data that is of interest only to the
+// plugin. For a ipmi function router, this data is opaque. At the time of
+// registering the plugin handlers, plugin may optionally allocate a memory and
+// fill in whatever needed that will be of help during the actual handling of
+// command. IPMID will just pass the netfn, cmd and also this data to plugins
+// during the command handler invocation.
+typedef void*           ipmi_context_t;
+
+// Length of request / response buffer depending on whether the data is a
+// request or a response from a plugin handler.
+typedef size_t*   ipmi_data_len_t;
+
+// Plugin function return the status code
+typedef unsigned char ipmi_ret_t;
+
+// This is the callback handler that the plugin registers with IPMID. IPMI
+// function router will then make a call to this callback handler with the
+// necessary arguments of netfn, cmd, request, response, size and context.
+typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
+                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
+
+// This is the constructor function that is called into by each plugin handlers.
+// When ipmi sets up the callback handlers, a call is made to this with
+// information of netfn, cmd, callback handler pointer and context data.
+// Making this a extern "C" so that plugin libraries written in C can also use
+// it.
+extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
+                                       ipmi_context_t, ipmid_callback_t);
+
+// These are the command network functions, the response
+// network functions are the function + 1. So to determine
+// the proper network function which issued the command
+// associated with a response, subtract 1.
+// Note: these are also shifted left to make room for the LUN.
+enum ipmi_net_fns
+{
+    NETFUN_CHASSIS   =   0x00,
+    NETFUN_BRIDGE    =   0x02,
+    NETFUN_SENSOR    =   0x04,
+    NETFUN_APP       =   0x06,
+    NETFUN_FIRMWARE  =   0x08,
+    NETFUN_STORAGE   =   0x0a,
+    NETFUN_TRANSPORT =   0x0c,
+    NETFUN_GRPEXT    =   0x2c,
+    NETFUN_NONE      =   0x30,
+    NETFUN_OEM       =   0x32
+};
+
+// IPMI commands for net functions. Since this is to be used both by the ipmi
+// function router and also the callback handler registration function, its put
+// in this .H file.
+enum ipmi_netfn_wild_card_cmd
+{
+    IPMI_CMD_WILDCARD       = 0xFF,
+};
+
+// Return (completion) codes from a IPMI operation as needed by IPMI V2.0 spec.
+enum ipmi_return_codes
+{
+    IPMI_CC_OK = 0x00,
+    IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
+    IPMI_CC_INVALID = 0xC1,
+    IPMI_CC_SENSOR_INVALID = 0xCB,
+    IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
+};
+
+sd_bus *ipmid_get_sd_bus_connection(void);
+#endif
diff --git a/ipmid-api.h b/ipmid-api.h
deleted file mode 100644
index 34d3bbe..0000000
--- a/ipmid-api.h
+++ /dev/null
@@ -1,98 +0,0 @@
-#ifndef __HOST_IPMID_IPMI_COMMON_H__
-#define __HOST_IPMID_IPMI_COMMON_H__
-#include <stdlib.h>
-#include <systemd/sd-bus.h>
-
-// length of Completion Code and its ALWAYS _1_
-#define IPMI_CC_LEN 1
-
-// IPMI Net Function number as specified by IPMI V2.0 spec.
-// Example : 
-// NETFUN_APP      =   (0x06 << 2),
-typedef unsigned char   ipmi_netfn_t;
-
-// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
-typedef unsigned char   ipmi_cmd_t;
-
-// Buffer containing data from sender of netfn and command as part of request
-typedef void*           ipmi_request_t;
-
-// This is the response buffer that the provider of [netfn,cmd] will send back
-// to the caller. Provider will allocate the memory inside the handler and then
-// will do a memcpy to this response buffer and also will set the data size
-// parameter to the size of the buffer.
-// EXAMPLE :
-// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
-// *data_len = 6;
-// memcpy(response, &str, *data_len);
-typedef void*           ipmi_response_t;
-
-// This buffer contains any *user specific* data that is of interest only to the
-// plugin. For a ipmi function router, this data is opaque. At the time of
-// registering the plugin handlers, plugin may optionally allocate a memory and
-// fill in whatever needed that will be of help during the actual handling of
-// command. IPMID will just pass the netfn, cmd and also this data to plugins
-// during the command handler invocation.
-typedef void*           ipmi_context_t;
-
-// Length of request / response buffer depending on whether the data is a
-// request or a response from a plugin handler.
-typedef size_t*   ipmi_data_len_t;
-
-// Plugin function return the status code
-typedef unsigned char ipmi_ret_t;
-
-// This is the callback handler that the plugin registers with IPMID. IPMI
-// function router will then make a call to this callback handler with the
-// necessary arguments of netfn, cmd, request, response, size and context.
-typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
-                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
-
-// This is the constructor function that is called into by each plugin handlers.
-// When ipmi sets up the callback handlers, a call is made to this with
-// information of netfn, cmd, callback handler pointer and context data.
-// Making this a extern "C" so that plugin libraries written in C can also use
-// it.
-extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
-                                       ipmi_context_t, ipmid_callback_t);
-
-// These are the command network functions, the response
-// network functions are the function + 1. So to determine
-// the proper network function which issued the command
-// associated with a response, subtract 1.
-// Note: these are also shifted left to make room for the LUN.
-enum ipmi_net_fns
-{
-    NETFUN_CHASSIS   =   0x00,
-    NETFUN_BRIDGE    =   0x02,
-    NETFUN_SENSOR    =   0x04,
-    NETFUN_APP       =   0x06,
-    NETFUN_FIRMWARE  =   0x08,
-    NETFUN_STORAGE   =   0x0a,
-    NETFUN_TRANSPORT =   0x0c,
-    NETFUN_GRPEXT    =   0x2c,
-    NETFUN_NONE      =   0x30,
-    NETFUN_OEM       =   0x32
-};
-
-// IPMI commands for net functions. Since this is to be used both by the ipmi
-// function router and also the callback handler registration function, its put
-// in this .H file.
-enum ipmi_netfn_wild_card_cmd
-{
-    IPMI_CMD_WILDCARD       = 0xFF,
-};
-
-// Return (completion) codes from a IPMI operation as needed by IPMI V2.0 spec.
-enum ipmi_return_codes
-{
-    IPMI_CC_OK = 0x00,
-    IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
-    IPMI_CC_INVALID = 0xC1,
-    IPMI_CC_SENSOR_INVALID = 0xCB,
-    IPMI_CC_RESPONSE_ERROR = 0xCE,
-    IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
-};
-
-sd_bus *ipmid_get_sd_bus_connection(void);
-#endif
diff --git a/ipmid.H b/ipmid.H
index 73b60e6..61a671a 100644
--- a/ipmid.H
+++ b/ipmid.H
@@ -1,6 +1,6 @@
 #ifndef __HOST_IPMID_IPMI_H__
 #define __HOST_IPMID_IPMI_H__
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include <stdio.h>
 
 // When the requester sends in a netfn and a command along with data, this
diff --git a/m4/ax_cxx_compile_stdcxx_14.m4 b/m4/ax_cxx_compile_stdcxx_14.m4
new file mode 100644
index 0000000..20ce4be
--- /dev/null
+++ b/m4/ax_cxx_compile_stdcxx_14.m4
@@ -0,0 +1,135 @@
+#
+# SYNOPSIS
+#
+#   AX_CXX_COMPILE_STDCXX_14([ext|noext],[mandatory|optional])
+#
+# DESCRIPTION
+#
+#   Check for baseline language coverage in the compiler for the C++14
+#   standard; if necessary, add switches to CXXFLAGS to enable support.
+#
+#   The first argument, if specified, indicates whether you insist on an
+#   extended mode (e.g. -std=gnu++14) or a strict conformance mode (e.g.
+#   -std=c++14).  If neither is specified, you get whatever works, with
+#   preference for an extended mode.
+#
+#   The second argument, if specified 'mandatory' or if left unspecified,
+#   indicates that baseline C++14 support is required and that the macro
+#   should error out if no mode with that support is found.  If specified
+#   'optional', then configuration proceeds regardless, after defining
+#   HAVE_CXX14 if and only if a supporting mode is found.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
+#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
+#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
+#
+#   Copying and distribution of this file, with or without modification, are
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 4
+
+m4_define([_AX_CXX_COMPILE_STDCXX_14_testbody], [
+  template <typename T>
+    struct check
+    {
+      static_assert(sizeof(int) <= sizeof(T), "not big enough");
+    };
+
+    typedef check<check<bool>> right_angle_brackets;
+
+    int a;
+    decltype(a) b;
+
+    typedef check<int> check_type;
+    check_type c;
+    check_type&& cr = static_cast<check_type&&>(c);
+
+    auto d = a;
+
+    #include <type_traits>
+
+    constexpr std::enable_if_t<true, int> type_traits_14(int) { return 14; }
+    static_assert(type_traits_14(0) == 14, "missing/broken enable_if_t");
+])
+
+AC_DEFUN([AX_CXX_COMPILE_STDCXX_14], [dnl
+  m4_if([$1], [], [],
+        [$1], [ext], [],
+        [$1], [noext], [],
+        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_14])])dnl
+  m4_if([$2], [], [ax_cxx_compile_cxx14_required=true],
+        [$2], [mandatory], [ax_cxx_compile_cxx14_required=true],
+        [$2], [optional], [ax_cxx_compile_cxx14_required=false],
+        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_14])])
+  AC_LANG_PUSH([C++])dnl
+  ac_success=no
+  AC_CACHE_CHECK(whether $CXX supports C++14 features by default,
+  ax_cv_cxx_compile_cxx14,
+  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_14_testbody])],
+    [ax_cv_cxx_compile_cxx14=yes],
+    [ax_cv_cxx_compile_cxx14=no])])
+  if test x$ax_cv_cxx_compile_cxx14 = xyes; then
+    ac_success=yes
+  fi
+
+  m4_if([$1], [noext], [], [dnl
+  if test x$ac_success = xno; then
+    for switch in -std=gnu++14 -std=gnu++1y; do
+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx14_$switch])
+      AC_CACHE_CHECK(whether $CXX supports C++14 features with $switch,
+                     $cachevar,
+        [ac_save_CXXFLAGS="$CXXFLAGS"
+         CXXFLAGS="$CXXFLAGS $switch"
+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_14_testbody])],
+          [eval $cachevar=yes],
+          [eval $cachevar=no])
+         CXXFLAGS="$ac_save_CXXFLAGS"])
+      if eval test x\$$cachevar = xyes; then
+        CXXFLAGS="$CXXFLAGS $switch"
+        ac_success=yes
+        break
+      fi
+    done
+  fi])
+
+  m4_if([$1], [ext], [], [dnl
+  if test x$ac_success = xno; then
+    for switch in -std=c++14 -std=c++1y; do
+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx14_$switch])
+      AC_CACHE_CHECK(whether $CXX supports C++14 features with $switch,
+                     $cachevar,
+        [ac_save_CXXFLAGS="$CXXFLAGS"
+         CXXFLAGS="$CXXFLAGS $switch"
+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_14_testbody])],
+          [eval $cachevar=yes],
+          [eval $cachevar=no])
+         CXXFLAGS="$ac_save_CXXFLAGS"])
+      if eval test x\$$cachevar = xyes; then
+        CXXFLAGS="$CXXFLAGS $switch"
+        ac_success=yes
+        break
+      fi
+    done
+  fi])
+  AC_LANG_POP([C++])
+  if test x$ax_cxx_compile_cxx14_required = xtrue; then
+    if test x$ac_success = xno; then
+      AC_MSG_ERROR([*** A compiler with support for C++14 language features is required.])
+    fi
+  else
+    if test x$ac_success = xno; then
+      HAVE_CXX14=0
+      AC_MSG_NOTICE([No compiler with C++14 support was found])
+    else
+      HAVE_CXX14=1
+      AC_DEFINE(HAVE_CXX14,1,
+                [define if the compiler supports basic C++14 syntax])
+    fi
+
+    AC_SUBST(HAVE_CXX14)
+  fi
+])
diff --git a/sensorhandler.C b/sensorhandler.C
index cd57dd4..f47d84a 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -1,5 +1,5 @@
 #include "sensorhandler.h"
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
diff --git a/storagehandler.C b/storagehandler.C
index 1459f94..26604d8 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -6,7 +6,7 @@
 
 #include "storagehandler.h"
 #include "storageaddsel.h"
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 
 void register_netfn_storage_functions() __attribute__((constructor));
 
diff --git a/testaddsel.C b/testaddsel.C
index 202200a..daaa3f0 100644
--- a/testaddsel.C
+++ b/testaddsel.C
@@ -6,7 +6,6 @@
 #include <systemd/sd-bus.h>
 #include "sensorhandler.h"
 
-
 extern void send_esel(uint16_t recordid);
 
 sd_bus *bus = NULL;
@@ -104,4 +103,4 @@ finish:
     sd_bus_unref(bus);
 
 	return 0;
-}
\ No newline at end of file
+}
diff --git a/testit.C b/testit.C
index bfd9334..b9230c8 100644
--- a/testit.C
+++ b/testit.C
@@ -3,6 +3,7 @@
 #include <string.h>
 #include <stdint.h>
 
+#include "ipmisensor.C"
 
 unsigned char g_sensortype [][2] = {
     {0xC3, 0x01},
@@ -111,4 +112,4 @@ int main() {
     testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_invalidnumber), "", "");
 
 	return 0;
-}
\ No newline at end of file
+}
diff --git a/transporthandler.C b/transporthandler.C
index ca8522d..33baa41 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -2,7 +2,7 @@
 #include <string.h>
 #include <stdint.h>
 
-#include "ipmid-api.h"
+#include "host-ipmid/ipmid-api.h"
 #include "ipmid.H"
 #include "transporthandler.h"
 
-- 
2.6.3
