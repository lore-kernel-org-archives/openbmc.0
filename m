Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFZDC3GdQzDqR7
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 13:20:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464232853363707.9616261217346;
 Wed, 25 May 2016 20:20:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH rest-dbus] Enable systemd socket activation
Date: Wed, 25 May 2016 22:20:51 -0500
Message-Id: <20160526032051.3930-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160526032051.3930-1-openbmc-patches@stwcx.xyz>
References: <20160526032051.3930-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 03:21:00 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Optionally use sockets provided by systemd if present.  If not
start normally.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 rest-dbus | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/rest-dbus b/rest-dbus
index 2fc5316..a830dbf 100644
--- a/rest-dbus
+++ b/rest-dbus
@@ -4,6 +4,7 @@ import dbus
 import BaseHTTPServer
 import SocketServer
 import json
+import socket
 import os
 import sys
 from xml.etree import ElementTree
@@ -345,7 +346,6 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
             response = DBusRestErrorResonse(ex)
 
         response.render(self)
-        self.wfile.close()
 
     def do_POST(self):
         length = int(self.headers.getheader('content-length'))
@@ -356,11 +356,25 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
             response = DBusRestErrorResonse(ex)
 
         response.render(self)
-        self.wfile.close()
 
 
 class HTTPServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
-    pass
+    def __init__(self, address, handler):
+        bind = True
+        if os.environ.get('LISTEN_PID', None) == str(os.getpid()):
+            bind = False
+        BaseHTTPServer.HTTPServer.__init__(
+            self, address, handler, bind_and_activate=bind)
+        if bind is True:
+            self.server_bind()
+        else:
+            FIRST_SYSTEMD_SOCKET_FD = 3
+            self.socket = socket.fromfd(
+                FIRST_SYSTEMD_SOCKET_FD,
+                socket.AF_INET,
+                socket.SOCK_STREAM)
+
+        self.server_activate()
 
 if __name__ == '__main__':
     server = HTTPServer(('', 3000), DBusRestHandler)
-- 
2.8.3
