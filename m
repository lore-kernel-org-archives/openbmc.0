Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 930481A1B05
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482037420630.9173827210142;
 Fri, 18 Dec 2015 15:40:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 02/15] Init GPIO Thottle, add BMC heartbeat,
 change power LED status
Date: Fri, 18 Dec 2015 17:40:22 -0600
Message-Id: <1450482035-4530-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py           | 22 ++++++++++++++++++----
 includes/gpio.c            |  0
 objects/control_host_obj.c |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)
 mode change 100644 => 100755 includes/gpio.c

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 2006c83..01931c9 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -54,24 +54,38 @@ ENTER_STATE_CALLBACK = {
 			'bus_name'    : 'org.openbmc.control.Fans',
 			'obj_name'    : '/org/openbmc/control/fans',
 			'interface_name' : 'org.openbmc.control.Fans',
+		},
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'interface_name' : 'org.openbmc.Led',
 		}
 	},
-	'BMC_READY' : {
-		'setOn' : {
+	'HOST_POWERED_OFF' : {
+		'setOff' : {
 			'bus_name'   : 'org.openbmc.control.led',
 			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
 			'interface_name' : 'org.openbmc.Led',
-		},
+		}
+
+	},
+	'BMC_READY' : {
 		'setOn' : {
 			'bus_name'   : 'org.openbmc.control.led',
 			'obj_name'   : '/org/openbmc/control/led/BEEP',
 			'interface_name' : 'org.openbmc.Led',
 		},
+		'setBlinkSlow' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/HEART_BEAT',
+			'interface_name' : 'org.openbmc.Led',
+		},
+
 		'init' : {
 			'bus_name'   : 'org.openbmc.control.Flash',
 			'obj_name'   : '/org/openbmc/control/flash/bios',
 			'interface_name' : 'org.openbmc.Flash',
-		},
+		}
 	}
 }
 
diff --git a/includes/gpio.c b/includes/gpio.c
old mode 100644
new mode 100755
diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
index 79d375b..56b02de 100755
--- a/objects/control_host_obj.c
+++ b/objects/control_host_obj.c
@@ -225,6 +225,7 @@ on_bus_acquired (GDBusConnection *connection,
 	gpio_init(connection,&fsi_clk);
 	gpio_init(connection,&fsi_enable);
 	gpio_init(connection,&cronus_sel);
+	gpio_init(connection,&Throttle);
 	emit_object_added((GDBusObjectManager*)manager); 	
 }
 
-- 
2.6.3
