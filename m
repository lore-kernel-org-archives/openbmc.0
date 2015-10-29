Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 30B011A0C35
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:16:28 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446146183029317.2499413251911;
 Thu, 29 Oct 2015 12:16:23 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/2] Turn off u-boot phy probing on Barreleye
Date: Thu, 29 Oct 2015 14:16:17 -0500
Message-Id: <1446146177-30186-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446146177-30186-1-git-send-email-patches@stwcx.xyz>
References: <1446146177-30186-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 19:16:28 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../recipes-bsp/u-boot/files/u-boot-barreleye.patch         | 13 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend             |  3 +++
 .../meta-rackspace/meta-barreleye/recipes.txt               |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/files/u-boot-barreleye.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes.txt

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/files/u-boot-barreleye.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/files/u-boot-barreleye.patch
new file mode 100644
index 0000000..dab24f6
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/files/u-boot-barreleye.patch
@@ -0,0 +1,13 @@
+Index: git/drivers/net/aspeednic.c
+===================================================================
+--- git.orig/drivers/net/aspeednic.c	2015-10-29 13:23:42.225712001 -0500
++++ git/drivers/net/aspeednic.c	2015-10-29 13:26:52.205712001 -0500
+@@ -1155,7 +1155,7 @@
+ 
+   RESET_DE4X5(dev);
+ 
+-  aspeednic_probe_phy(dev);
++  //aspeednic_probe_phy(dev);
+ 
+   set_mac_address (dev, bis);
+   set_mac_control_register (dev);
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
new file mode 100644
index 0000000..1eeec2e
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_append := "${THISDIR}/files:"
+
+SRC_URI += "file://u-boot-barreleye.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes.txt
new file mode 100644
index 0000000..4bfc836
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes.txt
@@ -0,0 +1,2 @@
+recipes-bsp          - Anything with links to specific hardware or hardware configuration information
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.6.0
