Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BE1A61A0286
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 08:09:20 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446152956852123.49403627358356;
 Thu, 29 Oct 2015 14:09:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs 2/2] Add REST API examples
Date: Thu, 29 Oct 2015 16:09:09 -0500
Message-Id: <1446152949-8085-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446152949-8085-1-git-send-email-patches@stwcx.xyz>
References: <1446152949-8085-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 21:09:21 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 rest-api.md | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 rest-api.md

diff --git a/rest-api.md b/rest-api.md
new file mode 100644
index 0000000..7167e71
--- /dev/null
+++ b/rest-api.md
@@ -0,0 +1,81 @@
+# OpenBMC REST API
+## HTTP GET operations
+List directory:
+```
+curl http://bmc/<path>/
+```
+Examples:
+```
+curl http://bmc/
+curl http://bmc/org/
+curl http://bmc/org/openbmc/
+curl http://bmc/org/openbmc/inventory/
+curl http://bmc/org/openbmc/inventory/system/chassis/
+```
+
+List objects recursively:
+```
+curl http://bmc/<path>/list
+```
+Examples:
+```
+curl http://bmc/list
+curl http://bmc/org/openbmc/inventory/list
+```
+
+Enumerate objects recursively:
+```
+curl http://bmc/<path>/enumerate
+```
+Examples:
+```
+curl http://bmc/enumerate
+curl http://bmc/org/openbmc/inventory/enumerate
+
+```
+
+Get object:
+```
+curl http://bmc/<path>
+```
+Examples:
+```
+curl http://bmc/org/openbmc/inventory/system/chassis/fan2
+```
+
+Get property:
+```
+curl http://bmc/<path>/attr/<attr>
+curl http://bmc/org/openbmc/inventory/system/chassis/fan2/attr/is_fru
+```
+
+## HTTP PUT operations
+These require a json formatted payload.  To get an example of what that looks like:
+```
+curl http://bmc/org/openbmc/flash/Bios_0 > bios.json # - or -
+curl http://bmc/org/openbmc/flash/Bios_0/attr/flasher_path > flasher_path.json
+```
+
+A put operation on an object requires a complete object.  For partial updates see POST.
+
+Make changes to the file and do a put (upload):
+
+```
+curl -T bios.json http://bmc/org/openbmc/flash/Bios_0
+curl -T flasher_path.json http://bmc/org/openbmc/flash/Bios_0/attr/flasher_path
+```
+
+## HTTP POST operations
+These also require a json formatted payload.
+
+To make a partial change to an object, try removing some properties from the bios.json example above.  Then do:
+
+```
+curl -d "`cat bios.partial.json`" http://bmc/org/openbmc/flash/Bios_0
+```
+
+To invoke a method:
+```
+curl -d "[ \"foo\", \"bar\" ]" http://bmc/org/openbmc/managers/System/action/getObjectFromId
+```
+
-- 
2.6.0
