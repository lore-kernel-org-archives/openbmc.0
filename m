Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDTQC1J7HzDqDm
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 18:40:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464079243458567.8555742006764;
 Tue, 24 May 2016 01:40:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Returning correct value from
 handle_ipmid_command in ipmid.C
Date: Tue, 24 May 2016 03:40:41 -0500
Message-Id: <20160524084041.14455-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524084041.14455-1-openbmc-patches@stwcx.xyz>
References: <20160524084041.14455-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 May 2016 08:40:51 -0000

From: Nan Li <bjlinan@cn.ibm.com>

Instead of -1, we return 0xFF(Unspecified error) to the bus.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 ipmid.C | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 728ba0b..9009cd6 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -267,6 +267,10 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     if(r != 0)
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
+
+        if(r == -1) {
+           response[0] = IPMI_CC_UNSPECIFIED_ERROR;
+        }
     }
 
     fprintf(ipmiio, "IPMI Response:\n");
-- 
2.8.3
