Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D641D1A0BF9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:40:34 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140430550368.7569043165681;
 Thu, 29 Oct 2015 10:40:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Move .so library to lib directory
Date: Thu, 29 Oct 2015 12:40:25 -0500
Message-Id: <1446140425-7767-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140425-7767-1-git-send-email-patches@stwcx.xyz>
References: <1446140425-7767-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:40:35 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Move .so library out of bin into lib to make recipe simpler
Move the make all target to the top so that it's the default for make
Make clean to delete all created targets
---
 Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 02f51f1..cbb62d8 100644
--- a/Makefile
+++ b/Makefile
@@ -5,7 +5,7 @@ OBJS	+= objects/pflash/arm_io.o
 OBJS2   = progress.o ast-sf-ctrl.o libflash.o libffs.o arm_io.o
 OBJS3   = obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/libffs.o obj/arm_io.o
 INCLUDES=$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iincludes -Iobjects/pflash -I.
-LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Lbin -lopenbmc_intf
+LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 
 %.o: interfaces/%.c 
 	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
@@ -22,14 +22,16 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Lbin -lopenbmc_intf
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
+all: setup libopenbmc_intf power_control led_controller button_power control_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye
+
 setup: 
-	mkdir -p obj
+	mkdir -p obj lib
 
 clean:  
-	rm -rf obj
+	rm -rf obj lib bin/*.exe
 
 libopenbmc_intf: openbmc_intf.o
-	$(CC) -shared -o bin/$@.so obj/openbmc_intf.o $(LDFLAGS)
+	$(CC) -shared -o lib/$@.so obj/openbmc_intf.o $(LDFLAGS)
 
 power_control: power_control_obj.o gpio.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(LDFLAGS) $(LIBS)
@@ -71,4 +73,3 @@ hwmon:  hwmon_intf.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/hwmon_intf.o $(LDFLAGS) $(LIBS)
 
 
-all: setup libopenbmc_intf power_control led_controller button_power control_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye
-- 
2.6.0
