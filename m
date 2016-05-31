Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJsl64p7CzDqcM
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 22:10:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464696638986905.186257214449;
 Tue, 31 May 2016 05:10:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem v4] Fix issue5 for endian safe
Date: Tue, 31 May 2016 07:10:36 -0500
Message-Id: <20160531121036.11634-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531121036.11634-1-openbmc-patches@stwcx.xyz>
References: <20160531121036.11634-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 31 May 2016 12:10:43 -0000

From: Nan Li <bjlinan@cn.ibm.com>

Make eSEL request data be endian-safe.
Redefine the struct of esel_request_t.
Use le16toh() of <endian.h>

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 oemhandler.C | 29 ++++++++++++++---------------
 oemhandler.h |  9 +++------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 026e0d1..8d522c2 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -4,6 +4,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <systemd/sd-bus.h>
+#include <endian.h>
 
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
@@ -26,25 +27,23 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                                      ipmi_request_t request, ipmi_response_t response,
                                      ipmi_data_len_t data_len, ipmi_context_t context)
 {
-	esel_request_t *reqptr = (esel_request_t*) request;
+	uint8_t *reqptr = (uint8_t *) request;
+	esel_request_t esel_req;
 	FILE *fp;
 	int r = 0;
-	// TODO: Issue 5: This is not endian-safe.
-	short *recid  =  (short*) &reqptr->selrecordls;
-	short *offset =  (short*) &reqptr->offsetls;
 	uint8_t rlen;
 	ipmi_ret_t rc = IPMI_CC_OK;
 	const char *pio;
 
-	unsigned short used_res_id = 0;
-	unsigned short req_res_id = 0;
+	esel_req.resid     = le16toh((((uint16_t) reqptr[1]) << 8) + reqptr[0]);
+	esel_req.selrecord = le16toh((((uint16_t) reqptr[3]) << 8) + reqptr[2]);
+	esel_req.offset    = le16toh((((uint16_t) reqptr[5]) << 8) + reqptr[4]);
+	esel_req.progress  = reqptr[6];
 
-	used_res_id = get_sel_reserve_id();
-
-	req_res_id = (((unsigned short)reqptr->residms) << 8) + reqptr->residls;
+	uint16_t used_res_id = get_sel_reserve_id();
 
 	// According to IPMI spec, Reservation ID must be checked.
-	if ( used_res_id != req_res_id ) {
+	if ( used_res_id != esel_req.resid ) {
 		// 0xc5 means Reservation Cancelled or Invalid Reservation ID.
 		printf("Used Reservation ID = %d\n", used_res_id);
 		rc = IPMI_CC_INVALID_RESERVATION_ID;
@@ -59,7 +58,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // OpenPOWER Host Interface spec says if RecordID and Offset are
 	// 0 then then this is a new request
-	if (!*recid && !*offset)
+	if (!esel_req.selrecord && !esel_req.offset)
 		pio = "wb";
 	else
 		pio = "rb+";
@@ -67,11 +66,11 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
 
 	printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
-		g_esel_path, *offset, rlen);
+		g_esel_path, esel_req.offset, rlen);
 
 	if ((fp = fopen(g_esel_path, pio)) != NULL) {
-		fseek(fp, *offset, SEEK_SET);
-		fwrite(reqptr+1,rlen,1,fp);
+		fseek(fp, esel_req.offset, SEEK_SET);
+		fwrite(reqptr+(uint8_t) (sizeof(esel_request_t)), rlen, 1, fp);
 		fclose(fp);
 
 		*data_len = sizeof(g_record_id);
@@ -86,7 +85,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	// coming down.  If that is the case advance the record id so we
 	// don't overlap logs.  This allows anyone to establish a log
 	// directory system.
-	if (reqptr->progress & 1 ) {
+	if (esel_req.progress & 1 ) {
 		g_record_id++;
 	}
 
diff --git a/oemhandler.h b/oemhandler.h
index 71ae01c..1c8a97e 100644
--- a/oemhandler.h
+++ b/oemhandler.h
@@ -20,12 +20,9 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 
 struct esel_request_t {
-    uint8_t  residls;
-    uint8_t  residms;
-    uint8_t  selrecordls;
-    uint8_t  selrecordms;
-    uint8_t  offsetls;
-    uint8_t  offsetms;
+    uint16_t  resid;
+    uint16_t  selrecord;
+    uint16_t  offset;
     uint8_t  progress;
 }  __attribute__ ((packed)) ;
 
-- 
2.8.3
