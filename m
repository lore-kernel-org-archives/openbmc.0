Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rY5SR4SY0zDqhC
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 19:40:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466415616451118.56482443851007;
 Mon, 20 Jun 2016 02:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] host-management: Add section on power control
Date: Mon, 20 Jun 2016 04:40:12 -0500
Message-Id: <20160620094012.11079-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160620094012.11079-1-openbmc-patches@stwcx.xyz>
References: <20160620094012.11079-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 09:40:24 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 host-management.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/host-management.md b/host-management.md
index d223850..e313468 100644
--- a/host-management.md
+++ b/host-management.md
@@ -140,3 +140,27 @@ Each boot parameter is represented by an individual property, and their hex
 value is displayed in a string format. For example, a boot flags parameter value
 of `0x8014000000` would be stored as a `8014000000` string in the
 `settings/host0/boot_flags` property.
+
+Host power control
+------------------
+
+The host can be controlled through the `chassis` object. It implements a number
+of actions including powerOn and powerOff. These correspond to the IPMI
+`chassis power on` and `chassis power off` commands.
+
+Assuming you have logged in, the following will issue a POST with an empty data
+payload that powers the host on:
+
+```
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST \
+   -d '{"data": []}'  https://bmc/org/openbmc/control/chassis0/action/powerOn
+```
+
+Other actions available are:
+
+ * `setIdentify` / `clearIdentify`
+ * `powerOff`
+ * `softPowerOff`
+ * `reboot`
+ * `softReboot`
+ * `getPowerState`
-- 
2.8.4
