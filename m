Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E243B1A0BF2
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 14:59:17 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446955150374298.39231438013314;
 Sat, 7 Nov 2015 19:59:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 02/11] IPMI FRU Parser Interface.
Date: Sat,  7 Nov 2015 22:58:59 -0500
Message-Id: <1446955148-30303-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 03:59:18 -0000

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
2.6.3
