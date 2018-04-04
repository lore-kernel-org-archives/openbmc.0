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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40GNZY3Y09zF1qK
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 21:11:43 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w34AqX1f020801;
 Wed, 4 Apr 2018 13:52:33 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id EB0C45AA37; Wed,  4 Apr 2018 14:11:05 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, avifishman70@gmail.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/6] arm: dts: add watchdog device to NPCM750 device tree
Date: Wed,  4 Apr 2018 14:10:57 +0300
Message-Id: <1522840262-21635-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1522840262-21635-1-git-send-email-tmaimon77@gmail.com>
References: <1522840262-21635-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2018 11:11:50 -0000

Add watchdog device node to a common device tree for all Nuvoton
NPCM750 BMCs and a board specific device tree for the NPCM750 (Poleg)
evaluation board.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts |  4 ++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi    | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index cabde3d5be8a..4416dd6c7c17 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -18,6 +18,10 @@
 	};
 };
 
+&watchdog1 {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
index 839e45cfd695..cacd0fde5914 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -125,6 +125,30 @@
 				clocks = <&clk 15>;
 			};
 
+			watchdog0: watchdog@801C {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x801C 0x4>;
+				status = "disabled";
+				clocks = <&clk 5>;
+			};
+
+			watchdog1: watchdog@901C {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x901C 0x4>;
+				status = "disabled";
+				clocks = <&clk 5>;
+			};
+
+			watchdog2: watchdog@a01C {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xa01C 0x4>;
+				status = "disabled";
+				clocks = <&clk 5>;
+			};
+
 			serial0: serial@1000 {
 				compatible = "ns16550a";
 				reg = <0x1000 0x1000>;
-- 
2.14.1
