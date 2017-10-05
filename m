Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5P3CV7zDrJp
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:12 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JOb5X111767
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:10 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddp69f0g5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:25:09 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:25:09 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:25:05 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JP42p9306546; Thu, 5 Oct 2017 12:25:05 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 490AF13604D;
 Thu,  5 Oct 2017 13:25:05 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 13076136044;
 Thu,  5 Oct 2017 13:25:05 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 29/31] drivers: fsi: occ: Fix client memory
 management
Date: Thu,  5 Oct 2017 14:24:22 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0024-0000-0000-0000174BB8C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:25:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0025-0000-0000-00004CFD0A59
Message-Id: <1507231464-13635-30-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:14 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Potential for bad memory access in the worker function. Now fixed by
using reference counters.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 92 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 43 insertions(+), 49 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 1770823..f2b5b95 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -70,15 +70,11 @@ struct occ_response {
  *  and cleared if the transfer fails or occ_worker_getsram completes.
  * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
  * XFR_CANCELED is set when the transfer's client is released.
- * XFR_WAITING is set from read() if the transfer isn't complete and
- *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
- *  fails.
  */
 enum {
 	XFR_IN_PROGRESS,
 	XFR_COMPLETE,
 	XFR_CANCELED,
-	XFR_WAITING,
 };
 
 struct occ_xfr {
@@ -104,6 +100,7 @@ enum {
 };
 
 struct occ_client {
+	struct kref kref;
 	struct occ *occ;
 	struct occ_xfr xfr;
 	spinlock_t lock;		/* lock access to the client state */
@@ -140,6 +137,24 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
 	return 0;
 }
 
+static void occ_get_client(struct occ_client *client)
+{
+	kref_get(&client->kref);
+}
+
+static void occ_client_release(struct kref *kref)
+{
+	struct occ_client *client = container_of(kref, struct occ_client,
+						 kref);
+
+	kfree(client);
+}
+
+static void occ_put_client(struct occ_client *client)
+{
+	kref_put(&client->kref, occ_client_release);
+}
+
 static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 {
 	struct occ_client *client;
@@ -152,6 +167,7 @@ static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 		return ERR_PTR(-ENOMEM);
 
 	client->occ = occ;
+	kref_init(&client->kref);
 	spin_lock_init(&client->lock);
 	init_waitqueue_head(&client->wait);
 
@@ -187,6 +203,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	if (len > OCC_SRAM_BYTES)
 		return -EINVAL;
 
+	occ_get_client(client);
 	spin_lock_irq(&client->lock);
 
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
@@ -207,8 +224,6 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 			goto done;
 		}
 
-		set_bit(XFR_WAITING, &xfr->flags);
-
 		spin_unlock_irq(&client->lock);
 
 		rc = wait_event_interruptible(client->wait,
@@ -220,15 +235,12 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 		spin_lock_irq(&client->lock);
 
-		if (test_bit(XFR_CANCELED, &xfr->flags)) {
-			spin_unlock_irq(&client->lock);
-			kfree(client);
-			return -EBADFD;
-		}
-
-		clear_bit(XFR_WAITING, &xfr->flags);
 		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
-			rc = -EINTR;
+			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
+				rc = -ECANCELED;
+			else
+				rc = -EINTR;
+
 			goto done;
 		}
 	}
@@ -259,6 +271,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 done:
 	spin_unlock_irq(&client->lock);
+	occ_put_client(client);
 	return rc;
 }
 
@@ -282,6 +295,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
 		return -EINVAL;
 
+	occ_get_client(client);
 	spin_lock_irq(&client->lock);
 
 	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
@@ -331,6 +345,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 
 done:
 	spin_unlock_irq(&client->lock);
+	occ_put_client(client);
 	return rc;
 }
 
@@ -349,38 +364,26 @@ static int occ_release_common(struct occ_client *client)
 
 	spin_lock_irq(&client->lock);
 
-	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
-		spin_unlock_irq(&client->lock);
-		kfree(client);
-		return 0;
-	}
+	set_bit(XFR_CANCELED, &xfr->flags);
+	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
+		goto done;
 
 	spin_lock_irq(&occ->list_lock);
 
-	set_bit(XFR_CANCELED, &xfr->flags);
 	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
 		/* already deleted from list if complete */
 		if (!test_bit(XFR_COMPLETE, &xfr->flags))
 			list_del(&xfr->link);
-
-		spin_unlock_irq(&occ->list_lock);
-
-		if (test_bit(XFR_WAITING, &xfr->flags)) {
-			/* blocking read; let reader clean up */
-			wake_up_interruptible(&client->wait);
-			spin_unlock_irq(&client->lock);
-			return 0;
-		}
-
-		spin_unlock_irq(&client->lock);
-
-		kfree(client);
-		return 0;
 	}
 
-	/* operation is in progress; let worker clean up */
 	spin_unlock_irq(&occ->list_lock);
+
+	wake_up_all(&client->wait);
+
+done:
 	spin_unlock_irq(&client->lock);
+
+	occ_put_client(client);
 	return 0;
 }
 
@@ -586,7 +589,7 @@ static int occ_trigger_attn(struct device *sbefifo)
 
 static void occ_worker(struct work_struct *work)
 {
-	int rc = 0, empty, waiting, canceled;
+	int rc = 0, empty;
 	u16 resp_data_length;
 	unsigned long start;
 	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
@@ -609,6 +612,8 @@ static void occ_worker(struct work_struct *work)
 		return;
 	}
 
+	client = to_client(xfr);
+	occ_get_client(client);
 	resp = (struct occ_response *)xfr->buf;
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
@@ -664,29 +669,18 @@ static void occ_worker(struct work_struct *work)
 	mutex_unlock(&occ->occ_lock);
 
 	xfr->rc = rc;
-	client = to_client(xfr);
-
-	/* lock client to prevent race with read() */
-	spin_lock_irq(&client->lock);
-
 	set_bit(XFR_COMPLETE, &xfr->flags);
-	waiting = test_bit(XFR_WAITING, &xfr->flags);
-
-	spin_unlock_irq(&client->lock);
 
 	spin_lock_irq(&occ->list_lock);
 
 	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
 	list_del(&xfr->link);
 	empty = list_empty(&occ->xfrs);
-	canceled = test_bit(XFR_CANCELED, &xfr->flags);
 
 	spin_unlock_irq(&occ->list_lock);
 
-	if (waiting)
-		wake_up_interruptible(&client->wait);
-	else if (canceled)
-		kfree(client);
+	wake_up_interruptible(&client->wait);
+	occ_put_client(client);
 
 	if (!empty)
 		goto again;
-- 
1.8.3.1
