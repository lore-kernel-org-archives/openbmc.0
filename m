Return-Path: <SRS0=DXUl=GI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F833C433E0
	for <openbmc@archiver.kernel.org>; Tue,  5 Jan 2021 14:03:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AC422AAA
	for <openbmc@archiver.kernel.org>; Tue,  5 Jan 2021 14:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14AC422AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Djk1tK3zDqfr
	for <openbmc@archiver.kernel.org>; Wed,  6 Jan 2021 01:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9DKX1Yn8zDqY7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 00:45:51 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 105DjKiF005938;
 Tue, 5 Jan 2021 15:45:21 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1514263A17; Tue,  5 Jan 2021 15:45:21 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v2 10/11] dt-binding: bmc: add NPCM7XX JTAG
 master documentation
Date: Tue,  5 Jan 2021 15:45:07 +0200
Message-Id: <20210105134508.225702-11-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210105134508.225702-1-tmaimon77@gmail.com>
References: <20210105134508.225702-1-tmaimon77@gmail.com>
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stanley Chu <yschu@nuvoton.com>,
 Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Added device tree binding documentation for
Nuvoton NPCM7XX JTAG master.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/bmc/npcm7xx-jtag-master.txt      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
new file mode 100644
index 000000000000..3ad7a18ba9a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
@@ -0,0 +1,38 @@
+Nuvoton NPCM7xx JTAG MASTER interface
+
+Nuvoton BMC NPCM7xx JTAG Master is used for debugging host CPU or programming
+CPLD device. The driver is implemented as an SPI device driver that enabling
+the option to transfer JTAG data with the assistance of SPI HW.
+
+Required properties for jtag_master node
+- compatible		: "nuvoton,npcm750-jtag-master" for Poleg NPCM7XX.
+- spi-max-frequency	: specify the max spi bus frequency.
+- reg 				: always 0
+- pinctrl-names		: contain 2 pinctrl states "pspi" and "gpio", which indicates
+					  the TCK/TDI/TDO pin state in HW mode(using PSPI hw) and
+					  SW mode (using GPIO bitbang) respectively.
+- tck-gpios			: specify the GPIO number of TCK pin
+- tdi-gpios			: specify the GPIO number of TDI pin
+- tdo-gpios			: specify the GPIO number of TDO pin
+- tms-gpios			: specify the GPIO number of TMS pin
+
+Example:
+spi1: spi@201000 {
+	...
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi2_pins>;
+		pinctrl-1 = <&gpio17_pins &gpio18o_pins
+			&gpio19ol_pins>;
+
+		tck-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
-- 
2.22.0

