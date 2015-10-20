Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2EF4C1A072C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:17 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368815669919.9273647742317;
 Tue, 20 Oct 2015 12:20:15 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 07/20] Add recipe for host IPMI DBUS to BT
Date: Tue, 20 Oct 2015 14:19:45 -0500
Message-Id: <1445368798-31274-8-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:18 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb  | 17 +++++++++++++++++
 .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service        |  8 ++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
new file mode 100644
index 0000000..830f754
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Phosphor OpenBMC BT to DBUS"
+DESCRIPTION = "Phosphor OpenBMC BT to DBUS."
+PR = "r1"
+
+RDEPENDS_${PN} += "python-subprocess"
+
+SYSTEMD_SERVICE_${PN} = "host-ipmi-bt.service"
+
+inherit obmc-phosphor-pydbus-service
+inherit obmc-phosphor-host-ipmi-hw
+
+S = "${WORKDIR}/git"
+SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
+SRCREV="${AUTOREV}"
+
+SCRIPT_NAME = "ipmid.py"
+INSTALL_NAME = "host-ipmi-bt"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service
new file mode 100644
index 0000000..dfc0416
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC BT to DBUS 
+
+[Service]
+ExecStart=/usr/sbin/host-ipmi-bt
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.0
