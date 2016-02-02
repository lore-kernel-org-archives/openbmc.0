Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 685B11A01B2
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 11:00:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454371231603647.1633828755745;
 Mon, 1 Feb 2016 16:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update recipes to pick changes for Foxconn build
Date: Mon,  1 Feb 2016 18:00:29 -0600
Message-Id: <1454371229-4435-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 00:00:37 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Update recipes to pick up changes required for Foxconn delivery
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 meta-phosphor/common/recipes-phosphor/settings/settings.bb         | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
index 3b1eec8..13887e6 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.3"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20160127-1"
+SRCREV="7fbee5252ddea512c208727377de7df5968ee8f1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 5eed1f4..06ee00e 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "63696f4b23c9fd0a84ce539a6414ada406aaf229"
+SRCREV = "a14239a201443222906864273449a39cfa84118e"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 174110f..859cbfa 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -17,7 +17,7 @@ TARGET_CFLAGS   += "-fpic"
 RDEPENDS_${PN} += "settings"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
+SRCREV = "e49bc5105ebe766e563046f7f07b6bc22b615d4a"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings.bb b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
index 1c5fe28..d1fa639 100644
--- a/meta-phosphor/common/recipes-phosphor/settings/settings.bb
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-settingsd"
 
-SRCREV = "33e0930724c12f83ddf99f7452fc0551ac10ccfc"
+SRCREV = "3bda531d94f4c93473bbedd7d7e5c44d4d9da93b"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index fab50ea..f872625 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "abe4953f941f63b4a3f531af15f6dba68870f3a9"
+SRCREV = "a429349046a0c9a38ee08ffe19e7781136ca73d2"
 
 S = "${WORKDIR}"
 
-- 
2.6.4
