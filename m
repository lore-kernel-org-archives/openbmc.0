Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLs5tg6zDqmt
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:17 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053464934897.609010915213;
 Mon, 27 Jun 2016 11:51:04 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 3/9] libopenbmc_intf include path update
Date: Mon, 27 Jun 2016 13:50:48 -0500
Message-Id: <20160627185054.12379-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
References: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2016 18:51:18 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Remove the interfaces prefix from applications including openbmc_intf.h.

Use brackets rather than quotes in prep for a libopenbmc_intf SDK
package.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 bmcctl/control_bmc_obj.c           | 4 ++--
 flashbios/flash_bios_obj.c         | 4 ++--
 gdbus.mk                           | 2 +-
 gdbus/interfaces/openbmc_intf.c    | 2 +-
 hostcheckstop/host_checkstop_obj.c | 6 +++---
 hostwatchdog/host_watchdog_obj.c   | 4 ++--
 libopenbmc_intf/Makefile           | 1 -
 libopenbmc_intf/gpio.c             | 2 +-
 op-flasher/flasher_obj.c           | 4 ++--
 op-hostctl/control_host_obj.c      | 6 +++---
 op-pwrctl/power_control_obj.c      | 6 +++---
 pciedetect/pcie_slot_present_obj.c | 6 +++---
 pwrbutton/button_power_obj.c       | 6 +++---
 rstbutton/button_reset_obj.c       | 6 +++---
 14 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/bmcctl/control_bmc_obj.c b/bmcctl/control_bmc_obj.c
index 6dfa2da..545f780 100644
--- a/bmcctl/control_bmc_obj.c
+++ b/bmcctl/control_bmc_obj.c
@@ -1,8 +1,8 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
diff --git a/flashbios/flash_bios_obj.c b/flashbios/flash_bios_obj.c
index f865be1..fc42cb4 100644
--- a/flashbios/flash_bios_obj.c
+++ b/flashbios/flash_bios_obj.c
@@ -3,8 +3,8 @@
 #include <string.h>
 #include <sys/wait.h>
 #include <sys/types.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control/flash";
diff --git a/gdbus.mk b/gdbus.mk
index 4b320cb..250e2cf 100644
--- a/gdbus.mk
+++ b/gdbus.mk
@@ -1,5 +1,5 @@
 PACKAGE_DEPS=gio-unix-2.0 glib-2.0
-ALL_CFLAGS+=-iquote ../gdbus -iquote ../libopenbmc_intf
+ALL_CFLAGS+=-I ../libopenbmc_intf
 
 LIBOBMC=$(TOP)/libopenbmc_intf/libopenbmc_intf.so.1
 EXTRA_OBJS+=$(LIBOBMC)
diff --git a/gdbus/interfaces/openbmc_intf.c b/gdbus/interfaces/openbmc_intf.c
index ff10424..7a15116 100644
--- a/gdbus/interfaces/openbmc_intf.c
+++ b/gdbus/interfaces/openbmc_intf.c
@@ -8,7 +8,7 @@
 #  include "config.h"
 #endif
 
-#include "interfaces/openbmc_intf.h"
+#include "openbmc_intf.h"
 
 #include <string.h>
 #ifdef G_OS_UNIX
diff --git a/hostcheckstop/host_checkstop_obj.c b/hostcheckstop/host_checkstop_obj.c
index 0d6d736..74c940e 100644
--- a/hostcheckstop/host_checkstop_obj.c
+++ b/hostcheckstop/host_checkstop_obj.c
@@ -1,6 +1,6 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
+#include <gpio.h>
 
 static const gchar* dbus_object_path = "/org/openbmc/control";
 static const gchar* object_name = "/org/openbmc/control/checkstop0";
diff --git a/hostwatchdog/host_watchdog_obj.c b/hostwatchdog/host_watchdog_obj.c
index e922dc3..fed29c2 100644
--- a/hostwatchdog/host_watchdog_obj.c
+++ b/hostwatchdog/host_watchdog_obj.c
@@ -1,5 +1,5 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
 
 /* ------------------------------------------------------------------------- */
 
diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index 048d8c4..156767a 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -2,7 +2,6 @@ PACKAGE_DEPS=gio-unix-2.0 glib-2.0
 INSTALLDEPS=install-lib install-headers
 CLEANDEPS=clean-lib
 DEFAULT_ALL=$(LIBOBMC)
-ALL_CFLAGS+=-iquote ../gdbus
 LIBOBMC=openbmc_intf
 INCLUDES=openbmc_intf.h openbmc.h gpio.h
 
diff --git a/libopenbmc_intf/gpio.c b/libopenbmc_intf/gpio.c
index 25a9df8..9e8164d 100644
--- a/libopenbmc_intf/gpio.c
+++ b/libopenbmc_intf/gpio.c
@@ -7,7 +7,7 @@
 #include <argp.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
+#include "openbmc_intf.h"
 #include "gpio.h"
 
 
diff --git a/op-flasher/flasher_obj.c b/op-flasher/flasher_obj.c
index 95892bd..dc14e7d 100644
--- a/op-flasher/flasher_obj.c
+++ b/op-flasher/flasher_obj.c
@@ -20,8 +20,8 @@
 #include "io.h"
 #include "ast.h"
 #include "sfc-ctrl.h"
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
 
 static const gchar* dbus_object_path = "/org/openbmc/control";
 static const gchar* dbus_name = "org.openbmc.control.Flasher";
diff --git a/op-hostctl/control_host_obj.c b/op-hostctl/control_host_obj.c
index e65f0af..94b5134 100644
--- a/op-hostctl/control_host_obj.c
+++ b/op-hostctl/control_host_obj.c
@@ -5,9 +5,9 @@
 #include <unistd.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
+#include <gpio.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
diff --git a/op-pwrctl/power_control_obj.c b/op-pwrctl/power_control_obj.c
index 85a8cff..dfc7fa9 100644
--- a/op-pwrctl/power_control_obj.c
+++ b/op-pwrctl/power_control_obj.c
@@ -7,9 +7,9 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <syslog.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
+#include <gpio.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
diff --git a/pciedetect/pcie_slot_present_obj.c b/pciedetect/pcie_slot_present_obj.c
index 36104e2..a2e7fd8 100644
--- a/pciedetect/pcie_slot_present_obj.c
+++ b/pciedetect/pcie_slot_present_obj.c
@@ -1,9 +1,9 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <openbmc.h>
 #include <stdio.h>
 #include <stdbool.h>
 #include <string.h>
-#include "gpio.h"
+#include <gpio.h>
 
 #define NUM_SLOTS 8
 GPIO slots[NUM_SLOTS] = {
diff --git a/pwrbutton/button_power_obj.c b/pwrbutton/button_power_obj.c
index e093a00..b8bca38 100644
--- a/pwrbutton/button_power_obj.c
+++ b/pwrbutton/button_power_obj.c
@@ -1,7 +1,7 @@
 #include <stdio.h>
-#include "interfaces/openbmc_intf.h"
-#include "gpio.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <gpio.h>
+#include <openbmc.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/buttons";
diff --git a/rstbutton/button_reset_obj.c b/rstbutton/button_reset_obj.c
index a9321e3..731ecce 100644
--- a/rstbutton/button_reset_obj.c
+++ b/rstbutton/button_reset_obj.c
@@ -1,7 +1,7 @@
 #include <stdio.h>
-#include "interfaces/openbmc_intf.h"
-#include "gpio.h"
-#include "openbmc.h"
+#include <openbmc_intf.h>
+#include <gpio.h>
+#include <openbmc.h>
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/buttons";
-- 
2.9.0
