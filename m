Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6D7451A03B0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 07:00:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455134433529164.0929933177107;
 Wed, 10 Feb 2016 12:00:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Updating network and user recipes.
Date: Wed, 10 Feb 2016 14:00:31 -0600
Message-Id: <1455134431-29383-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455134431-29383-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455134431-29383-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 10 Feb 2016 20:00:41 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 .../common/recipes-phosphor/network/network.bb      |  2 +-
 meta-phosphor/common/recipes-phosphor/user/user.bb  | 21 +++++++++++++++++++++
 .../common/recipes-phosphor/user/user/user.service  | 10 ++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/user/user.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/user/user/user.service

diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index fc589ef..55bc627 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-networkd"
 
-SRCREV = "1e1fe01bb7c1b3cebbe484f83b1729be331d3c37"
+SRCREV = "9f804290dd0bf200a1ba28e107eae55bdb4076da"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/user/user.bb b/meta-phosphor/common/recipes-phosphor/user/user.bb
new file mode 100644
index 0000000..a68766c
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/user/user.bb
@@ -0,0 +1,21 @@
+SUMMARY = "User DBUS object"
+DESCRIPTION = "User DBUS object"
+HOMEPAGE = "http://github.com/openbmc/phosphor-networkd"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+
+RDEPENDS_${PN} += "python-dbus python-pygobject python-pexpect"
+
+SRC_URI += "git://github.com/openbmc/phosphor-networkd"
+
+SRCREV = "9f804290dd0bf200a1ba28e107eae55bdb4076da"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}/${sbindir}
+        install ${S}/userman.py ${D}/${sbindir}
+}
+
diff --git a/meta-phosphor/common/recipes-phosphor/user/user/user.service b/meta-phosphor/common/recipes-phosphor/user/user/user.service
new file mode 100644
index 0000000..8c87a5b
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/user/user/user.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=User DBUS object
+Requires=skeleton.service
+After=skeleton.service
+
+[Service]
+ExecStart=/usr/sbin/userman.py
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.1
