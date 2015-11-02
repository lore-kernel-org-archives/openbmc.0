Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A0FBF1A03C3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:11:58 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469913165573.0347493706033;
 Mon, 2 Nov 2015 05:11:53 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add ipmi fru write to dbus
Date: Mon,  2 Nov 2015 07:11:49 -0600
Message-Id: <1446469909-23102-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469909-23102-1-git-send-email-patches@stwcx.xyz>
References: <1446469909-23102-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 13:11:59 -0000

From: Chris Austen <austenc@us.ibm.com>

x
---
 .../conf/machine/include/openpower.inc             |  1 +
 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb  | 31 ++++++++++++++++++++++
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 820b0eb..48edd92 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -20,6 +20,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        "
 VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
         host-ipmid-oem \
+        host-ipmid-fru \
        "
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "btbridged"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "skeleton"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
new file mode 100644
index 0000000..a4dcfab
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Phosphor OpenBMC WriteFRU for OpenPOWER systems"
+DESCRIPTION = "Phosphor OpenBMC WriteFRU for  OpenPOWER based systems"
+HOMEPAGE = "https://github.com/openbmc/ipmi-fru-parser"
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
+TARGET_CFLAGS += "-std=gnu++14"
+
+SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
+
+SRCREV = "675272789d4dba9a8c308f3cb1f7deb8b5b2ec41"
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
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index 2b8f986..040cc57 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -19,6 +19,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        "
 VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
         host-ipmid-oem \
+        host-ipmid-fru \
        "
 
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?= "host-ipmi-hw-example"
-- 
2.6.0
