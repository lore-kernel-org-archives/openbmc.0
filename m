Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F1CB91A0191
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 10:50:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454370620769454.68821076943743;
 Mon, 1 Feb 2016 15:50:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add network dbus object to openbmc image
Date: Mon,  1 Feb 2016 17:50:19 -0600
Message-Id: <1454370619-4161-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454370619-4161-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454370619-4161-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 01 Feb 2016 23:50:25 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Create networkd recipe and service files
Add dependency to networkd to the ipmid recipe
since the upcoming ipmi set/get lan ipmi cmds will
make use of the network dbus object
---
 .../recipes-phosphor/host-ipmid/host-ipmid.bb       |  1 +
 .../common/recipes-phosphor/network/network.bb      | 21 +++++++++++++++++++++
 .../network/network/network.service                 | 10 ++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/network/network.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/network/network/network.service

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 174110f..e74a6de 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -15,6 +15,7 @@ inherit obmc-phosphor-c-daemon
 TARGET_CFLAGS   += "-fpic"
 
 RDEPENDS_${PN} += "settings"
+RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
 SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
new file mode 100644
index 0000000..33e2693
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Network DBUS object"
+DESCRIPTION = "Network DBUS object"
+HOMEPAGE = "http://github.com/openbmc/phosphor-networkd"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+
+RDEPENDS_${PN} += "python-dbus python-pygobject"
+
+SRC_URI += "git://github.com/openbmc/phosphor-networkd"
+
+SRCREV = "a657afc9cc76dc6678edb8de9df569f92dd108e1"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}/${sbindir}
+        install ${S}/netman.py ${D}/${sbindir}
+}
+
diff --git a/meta-phosphor/common/recipes-phosphor/network/network/network.service b/meta-phosphor/common/recipes-phosphor/network/network/network.service
new file mode 100644
index 0000000..85a44bb
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/network/network/network.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Network DBUS object
+Requires=skeleton.service
+After=skeleton.service
+
+[Service]
+ExecStart=/usr/sbin/netman.py
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.4
