Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9289E1A0C30
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:26 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140361931460.32056381634015;
 Thu, 29 Oct 2015 10:39:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Added liboemhandler.so to the official build Moved
 ipmi up to the latest level to allow the ipmid-api.h to be exported in the
 package fixed bb files to ensure RECCOMNDS do not get overwritten
Date: Thu, 29 Oct 2015 12:39:19 -0500
Message-Id: <1446140359-7427-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140359-7427-1-git-send-email-patches@stwcx.xyz>
References: <1446140359-7427-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:27 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../meta-palmetto/conf/machine/palmetto.conf       |  3 +++
 .../recipes-phosphor/host-ipmid/host-ipmid-oem.bb  | 31 ++++++++++++++++++++++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  8 ++++--
 meta-phosphor/conf/machine/include/sample.inc      |  3 +++
 4 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f6256a7..7c137a4 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -1,6 +1,9 @@
 KMACHINE = "aspeed"
 KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
 
+VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
+        host-ipmid-oem \
+       "
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/ibm.inc
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
new file mode 100644
index 0000000..623d7d2
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Phosphor OpenBMC OEM Commands for OpenPOWER systems"
+DESCRIPTION = "Phosphor OpenBMC IPMI OEM commands for OpenPOWER based systems"
+HOMEPAGE = "https://github.com/openbmc/openpower-host-ipmi-oem"
+PR = "r1"
+
+RRECOMMENDS_${PN} = "virtual/obmc-phosphor-host-ipmi-hw"
+
+inherit obmc-phosphor-license
+
+DEPENDS += "systemd    \
+		 	host-ipmid \
+		 	"
+
+
+RDEPENDS_${PN} += "libsystemd"
+
+
+
+SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
+
+SRCREV = "f79a21f3c1e5209f3c911399c3b822ae93bb973d"
+
+FILES_${PN} += "${libdir}/host-ipmid/*.so"
+FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
+
+S = "${WORKDIR}/git"
+
+do_install() {  
+        install -m 0755 -d ${D}${libdir}/host-ipmid
+        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
+}
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index ab3a1cb..74dad62 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -3,7 +3,10 @@ DESCRIPTION = "Phosphor OpenBMC IPMI router and plugin libraries"
 HOMEPAGE = "http://github.com/openbmc/phosphor-host-ipmid"
 PR = "r1"
 
-RRECOMMENDS_${PN} = "virtual/obmc-phosphor-host-ipmi-hw"
+RRECOMMENDS_${PN} += "virtual/obmc-phosphor-host-ipmi-hw"
+
+RRECOMMENDS_${PN} += "${VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers}"
+
 
 inherit obmc-phosphor-license
 inherit obmc-phosphor-sdbus-service
@@ -11,7 +14,8 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "98900a99254cd177c8308b63c341f793d2ac119d"
+SRCREV = "84a5a0a8fdb2a5df9e33ab9132f2c083eaa4b756"
+
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index 16e2980..2b8f986 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -17,6 +17,9 @@ VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
 VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        obmc-phosphor-example-pydbus \
        "
+VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
+        host-ipmid-oem \
+       "
 
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?= "host-ipmi-hw-example"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
-- 
2.6.0
