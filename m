Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 19A0C1A0E6B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 14:40:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449546025212381.66630616456985;
 Mon, 7 Dec 2015 19:40:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] added debug on method call fails
Date: Mon,  7 Dec 2015 22:40:23 -0500
Message-Id: <1449546023-22247-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449546023-22247-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449546023-22247-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Dec 2015 03:40:31 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 76e612d..6071cb3 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -14,6 +14,7 @@
 #include "sensorhandler.h"
 
 
+
 sd_bus *bus = NULL;
 
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
@@ -214,6 +215,7 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
+        fprintf(stderr, "Dest: %s, Path: %s\n", dest, path);
         goto final;
     }
 
-- 
2.6.3
