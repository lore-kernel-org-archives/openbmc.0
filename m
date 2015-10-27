Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1AFCF1A09AE
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:29:59 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445983605401940.236870803708;
 Tue, 27 Oct 2015 15:06:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/2] Add REST server recipe
Date: Tue, 27 Oct 2015 17:06:40 -0500
Message-Id: <1445983600-2660-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445983600-2660-1-git-send-email-patches@stwcx.xyz>
References: <1445983600-2660-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 00:30:00 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 ++++++++++++++++++++++
 .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
new file mode 100644
index 0000000..33f184c
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Phosphor DBUS REST Server"
+DESCRIPTION = "Phosphor DBUS REST manager."
+HOMEPAGE = "http://github.com/openbmc/phosphor-rest-server"
+PR = "r1"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
+
+inherit allarch
+inherit obmc-phosphor-systemd
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+        python-xml \
+        python-dbus \
+        python-pygobject \
+	obmc-mapper \
+        "
+SRC_URI += " \
+        git://github.com/openbmc/phosphor-rest-server \
+        "
+
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
new file mode 100644
index 0000000..eb1c47e
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Phosphor OpenBMC DBus REST daemon
+Requires=obmc-mapper.service
+After=obmc-mapper.service
+
+[Service]
+ExecStart=/usr/sbin/phosphor-rest
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.0
