Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N4k5fy4zDrFZ
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:38 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNkPk071666
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:36 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddqw6t20y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:35 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:35 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:32 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOWn765601604; Thu, 5 Oct 2017 12:24:32 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AB24136043;
 Thu,  5 Oct 2017 13:24:32 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 07CB413603A;
 Thu,  5 Oct 2017 13:24:31 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 04/31] drivers: fsi: sbefifo: white space
 fixes
Date: Thu,  5 Oct 2017 14:23:57 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0008-0000-0000-000008AB72DE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0009-0000-0000-0000443E92F6
Message-Id: <1507231464-13635-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
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
X-List-Received-Date: Thu, 05 Oct 2017 19:24:40 -0000
X-List-Received-Date: Thu, 05 Oct 2017 19:24:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Fix some spacing issues.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 66 ++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index c5eeace..561a7f6 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -147,7 +147,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
 		return ret;
 
 	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
-			SBEFIFO_EOT_MAGIC);
+			    SBEFIFO_EOT_MAGIC);
 }
 
 static size_t sbefifo_dev_nwreadable(u32 sts)
@@ -221,6 +221,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *buf, size_t n)
 		rpos = buf->buf;
 
 	WRITE_ONCE(buf->rpos, rpos);
+
 	return rpos == wpos;
 }
 
@@ -240,14 +241,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf *buf, size_t n)
 		set_bit(SBEFIFO_BUF_FULL, &buf->flags);
 
 	WRITE_ONCE(buf->wpos, wpos);
+
 	return rpos == wpos;
 }
 
 static void sbefifo_free(struct kref *kref)
 {
-	struct sbefifo *sbefifo;
+	struct sbefifo *sbefifo = container_of(kref, struct sbefifo, kref);
 
-	sbefifo = container_of(kref, struct sbefifo, kref);
 	kfree(sbefifo);
 }
 
@@ -284,8 +285,7 @@ static struct sbefifo_xfr *sbefifo_client_next_xfr(
 	if (list_empty(&client->xfrs))
 		return NULL;
 
-	return container_of(client->xfrs.next, struct sbefifo_xfr,
-			client);
+	return container_of(client->xfrs.next, struct sbefifo_xfr, client);
 }
 
 static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
@@ -360,6 +360,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
 			kfree(xfr);
 			continue;
 		}
+
 		return xfr;
 	}
 
@@ -381,7 +382,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	spin_lock(&sbefifo->lock);
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
-			xfrs);
+				       xfrs);
 	if (!xfr)
 		goto out_unlock;
 
@@ -399,8 +400,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Drain the write buffer. */
 	while ((bufn = sbefifo_buf_nbreadable(wbuf))) {
-		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
-				&sts);
+		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
 		if (ret)
 			goto out;
 
@@ -425,9 +425,8 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Send EOT if the writer is finished. */
 	if (test_and_clear_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags)) {
-		ret = sbefifo_outw(sbefifo,
-				SBEFIFO_UP | SBEFIFO_EOT_RAISE,
-				SBEFIFO_EOT_MAGIC);
+		ret = sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_EOT_RAISE,
+				   SBEFIFO_EOT_MAGIC);
 		if (ret)
 			goto out;
 
@@ -477,7 +476,7 @@ static void sbefifo_poll_timer(unsigned long data)
 			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
 			list_del(&xfr->xfrs);
 			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
-							&xfr->flags)))
+					      &xfr->flags)))
 				kfree(xfr);
 			break;
 		}
@@ -487,7 +486,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	if (unlikely(ret)) {
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
-				"Fatal bus access failure: %d\n", ret);
+			"Fatal bus access failure: %d\n", ret);
 		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
 			kfree(xfr);
 		INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -508,7 +507,7 @@ static void sbefifo_poll_timer(unsigned long data)
 static int sbefifo_open(struct inode *inode, struct file *file)
 {
 	struct sbefifo *sbefifo = container_of(file->private_data,
-			struct sbefifo, mdev);
+					       struct sbefifo, mdev);
 	struct sbefifo_client *client;
 	int ret;
 
