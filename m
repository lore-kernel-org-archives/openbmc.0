Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D29761A0D56
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:22:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729716451857.2770340336526;
 Thu, 5 Nov 2015 05:21:56 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 02/10] Add PathTree to mapper library
Date: Thu,  5 Nov 2015 07:21:42 -0600
Message-Id: <1446729710-27220-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
References: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:22:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

PathTree is a somewhat generic structure for associating
data with a path, internally managed as a tree.  It emulates
built in python containers and supports iteration.
---
 OpenBMCMapper.py | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 165 insertions(+), 3 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index cefed52..3b6fe00 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -169,7 +169,169 @@ class IntrospectionParser:
 				continue
 			items.update(callback(path + k, parser))
 
-		if path == '/':
-			print items
-
 		return items
+
+class PathTreeItemIterator(object):
+	def __init__(self, path_tree, subtree, depth):
+		self.path_tree = path_tree
+		self.path = []
+		self.itlist = []
+		self.subtree = ['/'] + filter(bool, subtree.split('/'))
+		self.depth = depth
+		d = path_tree.root
+		for k in self.subtree:
+			try:
+				d = d[k]['children']
+			except KeyError:
+				raise KeyError(subtree)
+		self.it = d.iteritems()
+
+	def __iter__(self):
+		return self
+
+	def __next__(self):
+		return super(PathTreeItemIterator, self).next()
+
+	def next(self):
+		key, value = self._next()
+		path = self.subtree[0] + '/'.join(self.subtree[1:] + self.path)
+		return path, value.get('data')
+
+	def _next(self):
+		try:
+			while True:
+				x = self.it.next()
+				depth_exceeded = len(self.path) +1 > self.depth
+				if self.depth and depth_exceeded:
+					continue
+				self.itlist.append(self.it)
+				self.path.append(x[0])
+				self.it = x[1]['children'].iteritems()
+				break;
+
+		except StopIteration:
+			if not self.itlist:
+				raise StopIteration
+
+			self.it = self.itlist.pop()
+			self.path.pop()
+			x = self._next()
+		
+		return x
+
+class PathTreeKeyIterator(PathTreeItemIterator):
+	def __init__(self, path_tree, subtree, depth):
+		super(PathTreeKeyIterator, self).__init__(path_tree, subtree, depth)
+
+	def next(self):
+		return super(PathTreeKeyIterator, self).next()[0]
+
+class PathTree:
+	def __init__(self):
+		self.root = {}
+
+	def _try_delete_parent(self, elements):
+		if len(elements) == 1:
+			return False
+
+		kids = 'children'
+		elements.pop()
+		d = self.root
+		for k in elements[:-1]:
+			d = d[k][kids]
+
+		if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
+			del d[elements[-1]]
+			self._try_delete_parent(elements)
+
+	def _get_node(self, key):
+		kids = 'children'
+		elements = ['/'] + filter(bool, key.split('/'))
+		d = self.root
+		for k in elements[:-1]:
+			try:
+				d = d[k][kids]
+			except KeyError:
+				raise KeyError(key)
+		
+		return d[elements[-1]]
+
+	def __iter__(self):
+		return self
+
+	def __missing__(self, key):
+		for x in self.iterkeys():
+			if key == x:
+				return False
+		return True
+
+	def __delitem__(self, key):
+		kids = 'children'
+		elements = ['/'] + filter(bool, key.split('/'))
+		d = self.root
+		for k in elements[:-1]:
+			try:
+				d = d[k][kids]
+			except KeyError:
+				raise KeyError(key)
+
+		del d[elements[-1]]
+		self._try_delete_parent(elements)
+
+	def __setitem__(self, key, value):
+		kids = 'children'
+		elements = ['/'] + filter(bool, key.split('/'))
+		d = self.root
+		for k in elements[:-1]:
+			d = d.setdefault(k, {kids: {}})[kids]
+
+		children = d.setdefault(elements[-1], {kids: {}})[kids]
+		d[elements[-1]].update({kids: children, 'data': value})
+
+	def __getitem__(self, key):
+		return self._get_node(key).get('data')
+
+	def setdefault(self, key, default):
+		if not self.get(key):
+			self.__setitem__(key, default)
+
+		return self.__getitem__(key)
+
+	def get(self, key, default = None):
+		try:
+			x = self.__getitem__(key)
+		except KeyError:
+			x = default
+
+		return x
+
+	def get_children(self, key):
+		return [ x for x in self._get_node(key)['children'].iterkeys() ]
+
+	def demote(self, key):
+		n = self._get_node(key)
+		if 'data' in n:
+			del n['data']
+
+	def keys(self, subtree = '/', depth = None):
+		return [ x for x in self.iterkeys(subtree, depth) ]
+
+	def values(self, subtree = '/', depth = None):
+		return [ x[1] for x in self.iteritems(subtree, depth) ]
+
+	def items(self, subtree = '/', depth = None):
+		return [ x for x in self.iteritems(subtree, depth) ]
+
+	def dataitems(self, subtree = '/', depth = None):
+		return [ x for x in self.iteritems(subtree, depth) \
+				if x[1] is not None ]
+
+	def iterkeys(self, subtree = '/', depth = None):
+		if not self.root:
+			return {}.iterkeys()
+		return PathTreeKeyIterator(self, subtree, depth)
+
+	def iteritems(self, subtree = '/', depth = None):
+		if not self.root:
+			return {}.iteritems()
+		return PathTreeItemIterator(self, subtree, depth)
-- 
2.6.0
