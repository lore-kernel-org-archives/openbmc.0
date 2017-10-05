Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5L154xzDrH3
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:09 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JP8Dp089310
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:08 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddtt788pn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:25:04 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:58 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:56 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOuBl30081086; Thu, 5 Oct 2017 12:24:56 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C7913603C;
 Thu,  5 Oct 2017 13:24:56 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id BF61213603A;
 Thu,  5 Oct 2017 13:24:55 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 22/31] drivers: fsi: occ: fix white space
 and bracket problems
Date: Thu,  5 Oct 2017 14:24:15 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0020-0000-0000-00000CCED101
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466364; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0021-0000-0000-00005E662BF5
Message-Id: <1507231464-13635-23-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:10 -0000

From: "Edward A. James" <eajames@us.ibm.com>

For better flow and to meet Linux standards.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 4e677c6..f27345c 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -132,9 +132,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
 
 static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 {
-	struct occ_client *client;
+	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
 
-	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client)
 		return NULL;
 
@@ -180,8 +179,9 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		if (client->read_offset) {
 			rc = 0;
 			client->read_offset = 0;
-		} else
+		} else {
 			rc = -ENOMSG;
+		}
 
 		goto done;
 	}
@@ -197,8 +197,10 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		spin_unlock_irq(&client->lock);
 
 		rc = wait_event_interruptible(client->wait,
-			test_bit(XFR_COMPLETE, &xfr->flags) ||
-			test_bit(XFR_CANCELED, &xfr->flags));
+					      test_bit(XFR_COMPLETE,
+						       &xfr->flags) ||
+					      test_bit(XFR_CANCELED,
+						       &xfr->flags));
 
 		spin_lock_irq(&client->lock);
 
@@ -222,12 +224,14 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 	bytes = min(len, xfr->resp_data_length - client->read_offset);
 	if (ubuf) {
-		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
+		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
+				 bytes)) {
 			rc = -EFAULT;
 			goto done;
 		}
-	} else
+	} else {
 		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
+	}
 
 	client->read_offset += bytes;
 
@@ -263,6 +267,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 		return -EINVAL;
 
 	spin_lock_irq(&client->lock);
+
 	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
 		goto done;
@@ -270,7 +275,6 @@ static ssize_t occ_write_common(struct occ_client *client,
 
 	/* clear out the transfer */
 	memset(xfr, 0, sizeof(*xfr));
-
 	xfr->buf[0] = 1;
 
 	if (ubuf) {
@@ -278,8 +282,9 @@ static ssize_t occ_write_common(struct occ_client *client,
 			rc = -EFAULT;
 			goto done;
 		}
-	} else
+	} else {
 		memcpy(&xfr->buf[1], kbuf, len);
+	}
 
 	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
 	if (data_length > OCC_CMD_DATA_BYTES) {
@@ -430,7 +435,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
 	if (rc)
 		goto done;
-	
+
 	resp = kzalloc(data_len, GFP_KERNEL);
 	if (!resp) {
 		rc = -ENOMEM;
-- 
1.8.3.1
