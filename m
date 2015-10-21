Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CA6C61A03E6
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 03:22:14 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445444530707719.1243788847323;
 Wed, 21 Oct 2015 09:22:10 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] remove systembus.patch
Date: Wed, 21 Oct 2015 11:22:07 -0500
Message-Id: <1445444527-27634-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445444527-27634-1-git-send-email-patches@stwcx.xyz>
References: <1445444527-27634-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 16:22:15 -0000

From: "Edward A. James" <eajames@us.ibm.com>

---
 .../recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb       |  1 -
 .../host-ipmid/host-ipmi-hw-example/systembus.patch           | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
index c979110..ac901d3 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
@@ -11,7 +11,6 @@ inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
 SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
-SRC_URI += "file://systembus.patch"
 SRCREV="${AUTOREV}"
 
 SCRIPT_NAME = "ipmi_debug.py"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch
deleted file mode 100644
index 402816a..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/ipmi_debug.py
-+++ b/ipmi_debug.py
-@@ -69,7 +69,7 @@ class ConsoleReader(object):
- 
- def main():
-     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
--    bus = dbus.SessionBus()
-+    bus = dbus.SystemBus()
-     name = dbus.service.BusName(DBUS_NAME, bus)
-     obj = IpmiDebug(bus, OBJ_NAME)
-     mainloop = gobject.MainLoop()
-- 
2.6.0
