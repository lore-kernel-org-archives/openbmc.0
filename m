Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0448nNzDqlx
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624pJp105697
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:10 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsap45m8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:10 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:09 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:07 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96267s165142840; Thu, 5 Oct 2017 19:06:07 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA9CC6042;
 Thu,  5 Oct 2017 20:06:06 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 0537BC6037;
 Thu,  5 Oct 2017 20:06:05 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 04/31] drivers: fsi: sbefifo: white space
 fixes
Date: Thu,  5 Oct 2017 21:05:26 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0012-0000-0000-0000151B27EE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0013-0000-0000-00004FC30C9F
Message-Id: <1507255553-13301-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:13 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Fix some spacing issues.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
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
