Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLq027V5zDqHd
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:11:08 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186262531468.1009158594404;
 Sun, 5 Jun 2016 21:11:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 2/3] Add goto system state wrapper script
Date: Sun,  5 Jun 2016 23:10:58 -0500
Message-Id: <20160606041059.18824-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
References: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:11:08 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A wrapper script for use with the skeleton state management
infrastructure that runs an application and then emits a
goto system state signal.  This removes the need for applications
to embed state transition logic.

This is a hack to enable inventory upload until a more complete
skeleton/systemd state management infrastructure is created.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 bin/goto_system_state.py | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 bin/goto_system_state.py

diff --git a/bin/goto_system_state.py b/bin/goto_system_state.py
new file mode 100644
index 0000000..4efa1c6
--- /dev/null
+++ b/bin/goto_system_state.py
@@ -0,0 +1,61 @@
+#!/usr/bin/env python
+
+# Contributors Listed Below - COPYRIGHT 2016
+# [+] International Business Machines Corp.
+#
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# implied. See the License for the specific language governing
+# permissions and limitations under the License.
+
+import sys
+import subprocess
+import dbus
+import dbus.service
+import dbus.mainloop.glib
+import gobject
+
+
+class Goto(dbus.service.Object):
+    def __init__(self, connection, path, loop, state, cmdline):
+        super(Goto, self).__init__(connection, path)
+        self.loop = loop
+        self.state = state
+        self.cmdline = cmdline
+        gobject.idle_add(self.go)
+
+    def go(self):
+        if self.cmdline:
+            subprocess.call(self.cmdline)
+
+        if self.state:
+            self.GotoSystemState(self.state)
+
+        self.loop.quit()
+
+    @dbus.service.signal('org.openbmc.Control', signature='s')
+    def GotoSystemState(self, state):
+        pass
+
+if __name__ == '__main__':
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    bus = dbus.SystemBus()
+    cmdline = None
+    state = None
+
+    if len(sys.argv) > 1:
+        state = sys.argv[1]
+    if len(sys.argv) > 2:
+        cmdline = sys.argv[2:]
+
+    loop = gobject.MainLoop()
+    o = Goto(bus, '/org/openbmc/goto', loop, state, cmdline)
+    loop.run()
-- 
2.8.3
