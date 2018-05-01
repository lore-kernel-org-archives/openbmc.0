Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40b49g3NRDzF2Qs
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 00:51:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w41Ep9Gl145468
 for <openbmc@lists.ozlabs.org>; Tue, 1 May 2018 10:51:33 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hpqqv6n0e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 May 2018 10:51:32 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 1 May 2018 10:51:31 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 1 May 2018 10:51:28 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w41EpRQW55247064; Tue, 1 May 2018 14:51:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59478AC040;
 Tue,  1 May 2018 10:52:57 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.80.214.2])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id D3BFAAC03A;
 Tue,  1 May 2018 10:52:56 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, stewart@linux.ibm.com,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 v2] fsi: occ: Add check for OCC response
 checksum
Date: Tue,  1 May 2018 09:51:25 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18050114-0056-0000-0000-00000447E48F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008957; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025973; UDB=6.00523960; IPR=6.00805204; 
 MB=3.00020883; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-01 14:51:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050114-0057-0000-0000-0000088BEA5E
Message-Id: <1525186285-27508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805010148
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 14:51:36 -0000

The OCC specification indicates that it is an error scenario if the
response checksum doesn't match the sum of the bytes of the response.
The driver needs to perform this calculation and check, and return an
error if it's a mismatch.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
Changes since v1:
 - rename occ_check_sum() to occ_verify_checksum()
 - remove checksum field from occ_response and instead add two bytes to data
   field, with comment
 - add comment to fetching checksum from response data

 drivers/fsi/fsi-occ.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 45ae13c..8df1c64 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -58,8 +58,7 @@ struct occ_response {
 	u8 cmd_type;
 	u8 return_status;
 	__be16 data_length;
-	u8 data[OCC_RESP_DATA_BYTES];
-	__be16 checksum;
+	u8 data[OCC_RESP_DATA_BYTES + 2];	/* two bytes checksum */
 } __packed;
 
 /*
@@ -427,6 +426,27 @@ static int occ_release(struct inode *inode, struct file *file)
 	.release = occ_release,
 };
 
+static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
+{
+	u16 i;
+	u16 checksum;
+	/* Fetch the two bytes after the data for the checksum. */
+	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
+
+	checksum = resp->seq_no;
+	checksum += resp->cmd_type;
+	checksum += resp->return_status;
+	checksum += (data_length >> 8) + (data_length & 0xFF);
+
+	for (i = 0; i < data_length; ++i)
+		checksum += resp->data[i];
+
+	if (checksum != checksum_resp)
+		return -EBADMSG;
+
+	return 0;
+}
+
 static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
 			     ssize_t len)
 {
@@ -692,6 +712,8 @@ static void occ_worker(struct work_struct *work)
 
 	xfr->resp_data_length = resp_data_length + 7;
 
+	rc = occ_verify_checksum(resp, resp_data_length);
+
 done:
 	mutex_unlock(&occ->occ_lock);
 
-- 
1.8.3.1
