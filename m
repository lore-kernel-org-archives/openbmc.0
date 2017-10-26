Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNJCk20VWzDr5S
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:15:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QKCvev021704
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:15:25 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dujyvacu1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:15:22 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 16:15:21 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 16:15:18 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QKFI1V53870738; Thu, 26 Oct 2017 20:15:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5837112034;
 Thu, 26 Oct 2017 16:14:48 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 42BA1112040;
 Thu, 26 Oct 2017 16:14:48 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/2] drivers (fsi): sbefifo: Fix xfr deletion
 in lists
Date: Thu, 26 Oct 2017 15:15:12 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17102620-0052-0000-0000-000002780ADB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007956; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936876; UDB=6.00472151; IPR=6.00717139; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017729; XFM=3.00000015;
 UTC=2017-10-26 20:15:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102620-0053-0000-0000-00005270F86D
Message-Id: <1509048913-30936-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710260253
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
X-List-Received-Date: Thu, 26 Oct 2017 20:15:31 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Deleting an element of a list while iterating means that you'll access
recently freed memory when getting the next list element.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index f756822..088172c 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -316,14 +316,15 @@ static void sbefifo_client_release(struct kref *kref)
 {
 	struct sbefifo *sbefifo;
 	struct sbefifo_client *client;
-	struct sbefifo_xfr *xfr;
+	struct sbefifo_xfr *xfr, *tmp;
 
 	client = container_of(kref, struct sbefifo_client, kref);
 	sbefifo = client->dev;
 
 	if (!READ_ONCE(sbefifo->rc)) {
-		list_for_each_entry(xfr, &client->xfrs, client) {
+		list_for_each_entry_safe(xfr, tmp, &client->xfrs, client) {
 			if (test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
+				list_del(&xfr->client);
 				kfree(xfr);
 				continue;
 			}
@@ -376,7 +377,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	static const unsigned long EOT_MASK = 0x000000ff;
 	struct sbefifo *sbefifo = (void *)data;
 	struct sbefifo_buf *rbuf, *wbuf;
-	struct sbefifo_xfr *xfr = NULL;
+	struct sbefifo_xfr *xfr, *tmp;
 	struct sbefifo_buf drain;
 	size_t devn, bufn;
 	int eot = 0;
@@ -491,8 +492,10 @@ static void sbefifo_poll_timer(unsigned long data)
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
 			"Fatal bus access failure: %d\n", ret);
-		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
+		list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
+			list_del(&xfr->xfrs);
 			kfree(xfr);
+		}
 		INIT_LIST_HEAD(&sbefifo->xfrs);
 
 	} else if (eot && sbefifo_next_xfr(sbefifo)) {
@@ -620,8 +623,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 			if (mod_timer(&client->dev->poll_timer, jiffies))
 				sbefifo_put(sbefifo);
 		} else {
-			kfree(xfr);
 			list_del(&xfr->client);
+			kfree(xfr);
 			wake_up_interruptible(&sbefifo->wait);
 		}
 	}
@@ -940,13 +943,15 @@ static int sbefifo_probe(struct device *dev)
 static int sbefifo_remove(struct device *dev)
 {
 	struct sbefifo *sbefifo = dev_get_drvdata(dev);
-	struct sbefifo_xfr *xfr;
+	struct sbefifo_xfr *xfr, *tmp;
 
 	spin_lock(&sbefifo->lock);
 
 	WRITE_ONCE(sbefifo->rc, -ENODEV);
-	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
+	list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
+		list_del(&xfr->xfrs);
 		kfree(xfr);
+	}
 
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
-- 
1.8.3.1
