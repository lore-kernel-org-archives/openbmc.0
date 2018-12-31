Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43SsyV75SKzDqF7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Dec 2018 20:51:11 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBV9L2n7000530;
 Mon, 31 Dec 2018 11:21:02 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id A171E62DA6; Mon, 31 Dec 2018 11:51:00 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 v1 1/4] dt-binding: iio: add NPCM ADC documentation
Date: Mon, 31 Dec 2018 11:50:53 +0200
Message-Id: <20181231095056.86234-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181231095056.86234-1-tmaimon77@gmail.com>
References: <20181231095056.86234-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 31 Dec 2018 09:51:16 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM Analog-to-Digital Converter(ADC).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
new file mode 100644
index 000000000000..6f0843d837cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -0,0 +1,35 @@
+Nuvoton NPCM Analog to Digital Converter (ADC)
+
+The NPCM ADC is a 10-bit converter for eight channel inputs.
+
+Required properties:
+- compatible	: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
+- reg			: specifies physical base address and size of the registers.
+- interrupts	: Contain the ADC interrupt with flags for falling edge.
+
+Optional properties:
+- clocks		: phandle of ADC reference clock, in case the clock is not
+				  added the ADC will use the default ADC sample rate.
+- vref-supply	: The regulator supply ADC reference voltage, in case the
+				  vref-supply is not added the ADC will use internal voltage
+				  reference.
+
+Required Node in the NPCM7xx BMC:
+An additional register is present in the NPCM7xx SOC which is
+assumed to be in the same device tree, with and marked as
+compatible with "nuvoton,npcm750-rst".
+
+Example:
+
+adc: adc@f000c000 {
+	compatible = "nuvoton,npcm750-adc";
+	reg = <0xf000c000 0x8>;
+	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clk NPCM7XX_CLK_ADC>;
+};
+
+rst: rst@f0801000 {
+	compatible = "nuvoton,npcm750-rst", "syscon",
+	"simple-mfd";
+	reg = <0xf0801000 0x6C>;
+};
-- 
2.14.1
