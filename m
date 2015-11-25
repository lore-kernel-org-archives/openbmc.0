Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8C0C31A0351
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435427417172.69723460690523;
 Tue, 24 Nov 2015 23:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/7] ipmid-api: wrap in extern "C"
Date: Wed, 25 Nov 2015 02:10:19 -0500
Message-Id: <1448435424-9067-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:31 -0000

From: Joel Stanley <joel@jms.id.au>

Wrap the entire header in an ifdef'd extern "C" so it can be used from C
files.  This fixes compilation for c files that need the header.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ipmid-api.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index 2d58961..4f4b9de 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -3,6 +3,10 @@
 #include <stdlib.h>
 #include <systemd/sd-bus.h>
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 // length of Completion Code and its ALWAYS _1_
 #define IPMI_CC_LEN 1
 
@@ -51,9 +55,7 @@ typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
 // This is the constructor function that is called into by each plugin handlers.
 // When ipmi sets up the callback handlers, a call is made to this with
 // information of netfn, cmd, callback handler pointer and context data.
-// Making this a extern "C" so that plugin libraries written in C can also use
-// it.
-extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
+void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
                                        ipmi_context_t, ipmid_callback_t);
 
 // These are the command network functions, the response
@@ -94,5 +96,10 @@ enum ipmi_return_codes
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
-extern "C" sd_bus *ipmid_get_sd_bus_connection(void);
+sd_bus *ipmid_get_sd_bus_connection(void);
+
+#ifdef __cplusplus
+}
+#endif
+
 #endif
-- 
2.6.3
