Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0k5TbLzDqp4
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9626LFF139980
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:45 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddtx7py9m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:45 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:44 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:41 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626eMK852300; Thu, 5 Oct 2017 19:06:40 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82980C6047;
 Thu,  5 Oct 2017 20:06:40 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id B34C7C603C;
 Thu,  5 Oct 2017 20:06:36 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 18/31] drivers: fsi: occ: Use big-endian
 values
Date: Thu,  5 Oct 2017 21:05:40 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0008-0000-0000-000008ABCB06
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707312; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0009-0000-0000-0000443F7588
Message-Id: <1507255553-13301-19-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 02:06:47 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Switch to __be16 from u16 and __be32 from u32. Also, use kernel access
of unaligned be16 instead of manually creating a big-endian value from
the occ response buffer.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/occ.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 82a60c5..55f293d 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -50,9 +50,9 @@ struct occ_response {
 	u8 seq_no;
 	u8 cmd_type;
 	u8 return_status;
-	u16 data_length;
+	__be16 data_length;
 	u8 data[OCC_RESP_DATA_BYTES];
-	u16 checksum;
+	__be16 checksum;
 } __packed;
 
 /*
@@ -425,7 +425,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 {
 	int rc;
 	u8 *resp;
-	u32 buf[5];
+	__be32 buf[5];
 	u32 data_len = ((len + 7) / 8) * 8;
 	struct sbefifo_client *client;
 
@@ -476,7 +476,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 		       ssize_t len)
 {
 	int rc;
-	u32 *buf;
+	__be32 *buf;
 	u32 data_len = ((len + 7) / 8) * 8;
 	size_t cmd_len = data_len + 20;
 	struct sbefifo_client *client;
@@ -522,7 +522,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 static int occ_trigger_attn(struct device *sbefifo)
 {
 	int rc;
-	u32 buf[6];
+	__be32 buf[6];
 	struct sbefifo_client *client;
 
 	buf[0] = cpu_to_be32(0x6);
@@ -560,6 +560,7 @@ static void occ_worker(struct work_struct *work)
 	int rc = 0, empty, waiting, canceled;
 	u16 resp_data_length;
 	struct occ_xfr *xfr;
+	struct occ_response *resp;
 	struct occ_client *client;
 	struct occ *occ = container_of(work, struct occ, work);
 	struct device *sbefifo = occ->sbefifo;
@@ -573,6 +574,7 @@ static void occ_worker(struct work_struct *work)
 		return;
 	}
 
+	resp = (struct occ_response *)xfr->buf;
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
 	spin_unlock_irq(&occ->list_lock);
@@ -591,7 +593,7 @@ static void occ_worker(struct work_struct *work)
 	if (rc)
 		goto done;
 
-	resp_data_length = (xfr->buf[3] << 8) + xfr->buf[4];
+	resp_data_length = get_unaligned_be16(&resp->data_length);
 	if (resp_data_length > OCC_RESP_DATA_BYTES) {
 		rc = -EDOM;
 		goto done;
-- 
1.8.3.1
