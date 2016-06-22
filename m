Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZZhW28hTzDqlG
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 05:40:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466624452082932.2672401080791;
 Wed, 22 Jun 2016 12:40:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v3 9/9] Temporarily move u-boot to Joel's tree
Date: Wed, 22 Jun 2016 14:40:36 -0500
Message-Id: <20160622194036.23925-10-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622194036.23925-1-openbmc-patches@stwcx.xyz>
References: <20160622194036.23925-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 19:41:00 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc       | 6 +++---
 .../meta-ibm/meta-firestone/conf/machine/firestone.conf             | 2 +-
 .../meta-ibm/meta-garrison/conf/machine/garrison.conf               | 2 +-
 .../meta-ibm/meta-palmetto/conf/machine/palmetto.conf               | 2 +-
 .../meta-rackspace/meta-barreleye/conf/machine/barreleye.conf       | 2 +-
 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  | 6 +++---
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb           | 6 +++---
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 8510a03..d67959a 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -4,10 +4,10 @@
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
 PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
-PREFERRED_VERSION_u-boot ?= "v2013.07+git%"
-PREFERRED_VERSION_u-boot-fw-utils ?= "v2013.07+git%"
+PREFERRED_VERSION_u-boot ?= "v2016.05+git%"
+PREFERRED_VERSION_u-boot-fw-utils ?= "v2016.05+git%"
 
-UBOOT_MACHINE ?= "palmetto_config"
+UBOOT_MACHINE ?= "ast_g4_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
 UBOOT_LOADADDRESS ?= "0x40001000"
 
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
index 42f2d29..fa0d35e 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
@@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/ibm.inc
 
-UBOOT_MACHINE_firestone = "palmetto_config"
+UBOOT_MACHINE_firestone = "ast_g4_config"
 UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
index 4fd03fd..820a513 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
@@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/ibm.inc
 
-UBOOT_MACHINE_garrison = "palmetto_config"
+UBOOT_MACHINE_garrison = "ast_g4_config"
 UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f6256a7..e69a9af 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/ibm.inc
 
-UBOOT_MACHINE_palmetto = "palmetto_config"
+UBOOT_MACHINE_palmetto = "ast_g4_config"
 UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
index f9d31f1..d861f74 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
@@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/rackspace.inc
 
-UBOOT_MACHINE_barreleye = "palmetto_config"
+UBOOT_MACHINE_barreleye = "ast_g4_config"
 UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
index 80d90fa..3ec77a6 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-SRCREV = "47441cc36bb8e919a066837e4d7c5a8a1c475da4"
-UBRANCH = "v2016.05-ast2500"
-SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+SRCREV = "d347555e6ee8d72831c5d65e2bbedf48864bd5df"
+UBRANCH = "v2016.05-aspeed-openbmc"
+SRC_URI = "git://git@github.com/shenki/u-boot.git;branch=${UBRANCH};protocol=https"
 
 PV = "v2016.05+git${SRCPV}"
 
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
index f1d6318..dc5c274 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
@@ -3,9 +3,9 @@ require recipes-bsp/u-boot/u-boot.inc
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 DEPENDS += "dtc-native"
 
-SRCREV = "47441cc36bb8e919a066837e4d7c5a8a1c475da4"
-UBRANCH = "v2016.05-ast2500"
-SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+SRCREV = "d347555e6ee8d72831c5d65e2bbedf48864bd5df"
+UBRANCH = "v2016.05-aspeed-openbmc"
+SRC_URI = "git://git@github.com/shenki/u-boot.git;branch=${UBRANCH};protocol=https"
 
 PV = "v2016.05+git${SRCPV}"
 
-- 
2.9.0
