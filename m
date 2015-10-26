Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4E01A0900
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2015 12:40:03 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445823598771859.5766714441444;
 Sun, 25 Oct 2015 18:39:58 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Adding real event log manager removed the eventd
 program from the skeleton includes
Date: Sun, 25 Oct 2015 20:39:54 -0500
Message-Id: <1445823594-7365-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445823594-7365-1-git-send-email-patches@stwcx.xyz>
References: <1445823594-7365-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 26 Oct 2015 01:40:03 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../conf/machine/include/openpower.inc             |  3 ++-
 .../files/obmc-phosphor-event.service              |  8 ++++++
 .../files/obmc-phosphor-eventd.py                  | 29 ----------------------
 .../files/obmc-phosphor-eventd.service             |  8 ------
 .../obmc-phosphor-event/obmc-phosphor-event.bb     | 25 +++++++++++++++++++
 .../obmc-phosphor-event/obmc-phosphor-eventd.bb    |  9 -------
 .../common/recipes-phosphor/skeleton/skeleton.bb   |  1 -
 7 files changed, 35 insertions(+), 48 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 474dde8..5b5d824 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -3,6 +3,7 @@ OBMC_MACHINE_FEATURES += "\
         obmc-phosphor-chassis-mgmt \
         obmc-phosphor-sensor-mgmt \
         obmc-phosphor-flash-mgmt \
+        obmc-phosphor-event-mgmt \
         "
 
 VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
@@ -20,7 +21,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
 
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "skeleton"
-PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-event"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "skeleton"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
new file mode 100644
index 0000000..8e0266b
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC event management daemon
+
+[Service]
+ExecStart=/usr/sbin/obmc-phosphor-eventd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py
deleted file mode 100644
index ed45068..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.py
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/usr/bin/env python
-
-# Contributors Listed Below - COPYRIGHT 2015
-# [+] International Business Machines Corp.
-#
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#     http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
-# implied. See the License for the specific language governing
-# permissions and limitations under the License.
-
-import time
-import sys
-import dbus
-import dbus.service
-import dbus.mainloop.glib
-
-if __name__ == '__main__':
-	print "obmc-phosphor-eventd starting..."
-
-	while 1:
-		time.sleep(5)
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service
deleted file mode 100644
index 8e0266b..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-eventd.service
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=Phosphor OpenBMC event management daemon
-
-[Service]
-ExecStart=/usr/sbin/obmc-phosphor-eventd
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
new file mode 100644
index 0000000..3f65a96
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Phosphor OpenBMC Event Management"
+DESCRIPTION = "Phosphor OpenBMC event management reference implementation."
+HOMEPAGE = "https://github.com/causten/openbmc-eventd"
+PR = "r1"
+
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-event-mgmt
+inherit obmc-phosphor-sdbus-service
+inherit obmc-phosphor-c-daemon
+
+SRC_URI += "git://github.com/causten/openbmc-eventd"
+
+SRCREV = "417f69b7839034543405f1bb70a73cc701a1b3a5"
+
+RDEPENDS_${PN} += "libsystemd"
+
+
+S = "${WORKDIR}/git"
+INSTALL_NAME = "event_messaged"
+
+do_install() {
+        install -m 0755 -d ${D}${sbindir}
+        install -m 0755 ${S}/${INSTALL_NAME} ${D}/${sbindir}/obmc-phosphor-eventd
+}
\ No newline at end of file
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb
deleted file mode 100644
index b5a54da..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Phosphor OpenBMC Event Management"
-DESCRIPTION = "Phosphor OpenBMC event management reference implementation."
-PR = "r1"
-
-inherit obmc-phosphor-event-mgmt
-inherit obmc-phosphor-pydbus-service
-
-S = "${WORKDIR}"
-SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index d0cf359..ea227ba 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -6,7 +6,6 @@ PR = "r1"
 inherit obmc-phosphor-license
 inherit obmc-phosphor-systemd
 inherit obmc-phosphor-chassis-mgmt
-inherit obmc-phosphor-event-mgmt
 inherit obmc-phosphor-fan-mgmt
 inherit obmc-phosphor-flash-mgmt
 inherit obmc-phosphor-policy-mgmt
-- 
2.6.0
