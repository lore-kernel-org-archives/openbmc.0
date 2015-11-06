Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C128A1A0D36
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 16:21:28 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1446787284555608.7990197239942;
 Thu, 5 Nov 2015 21:21:24 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add ipmitool for qemu image only
Date: Thu,  5 Nov 2015 23:21:21 -0600
Message-Id: <1446787281-15293-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446787281-15293-1-git-send-email-patches@stwcx.xyz>
References: <1446787281-15293-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 06 Nov 2015 05:21:29 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../recipes-phosphor/host-ipmid/host-ipmid-tool.bb | 37 ++++++++++++++++++++++
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-tool.bb

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-tool.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-tool.bb
new file mode 100644
index 0000000..2a4d670
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-tool.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Phosphor ipmi tool for injecting ipmi commands"
+DESCRIPTION = "IPMI Tool with dbus capabilities"
+HOMEPAGE = "https://github.com/openbmc/ipmitool"
+PR = "r1"
+
+
+RRECOMMENDS_${PN} = "virtual/obmc-phosphor-host-ipmi-hw"
+
+inherit obmc-phosphor-license
+
+DEPENDS += "systemd    \
+		 	host-ipmid \
+		 	"
+
+RDEPENDS_${PN} += "libsystemd	\
+                   libcrypto	\
+                   "
+
+
+SRC_URI += "git://github.com/openbmc/ipmitool"
+
+SRCREV = "e9b9c1a9677a3de19726d036cfb07d8d61bbccd8"
+
+
+S = "${WORKDIR}/git"
+
+
+do_compile() {
+	${S}/bootstrap --enable-intf-dbus
+	${S}/configure --host x86_64
+	make
+}
+
+do_install() {  
+	install -m 0755 -d ${D}${sbindir}
+	install -m 0755 ${S}/src/ipmitool ${D}${sbindir}
+}
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index acbfee6..f6fe46d 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -20,6 +20,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
 VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
         host-ipmid-oem \
         host-ipmid-fru \
+        host-ipmid-tool \
        "
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-hw-example"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
-- 
2.6.0
