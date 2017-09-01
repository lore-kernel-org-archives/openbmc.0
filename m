Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xkKjK32hWzDqYs
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 23:24:52 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 1 Sep 2017 16:24:48 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v81DOmYx007820;
 Fri, 1 Sep 2017 16:24:48 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [PATCH linux dev-4.10] mellanox: msn: change flash layout.
Date: Fri,  1 Sep 2017 16:24:47 +0300
Message-Id: <20170901132447.48345-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 13:24:54 -0000

Remove mellanox-msn-flash-layout.
And set opp-flash-layout for mellanox msn.
We decided that it would better for compatibility.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 .../dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi  | 32 ----------------------
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
deleted file mode 100644
index cf8ee54f13c2..000000000000
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
+++ /dev/null
@@ -1,32 +0,0 @@
-/* This file is the label for the bmc primary flash and its partitions */
-				label = "bmc";
-				#address-cells = < 1 >;
-				#size-cells = < 1 >;
-				u-boot {
-					reg = < 0 0x60000 >;
-					label = "u-boot";
-				};
-				u-boot-env {
-					reg = < 0x60000 0x10000>;
-					label = "u-boot-env";
-				};
-				kernel  {
-					reg = < 0x70000 0x280000 >;
-					label = "kernel";
-				};
-				dtb  {
-					reg = < 0x2f0000 0x10000 >;
-					label = "dtb";
-				};
-				initramfs {
-					reg = < 0x300000 0x1c0000 >;
-					label = "initramfs";
-				};
-				rofs  {
-					reg = < 0x4c0000 0x1740000 >;
-					label = "rofs";
-				};
-				rwfs  {
-					reg = < 0x1c00000 0x400000 >;
-					label = "rwfs";
-				};
diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index b7854e36f052..d1dc2ef1a162 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -24,7 +24,7 @@
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-#include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
+#include "aspeed-bmc-opp-flash-layout.dtsi"
 	};
 };
 
-- 
2.11.0
