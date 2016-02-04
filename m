Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6AD611A0220
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 16:50:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454565012974300.78816354402886;
 Wed, 3 Feb 2016 21:50:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Austen <causten@users.noreply.github.com>
Subject: [PATCH docs] Update dbus-interfaces.md for Event Log api
Date: Wed,  3 Feb 2016 23:50:11 -0600
Message-Id: <1454565011-29416-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454565011-29416-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454565011-29416-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 04 Feb 2016 05:50:17 -0000

From: Chris Austen <causten@users.noreply.github.com>

---
 dbus-interfaces.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 28fe410..db0f232 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -151,4 +151,30 @@ properties:
 
   *  `state`
 
+# Event Logs
 
+## `/org/openbmc/records/events`
+
+methods:
+
+  *  `Clear()`
+
+## `/org/openbmc/records/events/<logid>`
+
+methods:
+
+  *  `delete()`
+
+properties:
+
+  *  `message`
+
+  *  `association`
+
+  *  `reported_by`
+
+  *  `severity`
+
+  *  `debug_data`
+
+  *  `time`
-- 
2.6.4
