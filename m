Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 23B081A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:47:13 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655161432951.1351245531869;
 Wed, 4 Nov 2015 08:39:21 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 3/5] React to mapper API changes.
Date: Wed,  4 Nov 2015 10:39:00 -0600
Message-Id: <1446655142-5884-4-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:47:14 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The DBUS API of the mapper had some minor changes.  React to those.
Also pick up the new mapper binding.
---
 phosphor-rest | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/phosphor-rest b/phosphor-rest
index 798cd4a..08065ed 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -20,7 +20,7 @@ import BaseHTTPServer
 import SocketServer
 import json
 import dbus
-from OpenBMCMapper import Path
+from OpenBMCMapper import Path, Mapper
 import OpenBMCMapper
 
 class RestException(Exception):
@@ -101,8 +101,8 @@ class MethodHandler(RequestHandler):
 		return m
 
 	def find_method(self):
-		busses = self.mapper.GetTree(
-				self.path, 0, 'exact')[self.path]
+		busses = self.mapper.get_object(
+				self.path)
 		for items in busses.iteritems():
 			m = self.find_method_on_bus(*items)
 			if not m:
@@ -209,7 +209,7 @@ class AttrHandler(RequestHandler):
 		super(AttrHandler, self).__init__(req, path, data)
 		try:
 			self.inst = InstanceHandler(req, path, data,
-					self.mapper.GetTree(path, 0, 'exact')[path])
+					self.mapper.get_object(path))
 		except KeyError:
 			raise RestException("Not Found", 404)
 		self.attr = Path(self.req.path).rel(first = -1)
@@ -229,7 +229,7 @@ class TypesHandler(RequestHandler):
 		super(TypesHandler, self).__init__(req, path, data)
 
 	def do_GET(self):
-		types = self.mapper.GetTreePaths(self.path, 1, 'exact')
+		types = self.mapper.get_subtree_paths(self.path, 1)
 		if not types:
 			raise RestException("Not Found", 404)
 
@@ -240,9 +240,7 @@ class ListHandler(RequestHandler):
 		super(ListHandler, self).__init__(req, path, data)
 
 	def do_GET(self):
-		objs = self.mapper.GetTree(self.path, -1, 'fuzzy')
-		if self.path in objs:
-			del objs[self.path]
+		objs = self.mapper.get_subtree(self.path)
 		if not objs:
 			raise RestException("Not Found", 404)
 
@@ -254,9 +252,7 @@ class EnumerateHandler(RequestHandler):
 
 	def do_GET(self):
 		objs = {}
-		mapper_data = self.mapper.GetTree(self.path, -1, 'fuzzy')
-		if self.path in mapper_data:
-			del mapper_data[self.path]
+		mapper_data = self.mapper.get_subtree(self.path)
 
 		for x,y in mapper_data.iteritems():
 			objs[x] = InstanceHandler(self.req, x, self.data, y).do_GET()
@@ -286,11 +282,10 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 			return MethodHandler(self, path.fq(last = -2), data)
 
 		# have to do an objectmapper query at this point
-		mapper_entry = self.server.mapper.GetTree(
-				path.fq(), 0, 'exact')
+		mapper_entry = self.server.mapper.get_object(path.fq())
 		if mapper_entry:
 			return InstanceHandler(self, path.fq(), data,
-					mapper_entry[path.fq()])
+					mapper_entry)
 
 		raise RestException("Not Found", 404)
 
@@ -331,10 +326,7 @@ class HTTPServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
 	def __init__(self, bind, handler, bus):
 		BaseHTTPServer.HTTPServer.__init__(self, bind, handler)
 		self.bus = bus
-		mapper = self.bus.get_object(OpenBMCMapper.MAPPER_NAME,
-				OpenBMCMapper.MAPPER_PATH)
-		self.mapper = dbus.Interface(mapper,
-				dbus_interface = OpenBMCMapper.MAPPER_IFACE)
+		self.mapper = Mapper(self.bus)
 
 if __name__ == '__main__':
 	bus = dbus.SystemBus()
-- 
2.6.0
