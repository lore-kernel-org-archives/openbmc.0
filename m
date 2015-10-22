Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 746801A0976
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:30:55 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549452278306.59486583398234;
 Thu, 22 Oct 2015 14:30:52 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5 2/7] IPMI FRU Parser Interface.
Date: Thu, 22 Oct 2015 16:30:42 -0500
Message-Id: <1445549447-2577-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
References: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:30:56 -0000

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
