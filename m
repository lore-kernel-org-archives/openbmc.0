Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 196971A0742
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:17:06 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659423805612.6582437988462;
 Mon, 12 Oct 2015 07:17:03 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 7/7] bitbake and package files for host-ipmid
Date: Mon, 12 Oct 2015 09:16:40 -0500
Message-Id: <1444659400-4196-8-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:17:07 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 .../host-ipmid/files/host-ipmid.service              |  8 ++++++++
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb | 20 ++++++++++++++++++++
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
new file mode 100644
index 0000000..0636f12
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
@@ -0,0 +1,8 @@
+[Unit]
+Description="Phosphor OpenBMC IPMI daemon"
+
+[Service]
+ExecStart=/usr/sbin/ipmid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
new file mode 100644
index 0000000..9741e61
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Phosphor OpenBMC IPMI daemon"
+DESCRIPTION = "Phosphor OpenBMC IPMI router and plugin libraries"
+HOMEPAGE = "http://github.com/openbmc/phosphor-host-ipmid"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+
+DEPENDS += "glib-2.0"
+SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
+
+SRCREV = "02d37aab090090af9a779f4039931a6721bff615"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -m 0755 -d ${D}${sbindir} ${D}${libdir} ${D}${libdir}/host-ipmid/
+        install -m 0755 ${S}/ipmid ${D}${sbindir}/
+        install -m 0755 ${S}/libapphandler.so ${D}${libdir}/host-ipmid/
+}
diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index 8aa6ba8..4dbcdd3 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -25,6 +25,7 @@ PACKAGES = " \
 SUMMARY_packagegroup-obmc-phosphor-apps-extras = "Extra features"
 RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
         rest-dbus \
+        host-ipmid \
         "
 
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
-- 
2.6.0
