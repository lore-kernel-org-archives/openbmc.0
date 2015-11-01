Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B63871A07C1
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:14:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340468609710.2886691472893;
 Sat, 31 Oct 2015 18:14:28 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem] Fixed byte swapped esel log name
Date: Sat, 31 Oct 2015 20:14:25 -0500
Message-Id: <1446340465-8828-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446340465-8828-1-git-send-email-patches@stwcx.xyz>
References: <1446340465-8828-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:14:33 -0000

From: Chris Austen <austenc@us.ibm.com>

so logs are saved moved to tabs.. sorry that really messes up the changes
---
 oemhandler.C | 118 +++++++++++++++++++++++++++++------------------------------
 1 file changed, 57 insertions(+), 61 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index c19d9ce..8d4ac62 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -6,80 +6,76 @@
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
 const char *g_esel_path = "/tmp/";
-uint16_t g_record_id = 0x0100;
-
-
-#define LSMSSWAP(x,y) ((y)<<8|(x))
+uint16_t g_record_id = 0x0001;
 
 
 ///////////////////////////////////////////////////////////////////////////////
-// For the First partial add eSEL the SEL Record ID and offset
-// value should be 0x0000. The extended data needs to be in
-// the form of an IPMI SEL Event Record, with Event sensor type
-// of 0xDF and Event Message format of 0x04. The returned
+// For the First partial add eSEL the SEL Record ID and offset 
+// value should be 0x0000. The extended data needs to be in 
+// the form of an IPMI SEL Event Record, with Event sensor type 
+// of 0xDF and Event Message format of 0x04. The returned 
 // Record ID should be used for all partial eSEL adds.
 //
-// This function creates a /tmp/esel# file to store the
+// This function creates a /tmp/esel# file to store the 
 // incoming partial esel.  It is the role of some other
-// function to commit the error log in to long term
-// storage.  Likely via the ipmi add_sel command.
+// function to commit the error log in to long term 
+// storage.  Likely via the ipmi add_sel command.  
 ///////////////////////////////////////////////////////////////////////////////
-ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                                      ipmi_request_t request, ipmi_response_t response,
                                      ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    esel_request_t *reqptr = (esel_request_t*) request;
-    FILE *fp;
-    short recid, offset = 0;
-    uint8_t rlen;
-    ipmi_ret_t rc = IPMI_CC_OK;
-    char string[64];
-    const char *pio;
-
-    recid  = LSMSSWAP(reqptr->selrecordls, reqptr->selrecordms);
-    offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
-
-    if (!recid && !offset) {
-        // OpenPOWER Host Interface spec says if RecordID and Offset are
-        // 0 then then this is a new request
-        pio = "wb";
-        snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", (g_record_id&0xFF00>>8), (g_record_id&0xFF));
-    } else {
-        pio = "rb+";
-        snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
-    }
-
-    // Length is the number of request bytes minus the header itself.
-    // The header contains an extra byte to indicate the start of
-    // the data (so didn't need to worry about word/byte boundaries)
-    // hence the -1...
-    rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
-
-
-    printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
-        string, offset, rlen);
-
-
-    if ((fp = fopen(string, pio)) != NULL) {
-        fseek(fp, offset, SEEK_SET);
-        fwrite(reqptr+1,rlen,1,fp);
-        fclose(fp);
-
-        *data_len = sizeof(g_record_id);
-        memcpy(response, &g_record_id, *data_len);
-    } else {
-        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
-        rc = IPMI_CC_INVALID;
-        *data_len     = 0;
-    }
-
-    return rc;
+	esel_request_t *reqptr = (esel_request_t*) request;
+	FILE *fp;
+	short *recid  =  (short*) &reqptr->selrecordls;
+	short *offset =  (short*) &reqptr->offsetls;
+	uint8_t rlen;
+	ipmi_ret_t rc = IPMI_CC_OK;
+	char string[64];
+	const char *pio;
+
+
+	if (!*recid && !*offset) {
+		// OpenPOWER Host Interface spec says if RecordID and Offset are
+		// 0 then then this is a new request
+		pio = "wb";
+		snprintf(string, sizeof(string), "%s%s%04x", g_esel_path, "esel", g_record_id);
+	} else {
+		pio = "rb+";
+		snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
+	}
+
+	// Length is the number of request bytes minus the header itself.
+	// The header contains an extra byte to indicate the start of
+	// the data (so didn't need to worry about word/byte boundaries)
+	// hence the -1...
+	rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
+
+
+	printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
+		string, *offset, rlen);
+
+
+	if ((fp = fopen(string, pio)) != NULL) {
+		fseek(fp, *offset, SEEK_SET);
+		fwrite(reqptr+1,rlen,1,fp);
+		fclose(fp);
+
+		*data_len = sizeof(g_record_id);
+		memcpy(response, &g_record_id, *data_len);
+	} else {
+		fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
+		rc = IPMI_CC_INVALID;
+		*data_len     = 0;
+	}
+
+	return rc;
 }
 
 
 void register_netfn_oem_partial_esel()
 {
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
-    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
-    return;
+	printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
+	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+	return;
 }
-- 
2.6.0
