Return-Path: <Tomer.Maimon@nuvoton.com>
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq4v46MlwzDqY1
 for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2020 20:08:16 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08D9pZSw001985;
 Sun, 13 Sep 2020 12:51:35 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 77284639D5; Sun, 13 Sep 2020 12:51:35 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [dev-5.7 v1 3/4] dts: npcm7xx: remove direct read mapping in FIU
Date: Sun, 13 Sep 2020 12:51:25 +0300
Message-Id: <20200913095126.119727-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200913095126.119727-1-tmaimon77@gmail.com>
References: <20200913095126.119727-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 13 Sep 2020 10:08:17 -0000

Remove direct read mapping in FIU for disable direct read
because SPI-NOR core dosen't support it.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index bd7daa334f6c..a7fabf7b1a3b 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -230,7 +230,7 @@
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+			reg = <0xfb000000 0x1000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPI0>;
 			clock-names = "clk_spi0";
@@ -241,7 +241,7 @@
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xc0000000 0x1000>, <0xA0000000 0x20000000>;
+			reg = <0xc0000000 0x1000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPI3>;
 			clock-names = "clk_spi3";
@@ -254,7 +254,7 @@
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xfb001000 0x1000>, <0xf8000000 0x2000000>;
+			reg = <0xfb001000 0x1000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPIX>;
 			clock-names = "clk_spix";
-- 
2.22.0
