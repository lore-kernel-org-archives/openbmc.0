Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qcFgx1MV6zDq6W
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 09:01:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459548057199319.1574960069504;
 Fri, 1 Apr 2016 15:00:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd 1/2] parser: pprint settings_file.py
Date: Fri,  1 Apr 2016 17:00:53 -0500
Message-Id: <1459548054-10473-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 01 Apr 2016 22:01:01 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Use pprint for settings map instead of just casting to string.  This
makes the output of the tool better for git-diff because it is sorted
and multiple lines.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 settings_parser.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/settings_parser.py b/settings_parser.py
index 46bb474..9e74f91 100755
--- a/settings_parser.py
+++ b/settings_parser.py
@@ -5,6 +5,7 @@
 # adding dependencies to additional modules like yaml
 
 import yaml
+import pprint
 
 SETTINGS_FILE = 'settings.yaml'
 OUTPUT_FILE = 'settings_file.py'
@@ -16,5 +17,5 @@ with open(SETTINGS_FILE) as s:
 with open(OUTPUT_FILE, 'w') as f:
     f.write(FILE_HEADER)
     f.write('\n')
-    f.write('SETTINGS=')
-    f.write(str(data))
+    f.write('SETTINGS=\\\n')
+    pprint.pprint(data, stream=f)
-- 
2.7.1
