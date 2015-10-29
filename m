Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C1AB91A01E9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 08:09:31 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446152965405894.2858993082529;
 Thu, 29 Oct 2015 14:09:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v7 2/9] IPMI FRU Parser Interface.
Date: Thu, 29 Oct 2015 16:09:12 -0500
Message-Id: <1446152959-8170-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446152959-8170-1-git-send-email-patches@stwcx.xyz>
References: <1446152959-8170-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 21:09:32 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 frup.h

diff --git a/frup.h b/frup.h
new file mode 100644
index 0000000..2270470
--- /dev/null
+++ b/frup.h
@@ -0,0 +1,7 @@
+#ifndef OPENBMC_IPMI_FRU_PARSER_H
+#define OPENBMC_IPMI_FRU_PARSER_H
+
+/* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
+int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
+
+#endif
-- 
2.6.0
