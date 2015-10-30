Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EB8B01A0CD4
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208970890290.5541855118638;
 Fri, 30 Oct 2015 05:42:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Make networkd grab dhcp address
Date: Fri, 30 Oct 2015 07:42:48 -0500
Message-Id: <1446208968-26198-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208968-26198-1-git-send-email-patches@stwcx.xyz>
References: <1446208968-26198-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:56 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes-core/systemd/systemd/default.network | 4 ++++
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend      | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/default.network

diff --git a/meta-phosphor/common/recipes-core/systemd/systemd/default.network b/meta-phosphor/common/recipes-core/systemd/systemd/default.network
new file mode 100644
index 0000000..c75c3d6
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/systemd/systemd/default.network
@@ -0,0 +1,4 @@
+[Match]
+Name=eth*
+[Network]
+DHCP=ipv4
diff --git a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
index b0cf906..680595c 100644
--- a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
@@ -1 +1,9 @@
 PACKAGECONFIG += "networkd"
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+SRC_URI += "file://default.network"
+
+FILES_${PN} += "${libdir}/systemd/network/default.network"
+
+do_install_append() {
+        install -m 644 ${WORKDIR}/default.network ${D}${libdir}/systemd/network/
+}
-- 
2.6.0
