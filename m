Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDVlR53ddzDqF4
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 19:40:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464082841710152.61019693034825;
 Tue, 24 May 2016 02:40:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem 2/2] Fix endianness issue5
Date: Tue, 24 May 2016 04:40:37 -0500
Message-Id: <20160524094037.16462-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524094037.16462-1-openbmc-patches@stwcx.xyz>
References: <20160524094037.16462-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 09:40:52 -0000

From: Nan Li <bjlinan@cn.ibm.com>

Make it safe in both little-endian and big-endian bmc chip.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 oemhandler.C | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 026e0d1..6716618 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -30,8 +30,8 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	FILE *fp;
 	int r = 0;
 	// TODO: Issue 5: This is not endian-safe.
-	short *recid  =  (short*) &reqptr->selrecordls;
-	short *offset =  (short*) &reqptr->offsetls;
+	unsigned short recid  =  ((unsigned short) reqptr->selrecordls) << 8 + reqptr->selrecordms;
+	unsigned short offset =  ((unsigned short) reqptr->offsetls) << 8 + reqptr->offsetms;
 	uint8_t rlen;
 	ipmi_ret_t rc = IPMI_CC_OK;
 	const char *pio;
@@ -59,7 +59,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // OpenPOWER Host Interface spec says if RecordID and Offset are
 	// 0 then then this is a new request
-	if (!*recid && !*offset)
+	if (!recid && !offset)
 		pio = "wb";
 	else
 		pio = "rb+";
@@ -67,10 +67,10 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
 
 	printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
-		g_esel_path, *offset, rlen);
+		g_esel_path, offset, rlen);
 
 	if ((fp = fopen(g_esel_path, pio)) != NULL) {
-		fseek(fp, *offset, SEEK_SET);
+		fseek(fp, offset, SEEK_SET);
 		fwrite(reqptr+1,rlen,1,fp);
 		fclose(fp);
 
-- 
2.8.3
