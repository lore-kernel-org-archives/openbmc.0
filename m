Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A90E1A040B
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 13:40:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453084840194282.66472847891;
 Sun, 17 Jan 2016 18:40:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v5 5/5] Reset button does not power on when dc off
Date: Sun, 17 Jan 2016 20:40:35 -0600
Message-Id: <1453084835-12886-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 02:40:58 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/chassis_control.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 07d1aaf..8298aee 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -130,7 +130,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 	def reboot(self):
 		print "Rebooting"
 		if self.getPowerState() == POWER_OFF:
-			self.powerOn();
+			print "Power off, no reboot."
 		else:
 			self.Set(DBUS_NAME,"reboot",1)
 			self.powerOff()
-- 
2.6.4
