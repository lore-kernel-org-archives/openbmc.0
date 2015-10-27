Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDC2B1A0468
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 09:09:56 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445983603764167.88298368509356;
 Tue, 27 Oct 2015 15:06:43 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/2] Add object manager recipe
Date: Tue, 27 Oct 2015 17:06:39 -0500
Message-Id: <1445983600-2660-2-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 22:09:58 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++++++++
 .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
 .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
 3 files changed, 43 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
new file mode 100644
index 0000000..2e1ff0f
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Phosphor DBUS Object Manager"
+DESCRIPTION = "Phosphor DBUS object manager."
+HOMEPAGE = "http://github.com/openbmc/phosphor-objmgr"
+PR = "r1"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
+
+inherit allarch
+inherit obmc-phosphor-dbus-service
+inherit obmc-phosphor-systemd
+inherit setuptools
+
+DBUS_SERVICES += "org.openbmc.ObjectMapper"
+RDEPENDS_${PN} += " \
+        python-xml \
+        python-dbus \
+        python-pygobject \
+        "
+SRC_URI += " \
+        git://github.com/openbmc/phosphor-objmgr \
+        "
+
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
new file mode 100644
index 0000000..773eaa5
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Phosphor OpenBMC DBus service management daemon
+
+[Service]
+Type=dbus
+ExecStart=/usr/sbin/phosphor-mapper
+BusName=org.openbmc.objectmapper
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf
new file mode 100644
index 0000000..9a26ab9
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf
@@ -0,0 +1,8 @@
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <policy user="root">
+    <allow own="org.openbmc.ObjectMapper"/>
+    <allow send_destination="org.openbmc.ObjectMapper"/>
+  </policy>
+</busconfig>
-- 
2.6.0
