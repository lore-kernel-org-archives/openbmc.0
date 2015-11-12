Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 927121A072B
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 23:10:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327222480425.98031499984916;
 Thu, 12 Nov 2015 03:20:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH openbmc v4 1/5] add i2c-occ to barreleye device table
Date: Thu, 12 Nov 2015 06:20:15 -0500
Message-Id: <1447327219-20318-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447327219-20318-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447327219-20318-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 12:10:51 -0000

From: adamliyi <adamliyi@msn.com>

---
 .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
index c4f4076..0f6359d 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
@@ -142,6 +142,14 @@
 					bus = <3>;
 					clock-frequency = <100000>;
 					status = "okay";
+					occ@50 {
+						compatible = "ibm,occ-i2c";
+						reg = <0x50>;
+					};
+					occ@51 {
+						compatible = "ibm,occ-i2c";
+						reg = <0x51>;
+					};
 				};
 
 				i2c4: i2c-bus@0x140 {
-- 
2.6.3
