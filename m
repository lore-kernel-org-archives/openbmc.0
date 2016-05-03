Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzMJv1NZDzDqBs
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 10:20:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462234839867583.444502643468;
 Mon, 2 May 2016 17:20:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] ipmid crashing with simplified
 VERSION_ID
Date: Mon,  2 May 2016 19:20:37 -0500
Message-Id: <1462234837-14607-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462234837-14607-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462234837-14607-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 00:20:47 -0000

From: Chris Austen <austenc@us.ibm.com>

if the VERSION_ID is v0.1 instead of v0.1-1 then the code will crash.  The fix is to always check
for a NULL token each time.

Change ipmitool output to reflect hex value

VERSION_ID is equal to v0.6-36-gece9f78-dirty
I was forcing the '36' to be shown as 36.  Turns out
that the ipmitool prepends the "Aux" section with a
'0x' indicating the value is in hex.  So Rather then
it show up as 0x36  I made it actually be 0x24.

root@barreleye:~# ./ipmitool -I dbus mc info
IPMI GROUP EXTENTIONS
IPMI GROUP EXTENTIONS
Device ID                 : 0
Device Revision           : 0
Firmware Revision         : 0.06
IPMI Version              : 2.0
Manufacturer ID           : 42817
Manufacturer Name         : Unknown (0xA741)
Product ID                : 16451 (0x4043)
Product Name              : Unknown (0x4043)
Device Available          : yes
Provides Device SDRs      : no
Additional Device Support :
    Sensor Device
    SEL Device
    FRU Inventory Device
Aux Firmware Rev Info     :
    0x00
    0x24   <---- is decimal 36
    0x01
    0x00
root@barreleye:~#
---
 apphandler.C | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 53a83d3..b0c08c6 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -100,7 +100,7 @@ typedef struct
 {
     char major;
     char minor;
-    uint8_t d[4];
+    uint16_t d[2];
 } rev_t;
 
 
@@ -119,6 +119,7 @@ int convert_version(const char *p, rev_t *rev)
     char *s, *token;
     char hexbyte[5];
     int l;
+    uint16_t commits;
 
     if (*p != 'v')
         return -1;
@@ -135,23 +136,24 @@ int convert_version(const char *p, rev_t *rev)
     // Capture the number of commits on top of the minor tag.
     // I'm using BE format like the ipmi spec asked for
     token = strtok(NULL,".-");
-    l = strlen(token);
-    if (l > 4)
-        l = 4;
 
-    memset(hexbyte,'0', 4);
-    memcpy(&hexbyte[4-l], token, l);
-    sscanf(&hexbyte[0], "%2hhX", &rev->d[0]);
-    sscanf(&hexbyte[2], "%2hhX", &rev->d[1]);
+    printf("%d: %s\n", __LINE__, token);
+    if (token) {
+        commits = (int16_t) atoi(token);
+        rev->d[0] = (commits>>8) | (commits<<8);
 
-    rev->d[2] = 0;
+        // commit number we skip
+        token = strtok(NULL,".-");
 
-    // commit number we skip
-    token = strtok(NULL,".-");
+    } else {
+        rev->d[0] = 0;
+    }
 
     // Any value of the optional parameter forces it to 1
-    token = strtok(NULL,".-");
-        rev->d[3] = (token != NULL) ? 1 : 0;
+    if (token)
+        token = strtok(NULL,".-");
+
+    rev->d[1] = (token != NULL) ? 1 : 0;
 
     free(s);
     return 0;
-- 
2.8.1
