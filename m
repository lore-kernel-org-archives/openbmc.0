Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPL483SZPzDqyp
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:40:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458013233753381.04641809128964;
 Mon, 14 Mar 2016 20:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 3/3] Remove unused variable warnings
Date: Mon, 14 Mar 2016 22:40:30 -0500
Message-Id: <1458013230-17330-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458013230-17330-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458013230-17330-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 15 Mar 2016 03:40:41 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Output from GCC:
globalhandler.C: In function 'int dbus_warm_reset()':
globalhandler.C:84:11: warning: unused variable 'temp_buf' [-Wunused-variable]
     char* temp_buf = NULL;
           ^
globalhandler.C:85:14: warning: unused variable 'get_value' [-Wunused-variable]
     uint8_t* get_value = NULL;
              ^
globalhandler.C:87:12: warning: unused variable 'i' [-Wunused-variable]
     int r, i;
            ^

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 globalhandler.C | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/globalhandler.C b/globalhandler.C
index 0087455..7318969 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -80,10 +80,8 @@ int dbus_warm_reset()
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus *bus = NULL;
-    char* temp_buf = NULL;
-    uint8_t* get_value = NULL;
     char* connection = NULL;
-    int r, i;
+    int r;
 
     r = obj_mapper_get_connection(&connection, control_object_name);
     if (r < 0) {
-- 
2.7.1
