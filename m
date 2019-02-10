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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yLc654vwzDqLN
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 07:48:33 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x1AKHsa5009187;
 Sun, 10 Feb 2019 22:17:54 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 8C38A62DA4; Sun, 10 Feb 2019 22:47:51 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: gregkh@linuxfoundation.org, jic23@kernel.org, knaack.h@gmx.de,
 lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] dt-binding: iio: remove rst node from NPCM ADC document
Date: Sun, 10 Feb 2019 22:47:49 +0200
Message-Id: <20190210204749.381445-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Sun, 10 Feb 2019 20:48:39 -0000

Remove NPCM7xx rst node for preparing the NPCM ADC
document to describe ADC reset binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt          | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
index 1b8132cd9060..eb939fe77836 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -14,11 +14,6 @@ Optional properties:
 			   vref-supply is not added the ADC will use internal voltage
 			   reference.
 
-Required Node in the NPCM7xx BMC:
-An additional register is present in the NPCM7xx SOC which is
-assumed to be in the same device tree, with and marked as
-compatible with "nuvoton,npcm750-rst".
-
 Example:
 
 adc: adc@f000c000 {
@@ -27,9 +22,3 @@ adc: adc@f000c000 {
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	clocks = <&clk NPCM7XX_CLK_ADC>;
 };
-
-rst: rst@f0801000 {
-	compatible = "nuvoton,npcm750-rst", "syscon",
-	"simple-mfd";
-	reg = <0xf0801000 0x6C>;
-};
-- 
2.14.1
