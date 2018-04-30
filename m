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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZcWY4v75zF2QJ
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 07:05:29 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UKxQjI141681
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 17:05:26 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hp6hettn9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 17:05:26 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 30 Apr 2018 17:05:25 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 17:05:24 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3UL5NZV52297874; Mon, 30 Apr 2018 21:05:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F214124035;
 Mon, 30 Apr 2018 18:07:22 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 3617712404C;
 Mon, 30 Apr 2018 18:07:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13] fsi: occ: Add check for OCC response checksum
Date: Mon, 30 Apr 2018 16:05:21 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18043021-0052-0000-0000-000002E67305
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008953; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025617; UDB=6.00523750; IPR=6.00804849; 
 MB=3.00020870; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-30 21:05:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18043021-0053-0000-0000-00005C840303
Message-Id: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300202
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
X-List-Received-Date: Mon, 30 Apr 2018 21:05:30 -0000

The OCC specification indicates that it is an error scenario if the
response checksum doesn't match the sum of the bytes of the response.
The driver needs to perform this calculation and check, and return an
error if it's a mismatch.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-occ.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 45ae13c..16f18df 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -427,6 +427,27 @@ static int occ_release(struct inode *inode, struct file *file)
 	.release = occ_release,
 };
 
+static int occ_check_sum(struct occ_response *resp, u16 data_length)
+{
+	unsigned int i;
+	u16 checksum = 0;
+	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
+
+	checksum += resp->seq_no;
+	checksum += resp->cmd_type;
+	checksum += resp->return_status;
+	checksum += (data_length >> 8) + (data_length & 0xFF);
+
+	for (i = 0; i < data_length; ++i) {
+		checksum += resp->data[i];
+	}
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
@@ -692,6 +713,8 @@ static void occ_worker(struct work_struct *work)
 
 	xfr->resp_data_length = resp_data_length + 7;
 
+	rc = occ_check_sum(resp, resp_data_length);
+
 done:
 	mutex_unlock(&occ->occ_lock);
 
-- 
1.8.3.1
