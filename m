Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDVlR3zKrzDqDr
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 19:40:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146408284020320.097160032885654;
 Tue, 24 May 2016 02:40:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem 1/2] Handle multiple attempts at ipmi
 reservation ids
Date: Tue, 24 May 2016 04:40:36 -0500
Message-Id: <20160524094037.16462-2-openbmc-patches@stwcx.xyz>
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

1. Check Reservation ID.
2. Use Reservation ID from shared librarys.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 oemhandler.C | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 22452d6..026e0d1 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -10,7 +10,6 @@ void register_netfn_oem_partial_esel() __attribute__((constructor));
 const char *g_esel_path = "/tmp/esel";
 uint16_t g_record_id = 0x0001;
 
-
 ///////////////////////////////////////////////////////////////////////////////
 // For the First partial add eSEL the SEL Record ID and offset
 // value should be 0x0000. The extended data needs to be in
@@ -29,6 +28,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
 	esel_request_t *reqptr = (esel_request_t*) request;
 	FILE *fp;
+	int r = 0;
 	// TODO: Issue 5: This is not endian-safe.
 	short *recid  =  (short*) &reqptr->selrecordls;
 	short *offset =  (short*) &reqptr->offsetls;
@@ -36,7 +36,28 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	ipmi_ret_t rc = IPMI_CC_OK;
 	const char *pio;
 
-	// OpenPOWER Host Interface spec says if RecordID and Offset are
+	unsigned short used_res_id = 0;
+	unsigned short req_res_id = 0;
+
+	used_res_id = get_sel_reserve_id();
+
+	req_res_id = (((unsigned short)reqptr->residms) << 8) + reqptr->residls;
+
+	// According to IPMI spec, Reservation ID must be checked.
+	if ( used_res_id != req_res_id ) {
+		// 0xc5 means Reservation Cancelled or Invalid Reservation ID.
+		printf("Used Reservation ID = %d\n", used_res_id);
+		rc = IPMI_CC_INVALID_RESERVATION_ID;
+
+		// clean g_esel_path. 
+		r = remove(g_esel_path);
+		if(r < 0)
+			fprintf(stderr, "Error deleting %s\n", g_esel_path);
+
+		return rc;
+	}
+
+    // OpenPOWER Host Interface spec says if RecordID and Offset are
 	// 0 then then this is a new request
 	if (!*recid && !*offset)
 		pio = "wb";
-- 
2.8.3
