Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDBD91A0B56
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 09:30:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457044214904657.7660682645691;
 Thu, 3 Mar 2016 14:30:14 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] RFC: use cmake.
Date: Thu,  3 Mar 2016 16:30:13 -0600
Message-Id: <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_25026_45
X-ZohoMail-Owner: <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>+zmo_0_<openbmc-patches@stwcx.xyz>
X-ZohoMail-Sender: 172.110.7.206
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
X-List-Received-Date: Thu, 03 Mar 2016 22:30:19 -0000

From: Patrick Williams <patrick@stwcx.xyz>

There was a previous proposal to consider autotools (see
openbmc/ipmi-fru-parser#7).  This is an alternative implementation
using cmake.
---
 .gitignore        | 12 +++++++++
 CMakeLists.txt    | 30 ++++++++++++++++++++++
 Makefile          | 75 -------------------------------------------------------
 cmake/sdbus.cmake | 16 ++++++++++++
 4 files changed, 58 insertions(+), 75 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 CMakeLists.txt
 delete mode 100644 Makefile
 create mode 100644 cmake/sdbus.cmake

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..727471a
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,12 @@
+#### vi files ####
+*.swp
+#### --- vi --- ####
+
+#### CMAKE Files ####
+CMakeCache.txt
+CMakeFiles
+CMakeScripts
+Makefile
+cmake_install.cmake
+install_manifest.txt
+#### --- CMAKE --- ####
diff --git a/CMakeLists.txt b/CMakeLists.txt
new file mode 100644
index 0000000..0a00985
--- /dev/null
+++ b/CMakeLists.txt
@@ -0,0 +1,30 @@
+cmake_minimum_required(VERSION 3.1)
+project(ipmi-fru-parser)
+
+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
+set(CMAKE_CXX_STANDARD 14)
+set(CMAKE_CXX_STANDARD_REQUIRED on)
+
+include("cmake/sdbus.cmake")
+
+add_library(writefrudata SHARED
+    frup.c
+    writefrudata.C
+)
+target_link_libraries(writefrudata ${SYSTEMD_LIBRARY})
+install(TARGETS writefrudata LIBRARY DESTINATION lib/host-ipmid)
+
+add_library(strgfnhandler SHARED
+    strgfnhandler.C
+)
+target_link_libraries(strgfnhandler writefrudata)
+install(TARGETS strgfnhandler LIBRARY DESTINATION lib)
+
+add_executable(phosphor-read-eeprom
+    argument.C
+    readeeprom.C
+)
+target_link_libraries(phosphor-read-eeprom writefrudata)
+target_link_libraries(phosphor-read-eeprom ${SYSTEMD_LIBRARY})
+
+install(TARGETS phosphor-read-eeprom RUNTIME DESTINATION bin)
diff --git a/Makefile b/Makefile
deleted file mode 100644
index dc66a77..0000000
--- a/Makefile
+++ /dev/null
@@ -1,75 +0,0 @@
-LIBS += libwritefrudata.so 
-HOST_LIBS += libstrgfnhandler.so 
-libwritefrudata.so_OBJS  += frup.o writefrudata.o
-libstrgfnhandler.so_OBJS += strgfnhandler.o
-
-EXES += phosphor-read-eeprom
-
-phosphor-read-eeprom_OBJS  += readeeprom.o argument.o
-phosphor-read-eeprom_EXTRA_LIBS  += writefrudata
-libstrgfnhandler.so_EXTRA_LIBS  += writefrudata
-libwritefrudata.so_NEEDED  += libsystemd
-phosphor-read-eeprom_NEEDED  += libsystemd
-
-#### -----------------------------------------------------------------------####
-#                                                                              #
-##                       Compilare Regulas Sequi                              ##
-#                                                                              #
-#### -----------------------------------------------------------------------####
-OPTFLAGS ?= -O3 -g -pipe -G -K
-CFLAGS ?= $(OPTFLAGS)
-CXXFLAGS ?= $(OPTFLAGS)
-CFLAGS += -Wall -flto -fPIC
-CXXFLAGS += --std=gnu++14 -Wall -flto -fPIC
-
-__PKG_CONFIG = $(if $1,$(shell pkg-config $2 $1))
-__EXTRA_LIB_RESOLV = $(if $1,$1)
-
-define __BUILD_EXE
-$1 : $$($1_OBJS) | $$(LIBS) $$(HOST_LIBS) 
-		$$(LINK.cpp) -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
-
-$(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
-
-#include $$($1_OBJS:.o=.d)
-endef
-
-$(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
-
-define __BUILD_LIB
-$1 : $$($1_OBJS) | $$(addsuffix .so,$$(addprefix lib,$$($1_EXTRA_LIBS)))
-		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
-
-$(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
-
-#include $$($1_OBJS:.o=.d)
-endef
-
-$(foreach lib,$(LIBS),$(eval $(call __BUILD_LIB,$(lib))))
-$(foreach lib,$(HOST_LIBS),$(eval $(call __BUILD_LIB,$(lib))))
-
-.PHONY: clean
-clean:
-		$(RM) $(foreach exe,$(EXES),$(exe) $($(exe)_OBJS)) \
-			  $(foreach lib,$(LIBS),$(lib) $($(lib)_OBJS)) \
-			  $(foreach lib,$(HOST_LIBS),$(lib) $($(lib)_OBJS))
-
-DESTDIR ?= /
-BINDIR ?= /usr/bin
-LIBDIR ?= /usr/lib
-
-.PHONY: install
-install:
-		$(if $(EXES),\
-		install -m 0755 -d $(DESTDIR)$(BINDIR) && \
-		install -m 0755 $(EXES) $(DESTDIR)$(BINDIR) \
-		)
-		$(if $(LIBS),\
-		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid && \
-		install -m 0755 $(HOST_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid && \
-		install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR) \
-		)
-
-.DEFAULT_GOAL: all
-.PHONY: all
-all: $(EXES) $(LIBS)
diff --git a/cmake/sdbus.cmake b/cmake/sdbus.cmake
new file mode 100644
index 0000000..90806f3
--- /dev/null
+++ b/cmake/sdbus.cmake
@@ -0,0 +1,16 @@
+find_library(SYSTEMD_LIBRARY systemd)
+if(NOT SYSTEMD_LIBRARY)
+    message(FATAL_ERROR "Cannot find libsystemd.")
+endif(NOT SYSTEMD_LIBRARY)
+
+find_path(SYSTEMD_SDBUS_INCLUDE "systemd/sd-bus.h")
+if(NOT SYSTEMD_SDBUS_INCLUDE)
+    message(FATAL_ERROR "Cannot find sd-bus.h, libsystemd doesn't support?")
+endif(NOT SYSTEMD_SDBUS_INCLUDE)
+include_directories(${SYSTEMD_SDBUS_INCLUDE})
+
+INCLUDE (CheckLibraryExists)
+CHECK_LIBRARY_EXISTS(systemd sd_bus_open SYSTEMD_LIBRARY SYSTEMD_HAVE_SDBUS)
+if(NOT SYSTEMD_HAVE_SDBUS)
+    message(FATAL_ERROR "libsystemd doesn't support sdbus functions.")
+endif(NOT SYSTEMD_HAVE_SDBUS)
-- 
2.7.1
