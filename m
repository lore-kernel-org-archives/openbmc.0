Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 34E351A01D7
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 04:30:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454347846672885.0406555947724;
 Mon, 1 Feb 2016 09:30:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Makefile changes to fix bitbake errors in new LED
Date: Mon,  1 Feb 2016 11:30:44 -0600
Message-Id: <1454347844-27502-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454347844-27502-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454347844-27502-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 01 Feb 2016 17:30:55 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 65787ff..003a6eb 100755
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye led_controller_new
 
 setup: 
 	mkdir -p obj lib
@@ -30,6 +30,9 @@ setup:
 clean:  
 	rm -rf obj lib bin/*.exe
 
+INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
+LIB_FLAG += $(shell pkg-config  --libs libsystemd)
+
 libopenbmc_intf: openbmc_intf.o
 	$(CC) -shared -o lib/$@.so obj/openbmc_intf.o $(LDFLAGS)
 
@@ -40,7 +43,7 @@ led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
 led_controller_new: led_controller_new.o
-	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) -lsystemd
+	$(CC) $(INC_FLAG) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) $(LIB_FLAG)
 
 button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
@@ -73,6 +76,3 @@ pflash:  $(OBJS2) pflash.o
 hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o obj/object_mapper.o  $(LDFLAGS) $(LIBS)
 
-control_bmc: control_bmc_obj.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
-
-- 
2.6.4
