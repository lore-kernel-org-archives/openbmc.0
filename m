Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGpQs4w8wzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 08:36:05 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9HLTbfp100949
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:02 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dnrw22gs1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:01 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 17 Oct 2017 15:36:01 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 17 Oct 2017 15:35:58 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9HLZv9S31588534; Tue, 17 Oct 2017 14:35:57 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F69E6A042;
 Tue, 17 Oct 2017 15:35:58 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id BACB16A03B;
 Tue, 17 Oct 2017 15:35:57 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/3] drivers: fsi: sbefifo: Fix queued xfrs
 race condition
Date: Tue, 17 Oct 2017 16:35:51 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17101721-0028-0000-0000-0000088405DF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007908; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000237; SDB=6.00932594; UDB=6.00469652; IPR=6.00712884; 
 BA=6.00005643; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017581; XFM=3.00000015;
 UTC=2017-10-17 21:36:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101721-0029-0000-0000-000037F9D07C
Message-Id: <1508276153-3779-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710170300
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
X-List-Received-Date: Tue, 17 Oct 2017 21:36:06 -0000

From: "Edward A. James" <eajames@us.ibm.com>

There was a race condition where: sbefifo remove() is called, a transfer
is queued, a client is waiting, and a client is released at the same
time. In this situation, remove() wakes up the client waiter, which
destroys the client's list of transfers. This must be done since in an
error case, we don't know if the transfers are deleted or not. Then,
the client is released. Since it has no transfers, it fails to cancel
the queued transfer. This transfer then wakes up on the timer, where it
attempts to access it's client buffers, which have been freed.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 5d73437..c914eaf 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -312,22 +312,27 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
 
 static void sbefifo_client_release(struct kref *kref)
 {
+	struct sbefifo *sbefifo;
 	struct sbefifo_client *client;
 	struct sbefifo_xfr *xfr;
 
 	client = container_of(kref, struct sbefifo_client, kref);
-	list_for_each_entry(xfr, &client->xfrs, client) {
-		/*
-		 * The client left with pending or running xfrs.
-		 * Cancel them.
-		 */
-		set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
-		sbefifo_get(client->dev);
-		if (mod_timer(&client->dev->poll_timer, jiffies))
-			sbefifo_put(client->dev);
+	sbefifo = client->dev;
+
+	if (!READ_ONCE(sbefifo->rc)) {
+		list_for_each_entry(xfr, &client->xfrs, client) {
+			/*
+			 * The client left with pending or running xfrs.
+			 * Cancel them.
+			 */
+			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+			sbefifo_get(sbefifo);
+			if (mod_timer(&client->dev->poll_timer, jiffies))
+				sbefifo_put(sbefifo);
+		}
 	}
 
-	sbefifo_put(client->dev);
+	sbefifo_put(sbefifo);
 	kfree(client);
 }
 
@@ -901,7 +906,16 @@ static int sbefifo_remove(struct device *dev)
 	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 	struct sbefifo_xfr *xfr;
 
+	spin_lock(&sbefifo->lock);
+
 	WRITE_ONCE(sbefifo->rc, -ENODEV);
+	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
+		kfree(xfr);
+
+	INIT_LIST_HEAD(&sbefifo->xfrs);
+
+	spin_unlock(&sbefifo->lock);
+
 	wake_up_all(&sbefifo->wait);
 
 	misc_deregister(&sbefifo->mdev);
@@ -912,11 +926,6 @@ static int sbefifo_remove(struct device *dev)
 	if (del_timer_sync(&sbefifo->poll_timer))
 		sbefifo_put(sbefifo);
 
-	spin_lock(&sbefifo->lock);
-	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
-		kfree(xfr);
-	spin_unlock(&sbefifo->lock);
-
 	sbefifo_put(sbefifo);
 
 	return 0;
-- 
1.8.3.1
