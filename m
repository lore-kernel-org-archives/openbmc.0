Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zYB6W2HHzzF0dL
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 09:12:03 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w12M9hXR106843
 for <openbmc@lists.ozlabs.org>; Fri, 2 Feb 2018 17:12:01 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fvvsnr884-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Feb 2018 17:12:00 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 2 Feb 2018 17:11:59 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 2 Feb 2018 17:11:55 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w12MBtWu42795042; Fri, 2 Feb 2018 22:11:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EC96112051;
 Fri,  2 Feb 2018 17:09:59 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 0B259112047;
 Fri,  2 Feb 2018 17:09:58 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] drivers: fsi: occ: switch to irqsave and
 irqrestore
Date: Fri,  2 Feb 2018 16:11:47 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1517609507-20687-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1517609507-20687-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18020222-0024-0000-0000-0000031DDFAF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008463; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00984145; UDB=6.00499184; IPR=6.00763423; 
 BA=6.00005809; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019341; XFM=3.00000015;
 UTC=2018-02-02 22:11:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020222-0025-0000-0000-000046DA85F8
Message-Id: <1517609507-20687-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802020267
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 22:12:04 -0000

Fix spinlocking by storing the interrupt state and restoring that state
when unlocking, instead of blindly disabling and re-enabling all irqs.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/occ.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index adc64f3..edb5e977 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -118,18 +118,19 @@ struct occ_client {
 static int occ_enqueue_xfr(struct occ_xfr *xfr)
 {
 	int empty;
+	unsigned long flags;
 	struct occ_client *client = to_client(xfr);
 	struct occ *occ = client->occ;
 
 	if (occ->cancel)
 		return -ENODEV;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	empty = list_empty(&occ->xfrs);
 	list_add_tail(&xfr->link, &occ->xfrs);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	if (empty)
 		queue_work(occ_wq, &occ->work);
@@ -201,6 +202,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	size_t bytes;
 	struct occ_xfr *xfr;
 	struct occ *occ;
+	unsigned long flags;
 
 	if (!client)
 		return -ENODEV;
@@ -212,7 +214,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	xfr = &client->xfr;
 	occ = client->occ;
 
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		/* we just finished reading all data, return 0 */
@@ -232,12 +234,12 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 			goto done;
 		}
 
-		spin_unlock_irq(&client->lock);
+		spin_unlock_irqrestore(&client->lock, flags);
 
 		rc = wait_event_interruptible(client->wait,
 					      occ_read_ready(xfr, occ));
 
-		spin_lock_irq(&client->lock);
+		spin_lock_irqsave(&client->lock, flags);
 
 		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
 			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
@@ -274,7 +276,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	rc = bytes;
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 	occ_put_client(client);
 	return rc;
 }
@@ -293,6 +295,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 {
 	int rc;
 	unsigned int i;
+	unsigned long flags;
 	u16 data_length, checksum = 0;
 	struct occ_xfr *xfr;
 
@@ -305,7 +308,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	occ_get_client(client);
 	xfr = &client->xfr;
 
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
@@ -353,7 +356,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	rc = len;
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 	occ_put_client(client);
 	return rc;
 }
@@ -370,6 +373,7 @@ static int occ_release_common(struct occ_client *client)
 {
 	struct occ *occ;
 	struct occ_xfr *xfr;
+	unsigned long flags;
 
 	if (!client)
 		return -ENODEV;
@@ -377,13 +381,13 @@ static int occ_release_common(struct occ_client *client)
 	xfr = &client->xfr;
 	occ = client->occ;
 
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	set_bit(XFR_CANCELED, &xfr->flags);
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
 		goto done;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock(&occ->list_lock);
 
 	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
 		/* already deleted from list if complete */
@@ -391,12 +395,12 @@ static int occ_release_common(struct occ_client *client)
 			list_del(&xfr->link);
 	}
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock(&occ->list_lock);
 
 	wake_up_all(&client->wait);
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 
 	occ_put_client(client);
 	return 0;
@@ -606,6 +610,7 @@ static void occ_worker(struct work_struct *work)
 {
 	int rc = 0, empty;
 	u16 resp_data_length;
+	unsigned long flags;
 	unsigned long start;
 	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
 	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
@@ -619,11 +624,11 @@ static void occ_worker(struct work_struct *work)
 	if (occ->cancel)
 		return;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
 	if (!xfr) {
-		spin_unlock_irq(&occ->list_lock);
+		spin_unlock_irqrestore(&occ->list_lock, flags);
 		return;
 	}
 
@@ -632,7 +637,7 @@ static void occ_worker(struct work_struct *work)
 	resp = (struct occ_response *)xfr->buf;
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 	mutex_lock(&occ->occ_lock);
 
 	start = jiffies;
@@ -686,13 +691,13 @@ static void occ_worker(struct work_struct *work)
 	xfr->rc = rc;
 	set_bit(XFR_COMPLETE, &xfr->flags);
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
 	list_del(&xfr->link);
 	empty = list_empty(&occ->xfrs);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	wake_up_interruptible(&client->wait);
 	occ_put_client(client);
@@ -810,15 +815,16 @@ static int occ_remove(struct platform_device *pdev)
 	struct occ *occ = platform_get_drvdata(pdev);
 	struct occ_xfr *xfr;
 	struct occ_client *client;
+	unsigned long flags;
 
 	occ->cancel = true;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 	list_for_each_entry(xfr, &occ->xfrs, link) {
 		client = to_client(xfr);
 		wake_up_all(&client->wait);
 	}
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	misc_deregister(&occ->mdev);
 	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
-- 
1.8.3.1
