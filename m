Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41A001A01EC
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 07:10:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457467835272402.9990566265286;
 Tue, 8 Mar 2016 12:10:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Date: Tue,  8 Mar 2016 14:10:33 -0600
Message-Id: <1457467833-17690-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457467833-17690-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457467833-17690-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Mar 2016 20:10:42 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 apphandler.C | 2 +-
 ipmid.C      | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index a921643..fc6c811 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -358,7 +358,7 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("IPMI APP GET CHANNEL INFO\n");
 
     // I"m only supporting channel 1.  0xE is the 'default channel'
-    if (*p == 0xe || *p == 1) {
+    if (*p == 0xe || *p == 1 || *p == 8) {
 
         *data_len = sizeof(resp);
         memcpy(response, resp, *data_len);
diff --git a/ipmid.C b/ipmid.C
index 6726a27..728ba0b 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -267,7 +267,6 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     if(r != 0)
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
-        return -1;
     }
 
     fprintf(ipmiio, "IPMI Response:\n");
-- 
2.7.1
