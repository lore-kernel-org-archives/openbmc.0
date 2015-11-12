Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2D01A0767
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:46:06 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327839130987.3180940772717;
 Thu, 12 Nov 2015 03:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ v2 11/11] add comments
Date: Thu, 12 Nov 2015 06:30:12 -0500
Message-Id: <1447327812-21126-12-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:46:07 -0000

From: adamliyi <adamliyi@msn.com>

---
 README.md | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 43b97e8..0b98417 100644
--- a/README.md
+++ b/README.md
@@ -2,8 +2,12 @@
 HWMON driver for the openpower OCC. BMC uses it to read CPU sensor data via OCC (On-Chip-Controller).
 It is part of openbmc.
 
+To build the module seperately in OBCM, just type:
+
+# bitbake i2c-occ-mod
+
 After building, a kernel module named "occ.ko" is generated. Currently the module is located in:
-"lib/modules/4.2.0-openbmc-20151104-1/extra/occ.ko".
+"lib/modules/4.2.0-openbmc-20151104-1/extra/occ.ko". You can SCP occ.ko to a booted BMC.
 
 Bellow are steps tested on Palmetto:
 
-- 
2.6.3
