Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7F7E01A0D2B
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:23:01 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729724707319.53841430543207;
 Thu, 5 Nov 2015 05:22:04 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 07/10] Add ObjectMapper binding
Date: Thu,  5 Nov 2015 07:21:47 -0600
Message-Id: <1446729710-27220-8-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:23:02 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Wrapper that allows default parameters to be used with the Mapper
DBUS interface.
---
 OpenBMCMapper.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index fde385e..3e7a745 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -336,3 +336,19 @@ class PathTree:
 		if not self.root:
 			return {}.iteritems()
 		return PathTreeItemIterator(self, subtree, depth)
+
+class Mapper:
+	def __init__(self, bus):
+		self.bus = bus
+		obj = bus.get_object(MAPPER_NAME, MAPPER_PATH)
+		self.iface = dbus.Interface(
+				obj, dbus_interface = MAPPER_IFACE)
+
+	def get_object(self, path):
+		return self.iface.GetObject(path)
+
+	def get_subtree_paths(self, path = '/', depth = 0):
+		return self.iface.GetSubTreePaths(path, depth)
+
+	def get_subtree(self, path = '/', depth = 0):
+		return self.iface.GetSubTree(path, depth)
-- 
2.6.0
