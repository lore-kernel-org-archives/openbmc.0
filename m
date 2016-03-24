Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qW24j3zWDzDqFM
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 21:00:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458813643826734.2875629532899;
 Thu, 24 Mar 2016 03:00:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add obmc-console project
Date: Thu, 24 Mar 2016 05:00:40 -0500
Message-Id: <1458813640-3032-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458813640-3032-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458813640-3032-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 24 Mar 2016 10:00:54 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces obmc-console, a little daemon to handle the UART
data and multiplex it to a log and client processes.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass   |  1 +
 .../recipes-phosphor/obmc-console/obmc-console.bb   | 21 +++++++++++++++++++++
 .../obmc-console/obmc-console/obmc-console.conf     |  3 +++
 .../obmc-console/obmc-console/obmc-console.service  |  9 +++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 164da33..ce54777 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -42,6 +42,7 @@ IMAGE_INSTALL += " \
         i2c-tools \
         screen \
         inarp \
+        obmc-console \
         "
 
 def build_overlay(d):
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
new file mode 100644
index 0000000..6fe3bde
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
@@ -0,0 +1,21 @@
+SUMMARY = "OpenBMC console daemon"
+DESCRIPTION = "Daemon to handle UART console connections"
+HOMEPAGE = "http://github.com/openbmc/obmc-console"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+inherit autotools
+
+TARGET_CFLAGS   += "-fpic -O2"
+
+SRC_URI += "git://github.com/openbmc/obmc-console"
+SRC_URI += "file://${PN}.conf"
+SRCREV = "54e9569d14b127806e45e1c17ec4a1f5f7271d3f"
+
+do_install_append() {
+        install -m 0755 -d ${D}${sysconfdir}
+        install -m 0644 ${WORKDIR}/${PN}.conf ${D}${sysconfdir}/${PN}.conf
+}
+
+S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf
new file mode 100644
index 0000000..d324efc
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf
@@ -0,0 +1,3 @@
+device = ttyS5
+lpc-address = 0x3f8
+sirq = 4
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service
new file mode 100644
index 0000000..4e08541
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=OpenBMC console daemon
+
+[Service]
+ExecStart=/usr/sbin/obmc-console-server
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.1
