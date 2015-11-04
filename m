Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E69B01A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:47:45 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144665515300829.52553185278373;
 Wed, 4 Nov 2015 08:39:13 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 1/5] Remove unused system bus connection
Date: Wed,  4 Nov 2015 10:38:58 -0600
Message-Id: <1446655142-5884-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446655142-5884-1-git-send-email-patches@stwcx.xyz>
References: <1446655142-5884-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:47:48 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 phosphor-rest | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/phosphor-rest b/phosphor-rest
index 600b3d5..b0aee59 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -328,9 +328,9 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 		return self.do_command()
 
 class HTTPServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
-	def __init__(self, bind, handler):
+	def __init__(self, bind, handler, bus):
 		BaseHTTPServer.HTTPServer.__init__(self, bind, handler)
-		self.bus = dbus.SystemBus()
+		self.bus = bus
 		mapper = self.bus.get_object(OpenBMCMapper.MAPPER_NAME,
 				OpenBMCMapper.MAPPER_PATH)
 		self.mapper = dbus.Interface(mapper,
@@ -338,5 +338,5 @@ class HTTPServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
 
 if __name__ == '__main__':
 	bus = dbus.SystemBus()
-	server = HTTPServer(('', 80), DBusRestHandler)
+	server = HTTPServer(('', 80), DBusRestHandler, bus)
 	server.serve_forever()
-- 
2.6.0
