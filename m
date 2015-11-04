Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FCF1A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:46:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655157128131.7835993718004;
 Wed, 4 Nov 2015 08:39:17 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 2/5] Whitespace fixes
Date: Wed,  4 Nov 2015 10:38:59 -0600
Message-Id: <1446655142-5884-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:46:07 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 phosphor-rest | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/phosphor-rest b/phosphor-rest
index b0aee59..798cd4a 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -27,7 +27,7 @@ class RestException(Exception):
 	def __init__(self, msg, http_status=403):
 		self.status = http_status
 		super(RestException, self).__init__(msg)
-        
+
 class Response(object):
 	def render(self, handler):
 		raise NotImplemented()
@@ -55,7 +55,7 @@ class JSONResponse(Response):
 
 class RequestHandler(object):
 	def __init__(self, req, path, data):
-		self.req = req 
+		self.req = req
 		self.path = path
 		self.bus = req.server.bus
 		self.mapper = req.server.mapper
@@ -166,7 +166,7 @@ class InstanceHandler(RequestHandler):
 				obj, dbus_interface=dbus.PROPERTIES_IFACE)
 
 		for iface in interfaces:
-			if self.try_set_one_interface(prop, value, 
+			if self.try_set_one_interface(prop, value,
 					properties_iface, iface):
 				return True
 
@@ -246,7 +246,7 @@ class ListHandler(RequestHandler):
 		if not objs:
 			raise RestException("Not Found", 404)
 
-		return objs.keys() 
+		return objs.keys()
 
 class EnumerateHandler(RequestHandler):
 	def __init__(self, req, path, data):
@@ -289,7 +289,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 		mapper_entry = self.server.mapper.GetTree(
 				path.fq(), 0, 'exact')
 		if mapper_entry:
-			return InstanceHandler(self, path.fq(), data, 
+			return InstanceHandler(self, path.fq(), data,
 					mapper_entry[path.fq()])
 
 		raise RestException("Not Found", 404)
-- 
2.6.0
