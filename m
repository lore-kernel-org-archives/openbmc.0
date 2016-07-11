Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnspx3FFDzDqwx
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:40:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468212033949305.91036027700136;
 Sun, 10 Jul 2016 21:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] systemd: Add OpenBMC standby target
Date: Sun, 10 Jul 2016 23:40:31 -0500
Message-Id: <20160711044031.5771-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711044031.5771-1-openbmc-patches@stwcx.xyz>
References: <20160711044031.5771-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:40:42 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Add a target pulled in by multi-user to which Phosphor applications
can be added.  This is an organizational change only.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-core/systemd/systemd/obmc-standby.target          | 2 ++
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend         | 5 +++++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/obmc-standby.target

diff --git a/meta-phosphor/common/recipes-core/systemd/systemd/obmc-standby.target b/meta-phosphor/common/recipes-core/systemd/systemd/obmc-standby.target
new file mode 100644
index 0000000..d8cd72f
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/systemd/systemd/obmc-standby.target
@@ -0,0 +1,2 @@
+[Unit]
+Description=OpenBMC System
diff --git a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
index 9ad6a40..e2995dc 100644
--- a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
@@ -2,11 +2,16 @@ PACKAGECONFIG_append = " networkd"
 PACKAGECONFIG_remove = "machined hibernate ldconfig binfmt backlight quotacheck localed kdbus ima smack polkit"
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
 SRC_URI += "file://default.network"
+SRC_URI += "file://obmc-standby.target"
 
 FILES_${PN} += "${libdir}/systemd/network/default.network"
+FILES_${PN} += "${systemd_system_unitdir}/obmc-standby.target"
 
 do_install_append() {
         install -m 644 ${WORKDIR}/default.network ${D}${libdir}/systemd/network/
+        install -m 644 ${WORKDIR}/obmc-standby.target ${D}${systemd_system_unitdir}
+        ln -sf ../obmc-standby.target \
+                ${D}${systemd_system_unitdir}/multi-user.target.wants/obmc-standby.target
 
         #TODO Remove after this issue is resolved
         #https://github.com/openbmc/openbmc/issues/152
-- 
2.9.0
