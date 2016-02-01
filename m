Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 052921A0166
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 03:30:59 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454344253944342.06929143921104;
 Mon, 1 Feb 2016 08:30:53 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] add back in control_bmc
Date: Mon,  1 Feb 2016 10:30:51 -0600
Message-Id: <1454344251-25942-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454344251-25942-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454344251-25942-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 01 Feb 2016 16:31:00 -0000

From: Norman James <njames@us.ibm.com>

---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b94d275..65787ff 100755
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc
 
 setup: 
 	mkdir -p obj lib
@@ -73,3 +73,6 @@ pflash:  $(OBJS2) pflash.o
 hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o obj/object_mapper.o  $(LDFLAGS) $(LIBS)
 
+control_bmc: control_bmc_obj.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
+
-- 
2.6.4
