Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 77AAA1A18E6
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 17:10:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452838239885469.2752575544167;
 Thu, 14 Jan 2016 22:10:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v4 5/5] Reset button does not power on when dc off
Date: Fri, 15 Jan 2016 00:10:35 -0600
Message-Id: <1452838235-6961-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452838235-6961-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452838235-6961-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Jan 2016 06:10:48 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/chassis_control.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 0a0b44d..1b6065e 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -126,7 +126,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
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
