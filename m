Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 21C4A1A1832
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 20:30:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453282212411782.0850535683261;
 Wed, 20 Jan 2016 01:30:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] dbus-interface-doc: Add PowerCap and OccStatus
 description
Date: Wed, 20 Jan 2016 03:30:10 -0600
Message-Id: <1453282210-6352-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453282210-6352-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453282210-6352-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 09:30:18 -0000

From: Yi Li <adamliyi@msn.com>

Add description for dbus objects '/org/openbmc/sensors/host/PowerCap'
and '/org/openbmc/sensors/host/OccStatus'.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 dbus-interfaces.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 28fe410..5e71dcb 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -87,6 +87,12 @@ properties:
 
   *  `worst_threshold_state`
 
+### `/org/openbmc/sensors/host/PowerCap`
+This object is used to set Host PowerCap. In turn a OCC "Set User PowerCap" command is sent to OCC.
+
+### `/org/openbmc/sensors/host/OccStatus`
+This object can set OCC state to either: "Enabled" or "Disabled".
+
 # Inventory
 
 ## `/org/openbmc/inventory/<item hierarchy>`
-- 
2.6.4
