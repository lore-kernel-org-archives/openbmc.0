Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX81ZdSzDq6y
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=GCLhBoZb; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id B635B334075
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 iBOQgbaVkDdnSpEA12pW8VvKEL8=; b=GCLhBoZb+AKIFPb4tVicAATsq+8hxAhR
 T90Ig2htKoo8qQc8ojq+Ylojv14APIO9WZcOa4n1qvQ4Rj3R6rGSxvxag+h6++3i
 /P9fDOTUPZCFf20MkQ/IaCFLnsAHLnVgs3lIX1Raqllsmio6l72u8ZaQ7m/LzdHV
 mYKAYCq+DQQ=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 4396733406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:50 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 5/8] linux-obmc: Add a devicetree for QEMU
 palmetto-bmc machine
Date: Wed, 23 Mar 2016 18:33:32 +1030
Message-Id: <1458720215-25302-6-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:52 -0000

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
2.5.0
