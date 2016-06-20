Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYCSb13R1zDq80
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:10:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466431846639760.0556837251845;
 Mon, 20 Jun 2016 07:10:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openbmc] Package whitelist.conf in obmc-phosphor-image
Date: Mon, 20 Jun 2016 09:10:42 -0500
Message-Id: <20160620141042.22721-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160620141042.22721-1-openbmc-patches@stwcx.xyz>
References: <20160620141042.22721-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 14:10:56 -0000

From: tomjose <tomjoseph@in.ibm.com>

IPMI whitelisted commands are added in whitelist.conf
which would be consumed by ipmid daemon. Only whitelisted
IPMI commands are executed in restricted mode.
---
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  5 ++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/host-ipmid/files/whitelist.conf     | 26 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/whitelist.conf

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 23728cb..b3dba1a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -17,7 +17,8 @@ TARGET_CFLAGS   += "-fpic"
 RDEPENDS_${PN} += "clear-once"
 RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
-SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
+SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid \
+            file://whitelist.conf"
 
 SRCREV = "092360e55605c205aedd2ab40044c42e64b7d38c"
 
@@ -26,8 +27,10 @@ INSTALL_NAME = "ipmid"
 
 do_install() {
         install -m 0755 -d ${D}${libdir}/host-ipmid
+        install -m 0755 -d ${D}${datadir}/host-ipmid
         install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
 
         install -m 0755 -d ${D}${includedir}/host-ipmid
         install -m 0644 ${S}/ipmid-api.h ${D}${includedir}/host-ipmid/
+        install -m 0644 ${WORKDIR}/whitelist.conf ${D}${datadir}/host-ipmid
 }
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
new file mode 100644
index 0000000..b2051b6
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/files:"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/whitelist.conf
new file mode 100644
index 0000000..20dd429
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/whitelist.conf
@@ -0,0 +1,26 @@
+<NetFn><Command>
+0x00:0x02
+0x00:0x08
+0x00:0x09
+0x04:0x2D
+0x04:0x2F
+0x04:0x30
+0x06:0x01
+0x06:0x08
+0x06:0x22
+0x06:0x24
+0x06:0x2E
+0x06:0x31
+0x06:0x35
+0x06:0x36
+0x06:0x42
+0x0A:0x12
+0x0A:0x40
+0x0A:0x42
+0x0A:0x44
+0x0A:0x48
+0x0A:0x49
+0x0C:0x02
+0x2C:0x00
+0x2C:0x03
+0x32:0xF0
-- 
2.8.4
