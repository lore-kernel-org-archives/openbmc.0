Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV3jN668bzDq6X
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 07:10:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458677442867486.8702687926062;
 Tue, 22 Mar 2016 13:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/4] u-boot: Apply patch to stop aspeednic dma
Date: Tue, 22 Mar 2016 15:10:36 -0500
Message-Id: <1458677439-17628-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 22 Mar 2016 20:10:49 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Apply Norm's mac-stop patch that calls the halt method after calling
the init method in the aspeednic initialize function.

While alternative patches exist that touch less hardware, this simple
patch will prevent the memory alteration when the network is not used
during u-boot.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../u-boot/files/aspeednic-mac-stop.patch          | 36 ++++++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/aspeednic-mac-stop.patch

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/aspeednic-mac-stop.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/aspeednic-mac-stop.patch
new file mode 100644
index 0000000..bb53c40
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/aspeednic-mac-stop.patch
@@ -0,0 +1,36 @@
+commit a7517cfcebd9ea45d65b3fbc6438602dd28cae86
+Author: Norman James <njames@us.ibm.com>
+Commit: Norman James <njames@us.ibm.com>
+
+    MAC needs to be stopped after starting
+    
+    We found that u-boot network was corrupting kernel memory.
+    This is because aspeednic_init is called at startup,
+    but if the u-boot network is not used, the network driver
+    is not cleaned up.  This fix is a temporary hack and just calls
+    the halt function after the init. This driver needs to be
+    reworked to not start network initially and use set_hwaddr hook
+    to setup MAC address.
+    
+    Signed-off-by: Norman James <nkskjames@gmail.com>
+
+diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
+index d70c7ab..a870c4a 100644
+--- a/drivers/net/aspeednic.c
++++ b/drivers/net/aspeednic.c
+@@ -580,6 +580,7 @@ int aspeednic_initialize(bd_t *bis)
+ #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
+   miiphy_register(dev->name, faraday_mdio_read, faraday_mdio_write);
+ #endif
++  dev->halt(dev);
+ 
+   return 1;
+ }
+@@ -1359,6 +1360,7 @@ static int aspeednic_recv(struct eth_device* dev)
+ 
+ static void aspeednic_halt(struct eth_device* dev)
+ {
++  printf("Stopping Network\n");
+   STOP_MAC(dev);
+ }
+ 
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
index 50adb9f..774419f 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
@@ -2,6 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://fw_env.config"
 SRC_URI += "file://config.patch"
+SRC_URI += "file://aspeednic-mac-stop.patch"
 
 # Do not install u-boot in rootfs
 #do_install[postfuncs] += "remove_uboot_from_rootfs"
-- 
2.7.1
