Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E6EA71A0809
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 12:30:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449711028544270.6460336449129;
 Wed, 9 Dec 2015 17:30:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux] aspeed: correct sram address in ast2400.dtsi
Date: Wed,  9 Dec 2015 19:30:27 -0600
Message-Id: <1449711027-9631-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449711027-9631-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449711027-9631-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 10 Dec 2015 01:30:33 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The sram reg and name properties were missing a zero.  It was more
obvious when looking at the platform device names which put the address
before the generic name.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/boot/dts/ast2400.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index 24e7235..21f4875 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -79,9 +79,9 @@
 			#size-cells = <1>;
 			ranges;
 
-			sram@1e72000 {
+			sram@1e720000 {
 				compatible = "mmio-sram";
-				reg = <0x1e72000 0x8000>;	// 32K
+				reg = <0x1e720000 0x8000>;	// 32K
 			};
 
 			ibt@1e789140 {
-- 
2.6.3
