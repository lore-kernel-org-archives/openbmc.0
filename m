Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 36B711A001E
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454544621675363.3516854497742;
 Wed, 3 Feb 2016 16:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Update recipes and remove dhcp file
Date: Wed,  3 Feb 2016 18:10:20 -0600
Message-Id: <1454544620-20544-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454544620-20544-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454544620-20544-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 04 Feb 2016 00:10:26 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Backout kernel level since tag 20160202 has vuart support that bmc
currently does not support
Pickup IPMI and REST functions to update the MAC address
Remove dhcp file from network recipe that seems to cause issues
Update skeleton with typo fix
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb    | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/network/network.bb       | 4 +---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
index fe00ce3..e14d168 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.3"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20160202-2"
+SRCREV="fe68a785afbaa305506c87c6324f70ed0605385c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index e6527f6..4819d2d 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "83edabb0e05fd71d4905ef255e97f65d966c6e7e"
+SRCREV = "bec22bb7cf730147bf4b036fa9237b8495be4e75"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index 6331678..b75e38c 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -12,14 +12,12 @@ SRC_URI += "git://github.com/openbmc/phosphor-networkd \
             file://80-dhcp.network \
             "
 
-SRCREV = "6b3d6af5b9c38d734f20e859394db275e141328e"
+SRCREV = "1e1fe01bb7c1b3cebbe484f83b1729be331d3c37"
 
 S = "${WORKDIR}/git"
 
 do_install() {
         install -d ${D}/${sbindir}
         install ${S}/netman.py ${D}/${sbindir}
-        install -d ${D}/etc/systemd/network/
-        install ${WORKDIR}/80-dhcp.network ${D}/etc/systemd/network/
 }
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 3cc91d6..d29b68b 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-compression"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "695f5d12e33daece376ddf1f9c7041a5bd6a3c7d"
+SRCREV = "a9b94fed87b652c7bf66fc6bc886c06c49492e01"
 
 S = "${WORKDIR}"
 
-- 
2.6.4
