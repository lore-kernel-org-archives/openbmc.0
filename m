Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3x3pmP3vXCzDr5N
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 19:12:51 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 7 Jul 2017 12:12:47 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v679ClBO027718;
 Fri, 7 Jul 2017 12:12:47 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10] msn: add adc to msn dts.
Date: Fri,  7 Jul 2017 12:12:41 +0300
Message-Id: <20170707091241.77250-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 09:12:54 -0000

Add adc for Mellanox msn platform to dts.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index 0774959b1222..462a638e66c6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -139,3 +139,48 @@
 	status = "okay";
 };
 
+&adc {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	adc1 {
+		channel = <0>;
+		min = <677>;
+		max = <828>;
+	};
+	adc2 {
+		channel = <2>;
+		min = <684>;
+		max = <836>;
+	};
+	adc3 {
+		channel = <3>;
+		min = <684>;
+		max = <836>;
+	};
+	adc4 {
+		channel = <4>;
+		min = <676>;
+		max = <826>;
+	};
+	adc5 {
+		channel = <10>;
+		min = <691>;
+		max = <845>;
+	};
+	adc6 {
+		channel = <11>;
+		min = <640>;
+		max = <782>;
+	};
+	adc7 {
+		channel = <12>;
+		min = <615>;
+		max = <751>;
+	};
+	adc8 {
+		channel = <13>;
+		min = <587>;
+		max = <719>;
+	};
+};
-- 
2.11.0
