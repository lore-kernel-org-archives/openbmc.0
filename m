Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qp9ZW1sR5zDqBG
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 11:30:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460943039613129.69096655093233;
 Sun, 17 Apr 2016 18:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 4/7] linux-obmc: Add a devicetree for QEMU
 palmetto-bmc machine
Date: Sun, 17 Apr 2016 20:30:30 -0500
Message-Id: <1460943033-24624-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460943033-24624-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460943033-24624-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Apr 2016 01:30:43 -0000

From: Andrew Jeffery <andrew@aj.id.au>

The patch adds a separate devicetree file specifically for QEMU,
integrating the Cadence GEM device which is configured with the MMIO
base and IRQ for what would be MAC2.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 ...d-qemupalmetto-dts-with-Cadence-GEM-suppo.patch | 43 ++++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch
new file mode 100644
index 0000000..3734bb0
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch
@@ -0,0 +1,43 @@
+From 70f44f3fa819e2c13726895a2c1e3c5e8fa51eef Mon Sep 17 00:00:00 2001
+From: Andrew Jeffery <andrew@aj.id.au>
+Date: Mon, 21 Mar 2016 13:49:47 +1030
+Subject: [PATCH] arch/arm: Add qemupalmetto dts with Cadence GEM support
+
+Describes a machine that is as similar to the Palmetto BMC, primarily for
+running under QEMU. Relaxing the constraint of booting the exact Palmetto
+BMC hardware in QEMU allows us to integrate existing device models to expand
+the machine's capability without huge effort.
+
+In this case, the Cadence GEM controller is integrated to provide networking.
+
+Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
+---
+ arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+ create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts
+
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts
+new file mode 100644
+index 0000000..b0915cd
+--- /dev/null
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts
+@@ -0,0 +1,16 @@
++#include "aspeed-bmc-opp-palmetto.dts"
++
++/ {
++	ahb {
++		mac1: ethernet@1e680000 {
++			compatible = "cdns,gem";
++			reg = <0x1e680000 0x1000>;
++			interrupts = <3>;
++			clock-names = "pclk", "hclk", "tx_clk";
++			clocks = <&clk_apb>, <&clk_apb>, <&clk_apb>;
++			status = "okay";
++			#address-cells = <1>;
++			#size-cells = <0>;
++		};
++	};
++};
+-- 
+2.5.0
+
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
index a49c239..a56c34c 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
 SRC_URI += "file://palmetto.cfg"
+SRC_URI += "file://0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch"
-- 
2.7.1
