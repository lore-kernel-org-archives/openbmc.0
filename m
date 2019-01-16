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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fvJK4Xc4zDqdf
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 04:26:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0GGuJKJ014236;
 Wed, 16 Jan 2019 18:56:19 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7025562DA6; Wed, 16 Jan 2019 19:26:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 1/3] dt-binding: iio: Modify NPCM ADC documentation
Date: Wed, 16 Jan 2019 19:26:13 +0200
Message-Id: <20190116172615.203952-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190116172615.203952-1-tmaimon77@gmail.com>
References: <20190116172615.203952-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 17:26:26 -0000

Removing unnecessary spaces in NPCM ADC documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
index 6f0843d837cc..1b8132cd9060 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -3,16 +3,16 @@ Nuvoton NPCM Analog to Digital Converter (ADC)
 The NPCM ADC is a 10-bit converter for eight channel inputs.
 
 Required properties:
-- compatible	: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
-- reg			: specifies physical base address and size of the registers.
-- interrupts	: Contain the ADC interrupt with flags for falling edge.
+- compatible: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
+- reg: specifies physical base address and size of the registers.
+- interrupts: Contain the ADC interrupt with flags for falling edge.
 
 Optional properties:
-- clocks		: phandle of ADC reference clock, in case the clock is not
-				  added the ADC will use the default ADC sample rate.
-- vref-supply	: The regulator supply ADC reference voltage, in case the
-				  vref-supply is not added the ADC will use internal voltage
-				  reference.
+- clocks: phandle of ADC reference clock, in case the clock is not
+		  added the ADC will use the default ADC sample rate.
+- vref-supply: The regulator supply ADC reference voltage, in case the
+			   vref-supply is not added the ADC will use internal voltage
+			   reference.
 
 Required Node in the NPCM7xx BMC:
 An additional register is present in the NPCM7xx SOC which is
-- 
2.14.1
