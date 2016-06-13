Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSz6q23r8zDqc3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 02:40:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465836039248201.44001740018723;
 Mon, 13 Jun 2016 09:40:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/2] Support multiple systemd service files
Date: Mon, 13 Jun 2016 11:40:32 -0500
Message-Id: <20160613164033.16638-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613164033.16638-1-openbmc-patches@stwcx.xyz>
References: <20160613164033.16638-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 16:40:52 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Enhance obmc-phosphor-systemd such that an array of service/template
socket files in SYSTEMD_SERVICES_${PN} works.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../classes/obmc-phosphor-systemd.bbclass          | 56 ++++++++++++++++++----
 .../host-ipmi-hw-example.service                   |  9 ----
 .../host-ipmi-hw-example/host-ipmi-hw.service      |  9 ++++
 3 files changed, 56 insertions(+), 18 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service

diff --git a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
index 12e0bc1..b07174f 100644
--- a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
@@ -1,14 +1,52 @@
-# Common code for Phosphor OpenBMC systemd services.
-
+# Common code for systemd based services.
+#
+# Prior to inheriting this class, recipes can define services like this:
+#
+# SYSTEMD_SERVICE_${PN} = "foo.service bar.socket baz@.service"
+#
+# and these files will be added to the main package if they exist.
+#
+# Alternatively this class can just be inherited and
+# ${BPN}.service will be added to the main package.
 inherit systemd
 
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SRC_URI += " \
-        file://${BPN}.service \
-        "
+
+python() {
+    bpn = d.getVar('BPN', True)
+    searchpaths = d.getVar('FILESPATH', True)
+
+    services = d.getVar('SYSTEMD_SERVICE_' + bpn, True)
+
+    if services:
+        services = services.split()
+    else:
+        services = [bpn + '.service']
+
+    for s in services:
+        file = s
+        path = bb.utils.which(searchpaths, file)
+        if os.path.isfile(path):
+            d.appendVar('SRC_URI', ' file://' + file)
+            d.appendVar(
+                'FILES_' + bpn, ' ' +
+                d.getVar('systemd_system_unitdir', True) + file)
+            d.appendVar('OBMC_SYSTEMD_SERVICES', ' ' + file)
+            if file not in (d.getVar('SYSTEMD_SERVICE_' + bpn, True) or "").split():
+                d.appendVar('SYSTEMD_SERVICE_' + bpn, ' ' + file)
+        else:
+            bb.error("Could not find service file: %s" % file)
+}
 
 do_install_append() {
-        # install systemd unit files
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system
+        # install systemd service/socket/template files
+        if [ "${OBMC_SYSTEMD_SERVICES}" ]; then
+                install -d ${D}${systemd_system_unitdir}
+        fi
+        for s in ${OBMC_SYSTEMD_SERVICES}; do
+                install -m 0644 ${WORKDIR}/$s ${D}${systemd_system_unitdir}
+                sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+                        -e 's,@BINDIR@,${bindir},g' \
+                        -e 's,@SBINDIR@,${sbindir},g' \
+                        ${D}${systemd_system_unitdir}/$s
+        done
 }
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
deleted file mode 100644
index e15d8d7..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=Phosphor OpenBMC host IPMI to DBUS example implementation
-
-[Service]
-Restart=always
-ExecStart=/usr/sbin/host-ipmi-hw
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service
new file mode 100644
index 0000000..e15d8d7
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Phosphor OpenBMC host IPMI to DBUS example implementation
+
+[Service]
+Restart=always
+ExecStart=/usr/sbin/host-ipmi-hw
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.4
