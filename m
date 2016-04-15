Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmcpp4zQ7zDqCp
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 22:50:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460724652926131.69208577027973;
 Fri, 15 Apr 2016 05:50:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH pyphosphor 3/4] Added python to dts encoder
Date: Fri, 15 Apr 2016 07:50:46 -0500
Message-Id: <1460724647-4184-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 12:50:59 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This is a rudimentary python to device tree encoder.

It supports nested nodes and, cell, cell array,
string, string array, and mixed array properties.
At the moment there is no support for binary properties.
---
 obmc/utils/dtree.py | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 obmc/utils/dtree.py

diff --git a/obmc/utils/dtree.py b/obmc/utils/dtree.py
new file mode 100644
index 0000000..ce349ee
--- /dev/null
+++ b/obmc/utils/dtree.py
@@ -0,0 +1,63 @@
+# Contributors Listed Below - COPYRIGHT 2016
+# [+] International Business Machines Corp.
+#
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# implied. See the License for the specific language governing
+# permissions and limitations under the License.
+
+
+def dts_encode(obj, fd, **kw):
+    ''' A rudimentary python to dts encoder.
+    '''
+    indent = kw.get('indent', 0)
+    depth = kw.setdefault('depth', 0)
+    tab = indent * depth * ' '
+    kw['depth'] += 1
+    newline = '\n' if indent else ' '
+    context = kw.get('context')
+
+    if(isinstance(obj, dict)):
+        nodes = []
+        for k, v in obj.iteritems():
+            if(isinstance(v, dict)):
+                nodes.append((k, v))
+                continue
+            fd.write('%s%s = ' % (tab, k))
+            dts_encode(v, fd, **kw)
+            fd.write(";%s" % newline)
+
+        for k, v in nodes:
+            fd.write('%s%s {%s' % (tab, k, newline))
+            dts_encode(v, fd, **kw)
+            fd.write('%s};%s' % (tab, newline))
+
+    if(isinstance(obj, int)):
+        if context == 'int_list':
+            fd.write("%d" % obj)
+        else:
+            fd.write("<%d>" % obj)
+
+    if(isinstance(obj, basestring)):
+        fd.write("\"%s\"" % obj)
+
+    if(isinstance(obj, list)):
+        ctx = 'int_list' if all((type(x) is int) for x in iter(obj)) else ''
+        delim = ' ' if ctx is 'int_list' else ','
+        closure = ('<', '>') if ctx is 'int_list' else ('', '')
+
+        fd.write(closure[0])
+        for v in obj[:-1]:
+            dts_encode(v, fd, context=ctx, **kw)
+            fd.write(delim)
+
+        dts_encode(obj[-1], fd, context=ctx)
+        fd.write(closure[1])
-- 
2.7.1
