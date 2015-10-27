Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F1221A0464
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:14:13 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144595164129047.846471670884625;
 Tue, 27 Oct 2015 06:14:01 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] bin/ipmi_debug: Use newer HostIpmi interface
Date: Tue, 27 Oct 2015 08:13:56 -0500
Message-Id: <1445951636-17767-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445951636-17767-1-git-send-email-patches@stwcx.xyz>
References: <1445951636-17767-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 13:14:14 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Netfn and LUN are now split, and cc is separated from data.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 bin/ipmi_debug.py | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/bin/ipmi_debug.py b/bin/ipmi_debug.py
index 300756c..0fc6a86 100755
--- a/bin/ipmi_debug.py
+++ b/bin/ipmi_debug.py
@@ -14,27 +14,43 @@ import dbus.mainloop.glib
 DBUS_NAME = 'org.openbmc.HostIpmi'
 OBJ_NAME = '/org/openbmc/HostIpmi/1'
 
-def print_packet(seq, netfn, cmd, data):
-    print 'seq:   0x%02x\nnetfn: 0x%02x\ncmd:   0x%02x\ndata:  [%s]' % (
-            seq, netfn, cmd,
-            ", ".join(['0x%02x' % x for x in data]))
+def header(seq, netfn, lun, cmd):
+    return (
+        'seq:   0x%02x\nnetfn: 0x%02x\n\nlun: 0x%02d\ncmd:   0x%02x\n') % (
+            seq, netfn, lun, cmd)
 
 
+def print_request(seq, netfn, lun, cmd, data):
+    str = header(seq, netfn, lun, cmd)
+    str += 'data:  [%s]' % ', '.join(['0x%02x' % x for x in data])
+    print str
+
+def print_response(seq, netfn, lun, cmd, cc, data):
+    str = header(seq, netfn, lun, cmd)
+    str += 'cc:    0x%02x\ndata:  [%s]' % (
+                cc, ', '.join(['0x%02x' % x for x in data])
+            )
+    print str
+
 class IpmiDebug(dbus.service.Object):
     def __init__(self,bus,name):
         dbus.service.Object.__init__(self,bus,name)
 
-    @dbus.service.signal(DBUS_NAME, "yyyay")
-    def ReceivedMessage(self, seq, netfn, cmd, data):
+    @dbus.service.signal(DBUS_NAME, "yyyyay")
+    def ReceivedMessage(self, seq, netfn, lun, cmd, data):
         print "IPMI packet from host:"
-        print_packet(seq, netfn, cmd, data)
+        print_request(seq, netfn, lun, cmd, data)
 
-    @dbus.service.method(DBUS_NAME, "yyyay", "x")
-    def sendMessage(self, seq, netfn, cmd, data):
+    @dbus.service.method(DBUS_NAME, "yyyyyay", "x")
+    def sendMessage(self, seq, netfn, lun, cmd, ccode, data):
         print "IPMI packet sent to host:"
-        print_packet(seq, netfn, cmd, data)
+        print_response(seq, netfn, lun, cmd, ccode, data)
         return 0
 
+    @dbus.service.method(DBUS_NAME)
+    def setAttention(self):
+        print "IPMI SMS_ATN set"
+
 class ConsoleReader(object):
     def __init__(self, ipmi_obj):
         self.buffer = ''
@@ -65,7 +81,7 @@ class ConsoleReader(object):
         except ValueError:
             return
         self.seq += 1
-        self.ipmi_obj.ReceivedMessage(self.seq, data[0], data[1], data[2:])
+        self.ipmi_obj.ReceivedMessage(self.seq, data[0], 0, data[1], data[2:])
 
 def main():
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
@@ -75,8 +91,8 @@ def main():
     mainloop = gobject.MainLoop()
     r = ConsoleReader(obj)
 
-    print ("Enter IPMI packet as hex values. First two bytes will be used"
-            "as netfn and cmd")
+    print ("Enter IPMI packet as hex values. First three bytes will be used"
+            "as netfn and cmd.\nlun will be zero.")
     mainloop.run()
 
 if __name__ == '__main__':
-- 
2.6.0
