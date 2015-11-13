Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C8BE01A0AA2
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 05:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447440024107681.7917356506946;
 Fri, 13 Nov 2015 10:40:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Create ipmi_context header
Date: Fri, 13 Nov 2015 13:40:22 -0500
Message-Id: <1447440022-9037-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447440022-9037-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447440022-9037-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 18:40:29 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index b3117d5..5971d96 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -1,6 +1,7 @@
 #ifndef __HOST_IPMID_IPMI_COMMON_H__
 #define __HOST_IPMID_IPMI_COMMON_H__
 #include <stdlib.h>
+#include <systemd/sd-bus.h>
 
 // length of Completion Code and its ALWAYS _1_
 #define IPMI_CC_LEN 1
@@ -32,7 +33,13 @@ typedef void*           ipmi_response_t;
 // fill in whatever needed that will be of help during the actual handling of
 // command. IPMID will just pass the netfn, cmd and also this data to plugins
 // during the command handler invocation.
-typedef void*           ipmi_context_t;
+struct _ipmi_context_t {
+    void   *user;
+    sd_bus *bus;
+    unsigned long  flags;
+};
+
+typedef _ipmi_context_t *ipmi_context_t;
 
 // Length of request / response buffer depending on whether the data is a
 // request or a response from a plugin handler.
-- 
2.6.3
