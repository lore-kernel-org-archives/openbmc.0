Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxKwH2RfMzDqBC
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:10:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14619498516393.6558901718268544;
 Fri, 29 Apr 2016 10:10:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH pyphosphor v2 2/4] Add dictionary export to PathTree
Date: Fri, 29 Apr 2016 12:10:45 -0500
Message-Id: <1461949847-22156-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 17:10:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

PathTree is a dictionary extension with paths as keys and lets
you do things like iterate on subpaths, etc.  Internally it is
implemented as a nested dictionary but on the outside it acts
like a normal dictionary.

This change enables exporting a PathTree structure as a nested
dictionary, which is useful for python_2_xyz encoders that understand
nested data structures.
---
 obmc/utils/pathtree.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/obmc/utils/pathtree.py b/obmc/utils/pathtree.py
index 221495e..a13c6cb 100644
--- a/obmc/utils/pathtree.py
+++ b/obmc/utils/pathtree.py
@@ -181,3 +181,17 @@ class PathTree:
         if not self.root:
             return {}.iteritems()
         return PathTreeItemIterator(self, subtree, depth)
+
+    def dumpd(self, subtree='/'):
+        result = {}
+        d = result
+
+        for k, v in self.iteritems(subtree):
+            elements = ['/'] + filter(bool, k.split('/'))
+            d = result
+            for k in elements:
+                d = d.setdefault(k, {})
+            if v is not None:
+                d.update(v)
+
+        return result
-- 
2.8.1
