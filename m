Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DBF951A0725
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:57:12 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259429456473.72629535164424;
 Mon, 19 Oct 2015 05:57:09 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 1/6] Print the dlopen failure for
 debugging
Date: Mon, 19 Oct 2015 07:57:01 -0500
Message-Id: <1445259426-10511-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259426-10511-1-git-send-email-patches@stwcx.xyz>
References: <1445259426-10511-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:13 -0000

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
