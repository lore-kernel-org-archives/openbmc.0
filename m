Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BFDC51A0019
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 12:30:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455154230841160.1763662048353;
 Wed, 10 Feb 2016 17:30:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] arm: dts: unit address should not have 0x prefix
Date: Wed, 10 Feb 2016 19:30:28 -0600
Message-Id: <1455154228-7217-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 11 Feb 2016 01:30:35 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The implied format for most bus bindings implies the uname-address
part of the unit-name should be in hex without a leading 0x.

Fix the one i2c bus that did not follow this convention.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/boot/dts/ast2400.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index de816a9..49516fd 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -159,7 +159,7 @@
 					interrupts = <4>;
 				};
 
-				i2c5: i2c-bus@0x180 {
+				i2c5: i2c-bus@180 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0x180 0x40>;
-- 
2.7.1
