Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0FF2F1A03F4
 for <openbmc@lists.ozlabs.org>; Mon,  9 Nov 2015 21:40:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447065620494801.9278209477174;
 Mon, 9 Nov 2015 02:40:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH openbmc] add i2c-occ to barreleye device table
Date: Mon,  9 Nov 2015 05:40:19 -0500
Message-Id: <1447065619-13533-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447065619-13533-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447065619-13533-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 10:40:24 -0000

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
