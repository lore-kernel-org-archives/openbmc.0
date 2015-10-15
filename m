Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 078FD1A06F1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 02:43:31 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444923809804848.539584475441;
 Thu, 15 Oct 2015 08:43:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/4] Print the dlopen failure for debugging
Date: Thu, 15 Oct 2015 10:43:20 -0500
Message-Id: <1444923803-24688-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 15:43:32 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipmid.C b/ipmid.C
index d0dfba8..87f993e 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -351,7 +351,7 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
             if(lib_handler == NULL)
             {
                 fprintf(stderr,"ERROR opening:[%s]\n",handler_fqdn.c_str());
-                dlerror();
+                fprintf(stderr, "%s\n", dlerror());
             }
             // Wipe the memory allocated for this particular entry.
             free(handler_list[num_handlers]);
-- 
2.6.0
