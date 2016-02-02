Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3D51F1A01F0
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 19:30:56 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145440184953825.799995849533616;
 Tue, 2 Feb 2016 00:30:49 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 2/2] Makefile changes to fix LED build failures in
 bitbake
Date: Tue,  2 Feb 2016 02:30:46 -0600
Message-Id: <1454401846-16840-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454401846-16840-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454401846-16840-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 08:30:56 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e787990..1a8e88e 100755
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ OBJS2   = progress.o ast-sf-ctrl.o libflash.o libffs.o arm_io.o
 OBJS3   = obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/libffs.o obj/arm_io.o
 INCLUDES=$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iincludes -Iobjects/pflash -I.
 LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
-INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
+INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 
 %.o: interfaces/%.c 
@@ -42,7 +42,7 @@ led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
 led_controller_new: led_controller_new.o
-	$(CC) $(INC_FLAG) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) $(LIB_FLAG)
+	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIB_FLAG)
 
 button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
-- 
2.6.4
