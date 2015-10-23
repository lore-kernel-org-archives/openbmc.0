Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E51D21A0228
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:24:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639086729369.2593558549995;
 Fri, 23 Oct 2015 15:24:46 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v6 2/8] IPMI FRU Parser Interface.
Date: Fri, 23 Oct 2015 17:23:07 -0500
Message-Id: <1445638993-8170-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
References: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 23 Oct 2015 22:24:54 -0000

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
