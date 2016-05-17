Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8KWb75NQzDqDm
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:31:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463495456034341.2445723564397;
 Tue, 17 May 2016 07:30:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2] Allow multiple systemd service files
Date: Tue, 17 May 2016 09:30:53 -0500
Message-Id: <1463495453-27825-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463495453-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463495453-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 14:31:08 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Enhance the obmc-phosphor-systemd class such that an array
of service files in SYSTEMD_SERVICES works.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/obmc-phosphor-systemd.bbclass    | 18 +++++++++++++-----
 .../host-ipmi-hw-example/host-ipmi-hw-example.service  |  8 --------
 .../host-ipmi-hw-example/host-ipmi-hw.service          |  8 ++++++++
 3 files changed, 21 insertions(+), 13 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service

diff --git a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
index 12e0bc1..44d363e 100644
--- a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
@@ -2,13 +2,21 @@
 
 inherit systemd
 
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SRC_URI += " \
-        file://${BPN}.service \
-        "
+SYSTEMD_SERVICE_${PN} ?= "${BPN}.service"
+
+python() {
+        service_files = d.getVar(
+                'SYSTEMD_SERVICE_' + d.getVar('BPN', True),
+                True)
+        if service_files:
+                uris = " ".join(['file://' + s for s in service_files.split()])
+                d.appendVar('SRC_URI', ' ' + uris)
+}
 
 do_install_append() {
         # install systemd unit files
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system
+        for i in ${SYSTEMD_SERVICE_${PN}}; do
+                install -m 0644 ${WORKDIR}/$i ${D}${systemd_unitdir}/system
+        done
 }
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
deleted file mode 100644
index b6baa6f..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=Phosphor OpenBMC host IPMI to DBUS example implementation
-
-[Service]
-ExecStart=/usr/sbin/host-ipmi-hw
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service
new file mode 100644
index 0000000..b6baa6f
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC host IPMI to DBUS example implementation
+
+[Service]
+ExecStart=/usr/sbin/host-ipmi-hw
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.2
