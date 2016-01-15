Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E6AFE1A0050
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 01:30:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452868212359365.2057015230296;
 Fri, 15 Jan 2016 06:30:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] Add dbus method cold_reset() for bmc dbus object
Date: Fri, 15 Jan 2016 08:30:10 -0600
Message-Id: <1452868210-23453-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452868210-23453-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452868210-23453-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Jan 2016 14:30:17 -0000

From: adamliyi <adamliyi@msn.com>

---
 dbus-interfaces.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 28fe410..7dee30f 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -151,4 +151,11 @@ properties:
 
   *  `state`
 
+# BMC
+
+## `/org/openbmc/control/bmc/bmc0`
+
+methods:
+
+  *  `cold_reset()`
 
-- 
2.6.4
