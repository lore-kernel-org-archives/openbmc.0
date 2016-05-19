Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9hyY0g9hzDqCM
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 06:10:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463688637485549.4840412437793;
 Thu, 19 May 2016 13:10:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump version for console, object manager,
 and event logs
Date: Thu, 19 May 2016 15:10:34 -0500
Message-Id: <1463688634-15010-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463688634-15010-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463688634-15010-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 May 2016 20:10:45 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Updates for:
Console - Support for local tty mirroring
Object manager - BMC boot performance improvements
Event logs - Cap the number of event logs at 128
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb      | 2 +-
 .../obmc-phosphor-event/files/obmc-phosphor-event.service               | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 2472917..615207a 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "2abc4d068cec75aa3893af8197108d29ff6f1bb4"
+SRCREV = "f7aa902e465bfe1cf19b9079f1555633a88e7190"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
index e5553fe..ce030fa 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://${PN}.conf \
 	    file://obmc-console-ssh.socket \
 	    file://obmc-console-ssh@.service"
 
-SRCREV = "2eacda524e98c7964e542e01aabf82360cf60344"
+SRCREV = "bc1e893375e4887ef7676c5738779c4a2f5b1935"
 
 FILES_${PN} += "${systemd_unitdir}/system/obmc-console-ssh@.service \
 		${systemd_unitdir}/system/obmc-console-ssh.socket"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
index 828cb6a..2209629 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
@@ -2,7 +2,7 @@
 Description=Phosphor OpenBMC event management daemon
 
 [Service]
-ExecStart=/usr/sbin/obmc-phosphor-eventd -s 200000
+ExecStart=/usr/sbin/obmc-phosphor-eventd -s 200000 -t 128
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 4b9f60e..307fe90 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -13,7 +13,7 @@ TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "0396126c2d816529d57cee2b413727eb78f7cef3"
+SRCREV = "d8fbb0a07dc0c68b3f5d074bddca96eccaca14b4"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
-- 
2.8.2
