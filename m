Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C99C433EF
	for <openbmc@archiver.kernel.org>; Sun, 19 Jun 2022 15:13:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQxB04mxyz3c8C
	for <openbmc@archiver.kernel.org>; Mon, 20 Jun 2022 01:13:28 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQx9V4vRBz30Hf
	for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2022 01:13:02 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LQx9S5hXDz4xXF;
	Mon, 20 Jun 2022 01:13:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LQx9Q1HcTz4xD5;
	Mon, 20 Jun 2022 01:12:57 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3] ARM: dts: aspeed: Add a palmetto board (AST2400)
Date: Sun, 19 Jun 2022 17:12:52 +0200
Message-Id: <20220619151252.3022651-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>, Zev Weiss <zweiss@equinix.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Palmettos were the first OpenPOWER systems built by Tyan with the
product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
processor and an Aspeed AST2400 SoC.

Tested on real HW using the evb-ast2400 defconfig, plus these extras :

  CONFIG_BOOTCOMMAND="bootm 20080000"
  CONFIG_DEFAULT_DEVICE_TREE="ast2400-palmetto"

Cc: Zev Weiss <zweiss@equinix.com>
Cc: Frédéric Barrat <fbarrat@linux.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Since v2:

 - DT cleanups (Zev)
 - Dropped the defconfig because only the default boot command needs
   an update to boot Linux
 - Tested on real HW ! Thanks to Frédéric.

 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2400-palmetto.dts | 73 +++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 arch/arm/dts/ast2400-palmetto.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 35cdd0952d33..6dc9aeab24ff 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2400-ahe-50dc.dtb \
+	ast2400-palmetto.dtb \
 	ast2500-evb.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-palmetto.dts
new file mode 100644
index 000000000000..43b141a8379d
--- /dev/null
+++ b/arch/arm/dts/ast2400-palmetto.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2400-u-boot.dtsi"
+
+/ {
+	model = "Palmetto BMC";
+	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x10000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		spi1 = &spi1;
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <200000000>;
+};
+
+&wdt1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	phy-mode = "NC-SI";
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spi1_default>;
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
-- 
2.35.3

