Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DC7E71A1B00
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482044285911.1720564459325;
 Fri, 18 Dec 2015 15:40:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 12/15] add softreboot
Date: Fri, 18 Dec 2015 17:40:32 -0600
Message-Id: <1450482035-4530-13-git-send-email-openbmc-patches@stwcx.xyz>
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

From: Norman James <njames@us.ibm.com>

---
 bin/chassis_control.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 8ae0f55..1981a82 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -132,6 +132,8 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 			self.powerOff()
 		return None
 
+	@dbus.service.method(DBUS_NAME,
+		in_signature='', out_signature='')
 	def softReboot(self):
 		print "Soft Rebooting"
 		if self.getPowerState() == POWER_OFF:
-- 
2.6.3
