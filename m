Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9CAC41A08F6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:06:20 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447323622970978.8726960128605;
 Thu, 12 Nov 2015 02:20:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ 05/10] Create README.md
Date: Thu, 12 Nov 2015 05:20:07 -0500
Message-Id: <1447323612-15427-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:06:21 -0000

From: adamliyi <adamliyi@msn.com>

---
 README.md | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 README.md

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..f417f67
--- /dev/null
+++ b/README.md
@@ -0,0 +1,3 @@
+# kernel-hwmon-occ
+hwmon driver for the openpower OCC. BMC uses it to read CPU sensor data via OCC (On-Chip-Controller).
+It is part of openbmc.
-- 
2.6.3
