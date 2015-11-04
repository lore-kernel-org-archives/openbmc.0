Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 271AF1A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:44:56 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655178656858.1893602422883;
 Wed, 4 Nov 2015 08:39:38 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 5/5] Make use of
 org.openbmc.Object.Enumerate
Date: Wed,  4 Nov 2015 10:39:02 -0600
Message-Id: <1446655142-5884-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:44:57 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This interface greatly speeds up the enumerate action by
cutting the number of dbus calls to fetch objects for a subtree
down to one.
---
 phosphor-rest | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/phosphor-rest b/phosphor-rest
index 4c13b08..026eb74 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -20,7 +20,7 @@ import BaseHTTPServer
 import SocketServer
 import json
 import dbus
-from OpenBMCMapper import Path, Mapper
+from OpenBMCMapper import Path, Mapper, PathTree
 import OpenBMCMapper
 
 class RestException(Exception):
@@ -250,11 +250,47 @@ class EnumerateHandler(RequestHandler):
 	def __init__(self, req, path, data):
 		super(EnumerateHandler, self).__init__(req, path, data)
 
+	def get_enumerate(self, path, data):
+		busses = []
+		for s, i in data.iteritems():
+			if OpenBMCMapper.ENUMERATE_IFACE in i:
+				busses.append(s)
+		return busses
+
+	def call_enumerate(self, path, busses):
+		objs = {}
+		for b in busses:
+			obj = self.bus.get_object(b, path)
+			iface = dbus.Interface(obj, OpenBMCMapper.ENUMERATE_IFACE)
+			objs.update(iface.enumerate())
+		return objs
+
 	def do_GET(self):
 		objs = {}
 		mapper_data = self.mapper.get_subtree(self.path)
-
+		tree = PathTree()
 		for x,y in mapper_data.iteritems():
+			tree[x] = y
+
+		try:
+			# Check to see if the root path implements
+			# enumerate in addition to any sub tree
+			# objects.
+			root = self.mapper.get_object(self.path)
+			mapper_data[self.path] = root
+		except:
+			pass
+
+		have_enumerate = [ (x[0], self.get_enumerate(*x)) for x in mapper_data.iteritems() \
+				if self.get_enumerate(*x) ]
+
+		for x,y in have_enumerate:
+			objs.update(self.call_enumerate(x, y))
+			tmp = tree[x]
+			del tree[x]
+			tree[x] = tmp
+
+		for x,y in tree.dataitems():
 			objs[x] = InstanceHandler(self.req, x, self.data, y).do_GET()
 
 		if not objs:
-- 
2.6.0
