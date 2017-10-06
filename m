Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0v34R4zDqmb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:55 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624hQe019555
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:53 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddvq3suwa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:53 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:52 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:49 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626nFh7602564; Thu, 5 Oct 2017 19:06:49 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E56C6042;
 Thu,  5 Oct 2017 20:06:49 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 62FCCC6037;
 Thu,  5 Oct 2017 20:06:48 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 22/31] drivers: fsi: occ: fix white space
 and bracket problems
Date: Thu,  5 Oct 2017 21:05:44 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0020-0000-0000-00000CCF2A0A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927058; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0021-0000-0000-00005E670D11
Message-Id: <1507255553-13301-23-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:56 -0000

From: "Edward A. James" <eajames@us.ibm.com>

For better flow and to meet Linux standards.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index c2fc14c..6e20bb3 100644
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
 
@@ -163,6 +162,12 @@ static int occ_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static inline bool occ_read_ready(struct occ_xfr *xfr)
+{
+	return test_bit(XFR_COMPLETE, &xfr->flags) ||
+		test_bit(XFR_CANCELED, &xfr->flags);
+}
+
 static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 			       char *kbuf, size_t len)
 {
@@ -185,8 +190,9 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		if (client->read_offset) {
 			rc = 0;
 			client->read_offset = 0;
-		} else
+		} else {
 			rc = -ENOMSG;
+		}
 
 		goto done;
 	}
@@ -202,8 +208,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		spin_unlock_irq(&client->lock);
 
 		rc = wait_event_interruptible(client->wait,
-			test_bit(XFR_COMPLETE, &xfr->flags) ||
-			test_bit(XFR_CANCELED, &xfr->flags));
+					      occ_read_ready(xfr));
 
 		spin_lock_irq(&client->lock);
 
@@ -227,12 +232,14 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
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
 
@@ -273,6 +280,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	xfr = &client->xfr;
 
 	spin_lock_irq(&client->lock);
+
 	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
 		goto done;
@@ -280,7 +288,6 @@ static ssize_t occ_write_common(struct occ_client *client,
 
 	/* clear out the transfer */
 	memset(xfr, 0, sizeof(*xfr));
-
 	xfr->buf[0] = 1;
 
 	if (ubuf) {
@@ -288,8 +295,9 @@ static ssize_t occ_write_common(struct occ_client *client,
 			rc = -EFAULT;
 			goto done;
 		}
-	} else
+	} else {
 		memcpy(&xfr->buf[1], kbuf, len);
+	}
 
 	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
 	if (data_length > OCC_CMD_DATA_BYTES) {
@@ -446,7 +454,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
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
