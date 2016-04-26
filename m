Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvZ3Y6qKKzDqB2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 06:11:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146170146080480.47548050241983;
 Tue, 26 Apr 2016 13:11:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH linux 1/3] Fix a couple incorrect register bases for ast2400
Date: Tue, 26 Apr 2016 15:10:56 -0500
Message-Id: <1461701458-2173-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461701458-2173-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461701458-2173-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 26 Apr 2016 20:11:06 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

There were a couple copy paste errors in the i2c section of the
ast2400 device tree.
---
 arch/arm/boot/dts/ast2400.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index 49516fd..02032b1 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -215,7 +215,9 @@
 				};
 
 				i2c10: i2c-bus@3c0 {
-					reg = <0x380 0x40>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3C0 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
 					bus = <10>;
 					clock-frequency = <100000>;
@@ -224,6 +226,8 @@
 				};
 
 				i2c11: i2c-bus@400 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0x400 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
 					bus = <11>;
@@ -235,7 +239,7 @@
 				i2c12: i2c-bus@440 {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0x400 0x40>;
+					reg = <0x440 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
 					bus = <12>;
 					clock-frequency = <100000>;
-- 
2.8.1
