Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E32F21A0B50
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218033586940.7847630017445;
 Tue, 15 Dec 2015 14:20:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux 3/3] openbmc: add spi-nor to palmetto
Date: Tue, 15 Dec 2015 16:20:30 -0600
Message-Id: <1450218030-11874-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218030-11874-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218030-11874-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:38 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This patch updates the openpower palmetto BMC device tree to add
a 32MB spi-nor to the static memory controller for the BMC use and
a 32MB spi-nor to the SPI memory controller for the PNOR.

The BMC nor has device tree partitions for u-boot, the uboot environment,
the kernel, and the remaining space for an initrd.  I kept the sizes
matching what the current openbmc build is making.  The current initrd
is between 16 an 17MB and 29MB is allocated.

The PNOR is given as one PNOR partition.  There is no partitioning
support in the current kernel for the ffs system used by openpower.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 2c3e824..79bc298 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -7,6 +7,59 @@
 	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
 
 	ahb {
+		fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			bmc@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "bmc0";
+				/*
+				 * Possibly required props:
+				 * spi-max-frequency = <>
+				 * spi-tx-bus-width = <>
+				 * spi-rx-bus-width  = <>
+				 * m25p,fast-read
+				 * spi-cpol if inverse clock polarity (CPOL)
+				 * spi-cpha if shifted clock phase (CPHA)
+				 */
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				u-boot {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				kernel  {
+					reg = < 0x80000 0x280000 >;
+					label = "kernel";
+				};
+				initrd  {
+					reg = < 0x300000 0x1d00000 >;
+					label = "initrd";
+				};
+			};
+		};
+		spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,smc";
+			pnor {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+				/* spi-max-frequency = <>; */
+				/* m25p,fast-read; */
+			};
+		};
 		apb {
 			i2c: i2c@1e78a040 {
 				i2c0: i2c-bus@40 {
-- 
2.6.3
