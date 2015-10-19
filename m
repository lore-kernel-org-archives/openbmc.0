Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C149B1A0A01
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:47 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293365785297.5228851496495;
 Mon, 19 Oct 2015 15:22:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 2/5] Skeleton makefile updates for OE build
Date: Mon, 19 Oct 2015 17:22:38 -0500
Message-Id: <1445293361-739-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445293361-739-1-git-send-email-patches@stwcx.xyz>
References: <1445293361-739-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:48 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   1 +
 .../recipes-phosphor/skeleton/skeleton/make.patch  | 120 +++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index ccc5ed1..23b43c3 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -9,6 +9,7 @@ inherit obmc-phosphor-systemd
 DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess"
 SRC_URI += "git://github.com/openbmc/skeleton"
+SRC_URI += "file://make.patch"
 
 SRCREV = "18d4591170779ceb81158c650d31c6c59115b2f2"
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch
new file mode 100644
index 0000000..17ec317
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch
@@ -0,0 +1,120 @@
+diff --git a/Makefile b/Makefile
+index b303513..b7f0053 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,77 +4,74 @@ OBJS	+= objects/pflash/libflash/libflash.o objects/pflash/libflash/libffs.o
+ OBJS	+= objects/pflash/arm_io.o
+ OBJS2   = progress.o ast-sf-ctrl.o libflash.o libffs.o arm_io.o
+ OBJS3   = obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/libffs.o obj/arm_io.o
+-LIBS = ./bin
+-OFLAGS =-L$(LIBS) -lopenbmc_intf
+-HOME = .
+-CFLAGS=$(shell pkg-config --libs --cflags gio-unix-2.0 glib-2.0)
+-#CFLAGS = -pthread -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -lgio-2.0 -lgobject-2.0 -lglib-2.0
++INCLUDES=$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iincludes -Iobjects/pflash -I.
++LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Lbin -lopenbmc_intf
+ 
+ %.o: interfaces/%.c 
+-	$(CC) -c -fPIC -o obj/$@ $< -I$(HOME) -I$(HOME)/includes $(CFLAGS)
++	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
+ 
+ %.o: objects/%.c
+-	$(CC) -c -o obj/$@ $< -L$(LIBS) -I$(HOME) -I$(HOME)/includes -I$(HOME)/objects/pflash  $(CFLAGS)
++	$(CC) -c -o obj/$@ $< $(LIBS) $(CFLAGS) $(INCLUDES)
+ 
+ %.o: includes/%.c
+-	$(CC) -c -o obj/$@ $< -L$(LIBS) -I$(HOME) -I$(HOME)/includes -I$(HOME)/objects/pflash $(CFLAGS)
++	$(CC) -c -o obj/$@ $< $(LIBS) $(CFLAGS) $(INCLUDES)
+ 
+ %.o: objects/pflash/%.c
+-	$(CC) -c -o obj/$@ $< -I$(HOME) -I$(HOME)/objects/pflash  $(CFLAGS)
++	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
+ 
+ %.o: objects/pflash/libflash/%.c
+-	$(CC) -c -o obj/$@ $< -I$(HOME) -I$(HOME)/objects/pflash  $(CFLAGS)
++	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
+ 
+ setup: 
+-	mkdir obj
++	mkdir -p obj
+ 
+ clean:  
+ 	rm -rf obj
+ 
+ libopenbmc_intf: openbmc_intf.o
+-	$(CC) -shared -o bin/$@.so obj/openbmc_intf.o $(CFLAGS)
++	$(CC) -shared -o bin/$@.so obj/openbmc_intf.o $(LDFLAGS)
+ 
+-power_control: power_control_obj.o gpio.o
+-	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(OFLAGS) $(CFLAGS)
++power_control: power_control_obj.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(LDFLAGS) $(LIBS)
+ 
+-led_controller: led_controller.o gpio.o
+-	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o $(OFLAGS) $(CFLAGS)
++led_controller: led_controller.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o $(LDFLAGS) $(LIBS)
+ 
+-sensor_ambient: sensor_threshold.o sensor_temperature_ambient_obj.o
+-	$(CC) -o bin/$@.exe obj/sensor_threshold.o obj/sensor_temperature_ambient_obj.o $(OFLAGS) $(CFLAGS)
++sensor_ambient: sensor_threshold.o sensor_temperature_ambient_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/sensor_threshold.o obj/sensor_temperature_ambient_obj.o $(LDFLAGS) $(LIBS)
+ 
+-button_power: button_power_obj.o gpio.o
+-	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o $(OFLAGS) $(CFLAGS)
++button_power: button_power_obj.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
+ 
+-control_host: control_host_obj.o gpio.o
+-	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o $(OFLAGS) $(CFLAGS)
++control_host: control_host_obj.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o $(LDFLAGS) $(LIBS)
+ 
+-flash_bios:  flash_bios_obj.o
+-	$(CC) -o bin/$@.exe obj/flash_bios_obj.o $(OFLAGS)  $(CFLAGS)
++flash_bios:  flash_bios_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/flash_bios_obj.o $(LDFLAGS) $(LIBS)
+ 
+-fan: fan_generic_obj.o gpio.o
+-	$(CC) -o bin/$@.exe obj/gpio.o obj/fan_generic_obj.o $(OFLAGS) $(CFLAGS)
++fan: fan_generic_obj.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/gpio.o obj/fan_generic_obj.o $(LDFLAGS) $(LIBS)
+ 
+-host_watchdog: host_watchdog_obj.o
+-	$(CC) -o bin/$@.exe obj/host_watchdog_obj.o $(OFLAGS) $(CFLAGS)
++host_watchdog: host_watchdog_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/host_watchdog_obj.o $(LDFLAGS) $(LIBS)
+ 
+-control_bmc: control_bmc_obj.o
+-	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(OFLAGS) $(CFLAGS)
++control_bmc: control_bmc_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
+ 
+-sensor_occ: sensor_occ_obj.o
+-	$(CC) -o bin/$@.exe obj/sensor_occ_obj.o $(OFLAGS) $(CFLAGS)
++sensor_occ: sensor_occ_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/sensor_occ_obj.o $(LDFLAGS) $(LIBS)
+ 
+-board_vpd: board_vpd_obj.o
+-	$(CC) -o bin/$@.exe obj/board_vpd_obj.o $(OFLAGS) $(CFLAGS)
++board_vpd: board_vpd_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/board_vpd_obj.o $(LDFLAGS) $(LIBS)
+ 
+-pcie_slot_present: pcie_slot_present_obj.o gpio.o
+-	$(CC) -o bin/$@.exe obj/pcie_slot_present_obj.o obj/gpio.o $(OFLAGS) $(CFLAGS)
++pcie_slot_present: pcie_slot_present_obj.o gpio.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/pcie_slot_present_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
+ 
+-flasher:  $(OBJS2) flasher_obj.o
+-	$(CC) -o bin/$@.exe obj/flasher_obj.o $(OFLAGS)  $(OBJS3)  $(CFLAGS)
++flasher:  $(OBJS2) flasher_obj.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/flasher_obj.o $(OBJS3) $(LDFLAGS) $(LIBS)
+ 
+-hwmon:  hwmon_intf.o
+-	$(CC) -o bin/$@.exe obj/hwmon_intf.o $(OFLAGS)  $(CFLAGS)
++hwmon:  hwmon_intf.o libopenbmc_intf
++	$(CC) -o bin/$@.exe obj/hwmon_intf.o $(LDFLAGS) $(LIBS)
+ 
+ 
+-all: clean setup libopenbmc_intf power_control led_controller sensor_ambient button_power control_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher
++all: setup libopenbmc_intf power_control led_controller sensor_ambient button_power control_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher
-- 
2.6.0
