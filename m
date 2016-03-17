Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQkPX3DxtzDq7K
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 21:00:32 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3qQkPX2CVQz9sRB; Thu, 17 Mar 2016 21:00:32 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH RFC] Add obmc-console project
Date: Thu, 17 Mar 2016 17:55:28 +0800
Message-Id: <1458208528-4143-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Thu, 17 Mar 2016 10:00:32 -0000

This change introduces obmc-console, a little daemon to handle the UART
data and multiplex it to a log and client processes.

This will replace the current hconsole script with a client:
obmc-console-client. We may want to hook this up to a ssh daemon
(running on a separate port) to allow remote console access.

Configuration is handled through /etc/obmc-console.conf; currently this
contains:

  device = ttyS5
  lpc-address = 0x3f8
  sirq = 4

- but we may want to customise that for the hardware as appropriate.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

--

RFC: This change is good for testing, but we should do a little review
& test on various platforms before merging.

---
 meta-phosphor/classes/obmc-phosphor-image.bbclass   |  1 +
 .../recipes-phosphor/obmc-console/obmc-console.bb   | 21 +++++++++++++++++++++
 .../obmc-console/obmc-console/obmc-console.conf     |  3 +++
 .../obmc-console/obmc-console/obmc-console.service  |  8 ++++++++
 4 files changed, 33 insertions(+)
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
index 0000000..2c2cab7
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
+SRCREV = "9326d7791043193b381698f0027dd0d4d92eac07"
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
index 0000000..b8bf87d
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=OpenBMC console daemon
+
+[Service]
+ExecStart=/usr/sbin/obmc-console-server
+
+[Install]
+WantedBy=multi-user.target
-- 
2.5.0
