Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DE8931A0A7C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:21 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368817501891.2230659094726;
 Tue, 20 Oct 2015 12:20:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 08/20] Add recipe for host IPMI DBUS to hw example
Date: Tue, 20 Oct 2015 14:19:46 -0500
Message-Id: <1445368798-31274-9-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:22 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../host-ipmid/host-ipmi-hw-example.bb                 | 18 ++++++++++++++++++
 .../host-ipmi-hw-example/host-ipmi-hw-example.service  |  8 ++++++++
 .../host-ipmid/host-ipmi-hw-example/systembus.patch    | 11 +++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
new file mode 100644
index 0000000..c979110
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Phosphor OpenBMC host IPMI to DBUS Example"
+DESCRIPTION = "Phosphor OpenBMC host IPMI to DBUS example implementation."
+PR = "r1"
+
+RDEPENDS_${PN} += "python-subprocess"
+
+SYSTEMD_SERVICE_${PN} = "host-ipmi-hw.service"
+
+inherit obmc-phosphor-pydbus-service
+inherit obmc-phosphor-host-ipmi-hw
+
+S = "${WORKDIR}/git"
+SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
+SRC_URI += "file://systembus.patch"
+SRCREV="${AUTOREV}"
+
+SCRIPT_NAME = "ipmi_debug.py"
+INSTALL_NAME = "host-ipmi-hw"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
new file mode 100644
index 0000000..b6baa6f
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC host IPMI to DBUS example implementation
+
+[Service]
+ExecStart=/usr/sbin/host-ipmi-hw
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch
new file mode 100644
index 0000000..402816a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch
@@ -0,0 +1,11 @@
+--- a/ipmi_debug.py
++++ b/ipmi_debug.py
+@@ -69,7 +69,7 @@ class ConsoleReader(object):
+ 
+ def main():
+     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+-    bus = dbus.SessionBus()
++    bus = dbus.SystemBus()
+     name = dbus.service.BusName(DBUS_NAME, bus)
+     obj = IpmiDebug(bus, OBJ_NAME)
+     mainloop = gobject.MainLoop()
-- 
2.6.0
