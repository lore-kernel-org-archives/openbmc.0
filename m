Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z65dz5TnzzDqZg
 for <openbmc@lists.ozlabs.org>; Wed, 27 Dec 2017 19:30:44 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBR8CnAw022313;
 Wed, 27 Dec 2017 10:12:49 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 758705A644; Wed, 27 Dec 2017 10:30:32 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: iio: document NPCM7xx ADC
 DT bindings
Date: Wed, 27 Dec 2017 10:30:25 +0200
Message-Id: <1514363426-9079-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1514363426-9079-1-git-send-email-tmaimon77@gmail.com>
References: <1514363426-9079-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Dec 2017 08:30:48 -0000

Added device tree binding documentation for Nuvoton NPCM7xx ADC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/iio/adc/npcm7xx-adc.txt    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/iio/adc/npcm7xx-adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/npcm7xx-adc.txt b/Documentation/devicetree/bindings/iio/adc/npcm7xx-adc.txt
new file mode 100755
index 000000000000..c4eb433563b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/npcm7xx-adc.txt
@@ -0,0 +1,23 @@
+Nuvoton NPCM7XX Analog to Digital Converter (ADC)
+
+The NPCM7XX ADC is a 10-bit converter for eight channel inputs,
+The ADC module includes an eight-to-one multiplexer.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-adc" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+
+Required clocking property, have to be one of:
+- clocks          : phandle of timer reference clock.
+- clock-names	  : Must contain "clk_adc", matching entry in the clocks property.
+- vref			  : ADC Reference voltage, defualt 2048.
+
+Example:
+
+adc: adc@f000c000 {
+	compatible = "nuvoton,npcm750-adc";
+	reg = <0xf000c000 0x1000>;
+	clocks = <&clk NPCM7XX_CLK_ADC>;
+	clock-names = "clk_adc";
+	vref = <2048>;
+};
-- 
2.14.1
