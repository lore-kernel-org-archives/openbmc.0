Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 56F041A03FF
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 17:50:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448607033682576.9554452451882;
 Thu, 26 Nov 2015 22:50:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v6 02/19] LED test 2
Date: Fri, 27 Nov 2015 01:50:14 -0500
Message-Id: <1448607031-24374-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448607031-24374-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448607031-24374-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 27 Nov 2015 06:50:39 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py         | 5 +++++
 objects/led_controller.c | 9 +++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 98d7321..783aa88 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -51,6 +51,11 @@ ENTER_STATE_CALLBACK = {
 			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
 			'interface_name' : 'org.openbmc.Led',
 		},
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/BEEP',
+			'interface_name' : 'org.openbmc.Led',
+		},
 		'init' : {
 			'bus_name'   : 'org.openbmc.control.Flash',
 			'obj_name'   : '/org/openbmc/control/flash/bios',
diff --git a/objects/led_controller.c b/objects/led_controller.c
index 5bb4542..6f773c9 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -68,13 +68,14 @@ on_set_off       (Led          *led,
 	return TRUE;
 }
 
-int tmp=0;
+//int tmp=0;
 void init_led(Led* led, GPIO* mygpio)
 {
 	int rc = GPIO_OK;
 	int i=5;
-	tmp++;
+//	tmp++;
 	do {
+		sleep(2);
 		uint8_t val;
 		rc = gpio_open(mygpio);
 		if (rc != GPIO_OK) { break; }
@@ -89,8 +90,8 @@ void init_led(Led* led, GPIO* mygpio)
 	i--;
 	} while(i!=0);
 	
-if(tmp==3)
-	led_set_state(led,"off");
+//if(tmp==3)
+//	led_set_state(led,"off");
 
 	gpio_close(mygpio);
 	if (rc != GPIO_OK) {
-- 
2.6.3
