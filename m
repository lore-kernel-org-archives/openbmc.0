Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgH040LxDzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 21:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467285040605961.4872376734693;
 Thu, 30 Jun 2016 04:10:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2] Fix two issues in Issue #80
Date: Thu, 30 Jun 2016 06:10:38 -0500
Message-Id: <20160630111038.23651-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630111038.23651-1-openbmc-patches@stwcx.xyz>
References: <20160630111038.23651-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 11:10:44 -0000

From: tomjose <tomjoseph@in.ibm.com>

Corrected the comment for the Get Channel Info command to
reflect the logic in the code. For issue two, corrected the
condition for returning the unspecifed error.

Fixes openbmc/phosphor-host-ipmid#80
---
 apphandler.C | 4 +++-
 ipmid.C      | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index d014f5b..b8cc0aa 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -445,7 +445,9 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     printf("IPMI APP GET CHANNEL INFO\n");
 
-    // I"m only supporting channel 1.  0xE is the 'default channel'
+    // The supported channels numbers are 1 and 8.
+    // Channel Number E is used as way to identify the current channel
+    // that the command is being is received from.
     if (*p == 0xe || *p == 1 || *p == 8) {
 
         *data_len = sizeof(resp);
diff --git a/ipmid.C b/ipmid.C
index 7354958..374ede2 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -273,7 +273,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
 
-        if(r == -1) {
+        if(r < 0) {
            response[0] = IPMI_CC_UNSPECIFIED_ERROR;
         }
     }
-- 
2.9.0
