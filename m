Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5514FbzDrJj
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:56 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNl2L088655
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:54 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsann0a7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:54 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:54 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:51 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOo6U65339492; Thu, 5 Oct 2017 12:24:50 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7BC5136044;
 Thu,  5 Oct 2017 13:24:50 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 877C613603A;
 Thu,  5 Oct 2017 13:24:50 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 18/31] drivers: fsi: occ: Use big-endian
 values
Date: Thu,  5 Oct 2017 14:24:11 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0004-0000-0000-0000130560E3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0005-0000-0000-0000845C47B7
Message-Id: <1507231464-13635-19-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050269
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
X-List-Received-Date: Thu, 05 Oct 2017 19:24:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Switch to __be16 from u16 and __be32 from u32. Also, use kernel access
of unaligned be16 instead of manually creating a big-endian value from
the occ response buffer.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
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
