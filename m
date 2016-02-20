Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 617E81A0942
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455981627938751.2600045658814;
 Sat, 20 Feb 2016 07:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 2/2] Convert tabs to spaces
Date: Sat, 20 Feb 2016 09:20:25 -0600
Message-Id: <1455981625-30456-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455981625-30456-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455981625-30456-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:33 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 oemhandler.C | 98 +++++++++++++++++++++++++++++-------------------------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 6046816..f577d67 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -16,7 +16,7 @@ uint16_t g_record_id = 0x0001;
 // of 0xDF and Event Message format of 0x04. The returned
 // Record ID should be used for all partial eSEL adds.
 //
-// This function creates a /tmp/esel# file to store the
+// This function creates a /tmp/esel file to store the
 // incoming partial esel.  It is the role of some other
 // function to commit the error log in to long term
 // storage.  Likely via the ipmi add_sel command.
@@ -25,59 +25,55 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                                      ipmi_request_t request, ipmi_response_t response,
                                      ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    esel_request_t *reqptr = (esel_request_t*) request;
-    FILE *fp;
-    // TODO: Issue 5: This is not endian-safe.
-    short *recid  =  (short*) &reqptr->selrecordls;
-    short *offset =  (short*) &reqptr->offsetls;
-    uint8_t rlen;
-    ipmi_ret_t rc = IPMI_CC_OK;
-    const char *pio;
-
-
-    if (!*recid && !*offset) {
-        // OpenPOWER Host Interface spec says if RecordID and Offset are
-        // 0 then then this is a new request
-        pio = "wb";
-    } else {
-        pio = "rb+";
-    }
-
-    rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
-
-
-    printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
-        g_esel_path, *offset, rlen);
-
-
-    if ((fp = fopen(g_esel_path, pio)) != NULL) {
-        fseek(fp, *offset, SEEK_SET);
-        fwrite(reqptr+1,rlen,1,fp);
-        fclose(fp);
-
-        *data_len = sizeof(g_record_id);
-        memcpy(response, &g_record_id, *data_len);
-    } else {
-        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, g_esel_path);
-        rc = IPMI_CC_INVALID;
-        *data_len     = 0;
-    }
-
-    // The first bit prepresents that this is the last partial packet
-    // coming down.  If that is the case advance the record id so we
-    // don't overlap logs.  This allows anyone to establish a log
-    // directory system.
-    if (reqptr->progress & 1 ) {
-        g_record_id++;
-    }
-
-    return rc;
+	esel_request_t *reqptr = (esel_request_t*) request;
+	FILE *fp;
+	// TODO: Issue 5: This is not endian-safe.
+	short *recid  =  (short*) &reqptr->selrecordls;
+	short *offset =  (short*) &reqptr->offsetls;
+	uint8_t rlen;
+	ipmi_ret_t rc = IPMI_CC_OK;
+	const char *pio;
+
+	// OpenPOWER Host Interface spec says if RecordID and Offset are
+	// 0 then then this is a new request
+	if (!*recid && !*offset)
+		pio = "wb";
+	else
+		pio = "rb+";
+
+	rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
+
+	printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
+		g_esel_path, *offset, rlen);
+
+	if ((fp = fopen(g_esel_path, pio)) != NULL) {
+		fseek(fp, *offset, SEEK_SET);
+		fwrite(reqptr+1,rlen,1,fp);
+		fclose(fp);
+
+		*data_len = sizeof(g_record_id);
+		memcpy(response, &g_record_id, *data_len);
+	} else {
+		fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, g_esel_path);
+		rc = IPMI_CC_INVALID;
+		*data_len     = 0;
+	}
+
+	// The first bit prepresents that this is the last partial packet
+	// coming down.  If that is the case advance the record id so we
+	// don't overlap logs.  This allows anyone to establish a log
+	// directory system.
+	if (reqptr->progress & 1 ) {
+		g_record_id++;
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
2.7.1