@@ -562,12 +561,13 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 
 	sbefifo_get_client(client);
 	if (wait_event_interruptible(sbefifo->wait,
-				(ret = READ_ONCE(sbefifo->rc)) ||
-				(n = sbefifo_buf_nbreadable(
-						&client->rbuf)))) {
+				     (ret = READ_ONCE(sbefifo->rc)) ||
+				     (n = sbefifo_buf_nbreadable(
+					&client->rbuf)))) {
 		sbefifo_put_client(client);
 		return -ERESTARTSYS;
 	}
+
 	if (ret) {
 		INIT_LIST_HEAD(&client->xfrs);
 		sbefifo_put_client(client);
@@ -581,8 +581,9 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 			sbefifo_put_client(client);
 			return -EFAULT;
 		}
-	} else
+	} else {
 		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
+	}
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
 		xfr = sbefifo_client_next_xfr(client);
@@ -605,8 +606,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 	return n;
 }
 
-static ssize_t sbefifo_read(struct file *file, char __user *buf,
-		size_t len, loff_t *offset)
+static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
 
@@ -648,6 +649,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 		spin_unlock_irq(&sbefifo->lock);
 		return -ENOMEM;
 	}
+
 	spin_unlock_irq(&sbefifo->lock);
 
 	sbefifo_get_client(client);
@@ -659,8 +661,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	while (len) {
 		if (wait_event_interruptible(sbefifo->wait,
 				READ_ONCE(sbefifo->rc) ||
-					(sbefifo_client_next_xfr(client) == xfr &&
-					 (n = sbefifo_buf_nbwriteable(
+				(sbefifo_client_next_xfr(client) == xfr &&
+				 (n = sbefifo_buf_nbwriteable(
 							&client->wbuf))))) {
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
@@ -670,6 +672,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			sbefifo_put_client(client);
 			return -ERESTARTSYS;
 		}
+
 		if (sbefifo->rc) {
 			INIT_LIST_HEAD(&client->xfrs);
 			sbefifo_put_client(client);
@@ -719,7 +722,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 }
 
 static ssize_t sbefifo_write(struct file *file, const char __user *buf,
-		size_t len, loff_t *offset)
+			     size_t len, loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
 
@@ -820,22 +823,21 @@ static int sbefifo_probe(struct device *dev)
 
 	sbefifo->fsi_dev = fsi_dev;
 
-	ret = sbefifo_inw(sbefifo,
-			SBEFIFO_UP | SBEFIFO_STS, &sts);
+	ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
 	if (ret)
 		return ret;
+
 	if (!(sts & SBEFIFO_EMPTY)) {
-		dev_err(&sbefifo->fsi_dev->dev,
-				"Found data in upstream fifo\n");
+		dev_err(dev, "Found data in upstream fifo\n");
 		return -EIO;
 	}
 
 	ret = sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &sts);
 	if (ret)
 		return ret;
+
 	if (!(sts & SBEFIFO_EMPTY)) {
-		dev_err(&sbefifo->fsi_dev->dev,
-				"Found data in downstream fifo\n");
+		dev_err(dev, "Found data in downstream fifo\n");
 		return -EIO;
 	}
 
@@ -848,13 +850,13 @@ static int sbefifo_probe(struct device *dev)
 
 	sbefifo->idx = ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERNEL);
 	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
-			sbefifo->idx);
+		 sbefifo->idx);
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
 	/* This bit of silicon doesn't offer any interrupts... */
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
-			(unsigned long)sbefifo);
+		    (unsigned long)sbefifo);
 
 	if (dev->of_node) {
 		/* create platform devs for dts child nodes (occ, etc) */
@@ -863,7 +865,7 @@ static int sbefifo_probe(struct device *dev)
 				 sbefifo->name, child_idx++);
 			child = of_platform_device_create(np, child_name, dev);
 			if (!child)
-				dev_warn(&sbefifo->fsi_dev->dev,
+				dev_warn(dev,
 					 "failed to create child node dev\n");
 		}
 	}
-- 
1.8.3.1
