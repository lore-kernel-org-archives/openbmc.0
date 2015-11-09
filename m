Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DD4D51A02BA
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 03:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447086021515228.77266902813835;
 Mon, 9 Nov 2015 08:20:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH openbmc v2 2/2] add occ-i2c to palmetto device table
Date: Mon,  9 Nov 2015 11:20:19 -0500
Message-Id: <1447086019-22341-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447086019-22341-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447086019-22341-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 16:20:34 -0000

From: adamliyi <adamliyi@msn.com>

---
 .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
index d55096b..d97893a 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
@@ -142,6 +142,10 @@
 					bus = <3>;
 					clock-frequency = <100000>;
 					status = "okay";
+					occ@50 {
+						compatible = "ibm,occ-i2c";
+						reg = <0x50>;
+					};
 				};
 
 				i2c4: i2c-bus@0x140 {
-- 
2.6.3
