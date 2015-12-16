Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CBD491A106E
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:00:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450306837083925.7975051344215;
 Wed, 16 Dec 2015 15:00:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Add schema endpoint
Date: Wed, 16 Dec 2015 17:00:35 -0600
Message-Id: <1450306835-18436-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450306835-18436-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450306835-18436-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Dec 2015 23:00:43 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Navigate to /<obj>/schema to get a dbus introspection dump
of <obj>.
---
 obmc-rest | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/obmc-rest b/obmc-rest
index c5ba8dc..7c8e21a 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -306,6 +306,36 @@ class PropertyHandler(RouteHandler):
 				continue
 			return prop, i
 
+class SchemaHandler(RouteHandler):
+	verbs = ['GET']
+	rules = '<path:path>/schema'
+
+	def __init__(self, app, bus):
+		super(SchemaHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
+
+	def find(self, path):
+		return self.try_mapper_call(
+			self.mapper.get_object,
+			path = path)
+
+	def setup(self, path):
+		request.route_data['map'] = self.find(path)
+
+	def do_get(self, path):
+		schema = {}
+		for x in request.route_data['map'].iterkeys():
+			obj = self.bus.get_object(
+					x, path, introspect = False)
+			iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+			data = iface.Introspect()
+			parser = IntrospectionNodeParser(
+					ElementTree.fromstring(data))
+			for x,y in parser.get_interfaces().iteritems():
+				schema[x] = y
+
+		return schema
+
 class InstanceHandler(RouteHandler):
 	verbs = ['GET', 'PUT', 'DELETE']
 	rules = '<path:path>'
@@ -544,6 +574,7 @@ class RestApp(Bottle):
 		self.list_handler = ListHandler(self, self.bus)
 		self.method_handler = MethodHandler(self, self.bus)
 		self.property_handler = PropertyHandler(self, self.bus)
+		self.schema_handler = SchemaHandler(self, self.bus)
 		self.instance_handler = InstanceHandler(self, self.bus)
 
 	def install_handlers(self):
@@ -552,6 +583,7 @@ class RestApp(Bottle):
 		self.list_handler.install()
 		self.method_handler.install()
 		self.property_handler.install()
+		self.schema_handler.install()
 		# this has to come last, since it matches everything
 		self.instance_handler.install()
 
-- 
2.6.3
