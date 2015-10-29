Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 865861A0BF0
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 07:11:45 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446149498754171.38647484977662;
 Thu, 29 Oct 2015 13:11:38 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc v4 1/4] Add object manager recipe
Date: Thu, 29 Oct 2015 15:11:31 -0500
Message-Id: <1446149494-11061-2-git-send-email-patches@stwcx.xyz>
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
 .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++++++++
 .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
 .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
 3 files changed, 43 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
new file mode 100644
index 0000000..35130cc
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
+SRCREV = "64d9b0ce3697c4fc3e000815667b0ced47af5ed6"
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
