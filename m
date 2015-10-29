Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B2E731A0C26
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 07:11:45 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446149500317449.9508894222207;
 Thu, 29 Oct 2015 13:11:40 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc v4 2/4] Add REST server recipe
Date: Thu, 29 Oct 2015 15:11:32 -0500
Message-Id: <1446149494-11061-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446149494-11061-1-git-send-email-patches@stwcx.xyz>
References: <1446149494-11061-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 20:11:46 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 ++++++++++++++++++++++
 .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
new file mode 100644
index 0000000..0162ec5
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
+SRCREV = "2f7aef50b005c16a51065984f090e787c04c0c14"
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
