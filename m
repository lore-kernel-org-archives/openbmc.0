Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlrQg4CXxzDqBg
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 16:30:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146061544475163.78262895655246;
 Wed, 13 Apr 2016 23:30:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/3] obmc-console: Add ssh endpoint
Date: Thu, 14 Apr 2016 01:30:35 -0500
Message-Id: <1460615435-26806-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Apr 2016 06:30:52 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../recipes-phosphor/obmc-console/obmc-console.bb    | 20 +++++++++++++++++++-
 .../obmc-console/obmc-console-ssh.socket             | 11 +++++++++++
 .../obmc-console/obmc-console-ssh@.service           | 11 +++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
index 75a1d84..e5553fe 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
@@ -10,12 +10,30 @@ inherit autotools
 TARGET_CFLAGS   += "-fpic -O2"
 
 SRC_URI += "git://github.com/openbmc/obmc-console"
-SRC_URI += "file://${PN}.conf"
+SRC_URI += "file://${PN}.conf \
+	    file://obmc-console-ssh.socket \
+	    file://obmc-console-ssh@.service"
+
 SRCREV = "2eacda524e98c7964e542e01aabf82360cf60344"
 
+FILES_${PN} += "${systemd_unitdir}/system/obmc-console-ssh@.service \
+		${systemd_unitdir}/system/obmc-console-ssh.socket"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service ${BPN}-ssh.socket"
+
 do_install_append() {
         install -m 0755 -d ${D}${sysconfdir}
         install -m 0644 ${WORKDIR}/${PN}.conf ${D}${sysconfdir}/${PN}.conf
+
+	# add additional unit files for ssh-based console server
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/obmc-console-ssh@.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/obmc-console-ssh.socket ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' \
+		${D}${systemd_unitdir}/system/obmc-console-ssh@.service \
+		${D}${systemd_unitdir}/system/obmc-console-ssh.socket
 }
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket
new file mode 100644
index 0000000..3fbfd99
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket
@@ -0,0 +1,11 @@
+[Unit]
+Description=OpenBMC console ssh server socket
+Conflicts=obmc-console-ssh.service
+Requires=obmc-console.service
+
+[Socket]
+ListenStream=2200
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service
new file mode 100644
index 0000000..74d5a7a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=OBMC console SSH Per-Connection Server
+Wants=obmc-console.service
+
+[Service]
+Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
+EnvironmentFile=-/etc/default/dropbear
+ExecStart=-@SBINDIR@/dropbear -i -r ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key -c @BINDIR@/obmc-console-client $DROPBEAR_EXTRA_ARGS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+StandardInput=socket
+KillMode=process
-- 
2.7.1
