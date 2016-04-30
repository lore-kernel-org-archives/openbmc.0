Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qy3s949d4zDqBS
 for <openbmc@lists.ozlabs.org>; Sun,  1 May 2016 07:40:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462052440512640.3366672360731;
 Sat, 30 Apr 2016 14:40:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] ipmid crashing with simplified VERSION_ID
Date: Sat, 30 Apr 2016 16:40:36 -0500
Message-Id: <1462052436-1235-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462052436-1235-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462052436-1235-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Apr 2016 21:40:46 -0000

From: Chris Austen <austenc@us.ibm.com>

if the VERSION_ID is v0.1 instead of v0.1-1 then the code will crash.  The fix is to always check
for a NULL token each time.
---
 apphandler.C | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 53a83d3..80f239c 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -135,9 +135,18 @@ int convert_version(const char *p, rev_t *rev)
     // Capture the number of commits on top of the minor tag.
     // I'm using BE format like the ipmi spec asked for
     token = strtok(NULL,".-");
-    l = strlen(token);
-    if (l > 4)
-        l = 4;
+
+    if (token) {
+        l = strlen(token);
+        if (l > 4)
+            l = 4;
+
+        // commit number we skip
+        token = strtok(NULL,".-");
+
+    } else {
+        l = 0;
+    }
 
     memset(hexbyte,'0', 4);
     memcpy(&hexbyte[4-l], token, l);
@@ -146,12 +155,11 @@ int convert_version(const char *p, rev_t *rev)
 
     rev->d[2] = 0;
 
-    // commit number we skip
-    token = strtok(NULL,".-");
-
     // Any value of the optional parameter forces it to 1
-    token = strtok(NULL,".-");
-        rev->d[3] = (token != NULL) ? 1 : 0;
+    if (token)
+        token = strtok(NULL,".-");
+
+    rev->d[3] = (token != NULL) ? 1 : 0;
 
     free(s);
     return 0;
-- 
2.8.1
