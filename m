Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47AF51A0992
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 04:48:21 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444758497510221.86723015773907;
 Tue, 13 Oct 2015 10:48:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 3/8] Reset the lib path string per .so
Date: Tue, 13 Oct 2015 12:48:02 -0500
Message-Id: <1444758487-9135-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
References: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 17:48:21 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 3b136d0..d0dfba8 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -343,13 +343,14 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
         num_handlers = scandir(ipmi_lib_path, &handler_list, handler_select, alphasort);
         while(num_handlers--)
         {
-            printf("Registering handler:[%s]\n",handler_list[num_handlers]->d_name);
-
+            handler_fqdn = ipmi_lib_path;
             handler_fqdn += handler_list[num_handlers]->d_name;
+            printf("Registering handler:[%s]\n",handler_fqdn.c_str());
+
             lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
             if(lib_handler == NULL)
             {
-                fprintf(stderr,"ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
+                fprintf(stderr,"ERROR opening:[%s]\n",handler_fqdn.c_str());
                 dlerror();
             }
             // Wipe the memory allocated for this particular entry.
-- 
2.6.0
