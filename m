Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xys9h3ln8zDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 08:44:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8LMiKdN064324
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:22 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d4jnk4e2e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:21 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 21 Sep 2017 18:44:05 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Sep 2017 18:44:02 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8LMi2Is51970088; Thu, 21 Sep 2017 22:44:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE6C12803E;
 Thu, 21 Sep 2017 18:43:55 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 250692803F;
 Thu, 21 Sep 2017 18:43:55 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/3] drivers/fsi/sbefifo: refactor to upstream
 list state
Date: Thu, 21 Sep 2017 17:43:56 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092122-0056-0000-0000-000003CD0551
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007775; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920429; UDB=6.00462502; IPR=6.00700651; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017240; XFM=3.00000015;
 UTC=2017-09-21 22:44:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092122-0057-0000-0000-000008040AB9
Message-Id: <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=4
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210305
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
X-List-Received-Date: Thu, 21 Sep 2017 22:44:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Includes various fixes:
 - check for complete while waiting for data in read()
 - fix probe if probe fails
 - general cleanup
 - slightly safer (earlier) get_client()
 - reorder some of the remove() operations for safety

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 329 ++++++++++++++++++++++++--------------------
 include/linux/fsi-sbefifo.h |   6 +-
 2 files changed, 180 insertions(+), 155 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 1c37ff7..5d25ade 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -11,20 +11,27 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/idr.h>
+#include <linux/fs.h>
 #include <linux/fsi.h>
+#include <linux/fsi-sbefifo.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/timer.h>
 #include <linux/uaccess.h>
+#include <linux/wait.h>
 
 /*
  * The SBEFIFO is a pipe-like FSI device for communicating with
@@ -44,14 +51,15 @@
 #define   SBEFIFO_EOT_MAGIC		0xffffffff
 #define SBEFIFO_EOT_ACK		0x14
 
+#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
+
 struct sbefifo {
 	struct timer_list poll_timer;
-	struct fsi_device *fsi_dev;
-	struct miscdevice mdev;
+	struct fsi_device *fsi_dev;	/* parent fsi device */
+	struct miscdevice mdev;		/* /dev/ entry */
 	wait_queue_head_t wait;
-	struct list_head link;
 	struct list_head xfrs;
-	struct kref kref;
+	struct kref kref;		/* reference counter */
 	spinlock_t lock;
 	char name[32];
 	int idx;
@@ -87,14 +95,12 @@ struct sbefifo_client {
 	unsigned long f_flags;
 };
 
-static struct list_head sbefifo_fifos;
-
 static DEFINE_IDA(sbefifo_ida);
 
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
 {
 	int rc;
-	u32 raw_word;
+	__be32 raw_word;
 
 	rc = fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
 			     sizeof(raw_word));
@@ -102,17 +108,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
 		return rc;
 
 	*word = be32_to_cpu(raw_word);
+
 	return 0;
 }
 
 static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
 {
-	u32 raw_word = cpu_to_be32(word);
+	__be32 raw_word = cpu_to_be32(word);
 
 	return fsi_device_write(sbefifo->fsi_dev, reg, &raw_word,
 				sizeof(raw_word));
 }
 
+/* Don't flip endianness of data to/from FIFO, just pass through. */
 static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
 {
 	return fsi_device_read(sbefifo->fsi_dev, SBEFIFO_DWN, word,
@@ -136,7 +144,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
 		return ret;
 
 	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
-			SBEFIFO_EOT_MAGIC);
+			    SBEFIFO_EOT_MAGIC);
 }
 
 static size_t sbefifo_dev_nwreadable(u32 sts)
@@ -210,6 +218,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *buf, size_t n)
 		rpos = buf->buf;
 
 	WRITE_ONCE(buf->rpos, rpos);
+
 	return rpos == wpos;
 }
 
@@ -229,14 +238,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf *buf, size_t n)
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
 
@@ -255,9 +264,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
 
+	if (READ_ONCE(sbefifo->rc))
+		return ERR_PTR(sbefifo->rc);
+
 	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
 	if (!xfr)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	xfr->rbuf = &client->rbuf;
 	xfr->wbuf = &client->wbuf;
@@ -267,21 +279,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	return xfr;
 }
 
-static struct sbefifo_xfr *sbefifo_client_next_xfr(
-		struct sbefifo_client *client)
-{
-	if (list_empty(&client->xfrs))
-		return NULL;
-
-	return container_of(client->xfrs.next, struct sbefifo_xfr,
-			client);
-}
-
 static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
 {
-	struct sbefifo_xfr *xfr;
+	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client);
 
-	xfr = sbefifo_client_next_xfr(client);
 	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
 		return true;
 
@@ -309,10 +312,11 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
 
 static void sbefifo_client_release(struct kref *kref)
 {
-	struct sbefifo_client *client;
 	struct sbefifo_xfr *xfr;
+	struct sbefifo_client *client = container_of(kref,
+						     struct sbefifo_client,
+						     kref);
 
-	client = container_of(kref, struct sbefifo_client, kref);
 	list_for_each_entry(xfr, &client->xfrs, client) {
 		/*
 		 * The client left with pending or running xfrs.
@@ -349,6 +353,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
 			kfree(xfr);
 			continue;
 		}
+
 		return xfr;
 	}
 
@@ -370,7 +375,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	spin_lock(&sbefifo->lock);
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
-			xfrs);
+				       xfrs);
 	if (!xfr)
 		goto out_unlock;
 
@@ -388,8 +393,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Drain the write buffer. */
 	while ((bufn = sbefifo_buf_nbreadable(wbuf))) {
-		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
-				&sts);
+		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
 		if (ret)
 			goto out;
 
@@ -397,7 +401,7 @@ static void sbefifo_poll_timer(unsigned long data)
 		if (devn == 0) {
 			/* No open slot for write.  Reschedule. */
 			sbefifo->poll_timer.expires = jiffies +
-				msecs_to_jiffies(500);
+				SBEFIFO_RESCHEDULE;
 			add_timer(&sbefifo->poll_timer);
 			goto out_unlock;
 		}
@@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Send EOT if the writer is finished. */
 	if (test_and_clear_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags)) {
-		ret = sbefifo_outw(sbefifo,
-				SBEFIFO_UP | SBEFIFO_EOT_RAISE,
-				SBEFIFO_EOT_MAGIC);
+		ret = sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_EOT_RAISE,
+				   SBEFIFO_EOT_MAGIC);
 		if (ret)
 			goto out;
 
@@ -438,7 +441,7 @@ static void sbefifo_poll_timer(unsigned long data)
 		if (devn == 0) {
 			/* No data yet.  Reschedule. */
 			sbefifo->poll_timer.expires = jiffies +
-				msecs_to_jiffies(500);
+				SBEFIFO_RESCHEDULE;
 			add_timer(&sbefifo->poll_timer);
 			goto out_unlock;
 		}
@@ -466,7 +469,7 @@ static void sbefifo_poll_timer(unsigned long data)
 			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
 			list_del(&xfr->xfrs);
 			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
-							&xfr->flags)))
+					      &xfr->flags)))
 				kfree(xfr);
 			break;
 		}
@@ -476,7 +479,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	if (unlikely(ret)) {
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
-				"Fatal bus access failure: %d\n", ret);
+			"Fatal bus access failure: %d\n", ret);
 		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
 			kfree(xfr);
 		INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -497,7 +500,7 @@ static void sbefifo_poll_timer(unsigned long data)
 static int sbefifo_open(struct inode *inode, struct file *file)
 {
 	struct sbefifo *sbefifo = container_of(file->private_data,
-			struct sbefifo, mdev);
+					       struct sbefifo, mdev);
 	struct sbefifo_client *client;
 	int ret;
 
@@ -535,6 +538,19 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static bool sbefifo_read_ready(struct sbefifo *sbefifo,
+			       struct sbefifo_client *client, size_t *n)
+{
+	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client);
+
+	*n = sbefifo_buf_nbreadable(&client->rbuf);
+
+	return READ_ONCE(sbefifo->rc) || *n ||
+		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
+}
+
 static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 				   char __user *ubuf, char *kbuf, size_t len)
 {
@@ -551,30 +567,38 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 
 	sbefifo_get_client(client);
 	if (wait_event_interruptible(sbefifo->wait,
-				(ret = READ_ONCE(sbefifo->rc)) ||
-				(n = sbefifo_buf_nbreadable(
-						&client->rbuf)))) {
-		sbefifo_put_client(client);
-		return -ERESTARTSYS;
+				     sbefifo_read_ready(sbefifo, client,
+							&n))) {
+		ret = -ERESTARTSYS;
+		goto out;
 	}
+
+	ret = READ_ONCE(sbefifo->rc);
 	if (ret) {
 		INIT_LIST_HEAD(&client->xfrs);
-		sbefifo_put_client(client);
-		return ret;
+		goto out;
 	}
 
 	n = min_t(size_t, n, len);
 
 	if (ubuf) {
 		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
-			sbefifo_put_client(client);
-			return -EFAULT;
+			ret = -EFAULT;
+			goto out;
 		}
-	} else
+	} else {
 		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
+	}
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
-		xfr = sbefifo_client_next_xfr(client);
+		xfr = list_first_entry_or_null(&client->xfrs,
+					       struct sbefifo_xfr, client);
+		if (!xfr) {
+			/* should be impossible to not have an xfr here */
+			wake_up(&sbefifo->wait);
+			goto out;
+		}
+
 		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
 			/*
 			 * Fill the read buffer back up.
@@ -589,22 +613,31 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		}
 	}
 
-	sbefifo_put_client(client);
+	ret = n;
 
-	return n;
+out:
+	sbefifo_put_client(client);
+	return ret;
 }
 
-static ssize_t sbefifo_read(struct file *file, char __user *buf,
-		size_t len, loff_t *offset)
+static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
 
-	WARN_ON(*offset);
+	return sbefifo_read_common(client, buf, NULL, len);
+}
 
-	if (!access_ok(VERIFY_WRITE, buf, len))
-		return -EFAULT;
+static bool sbefifo_write_ready(struct sbefifo *sbefifo,
+				struct sbefifo_xfr *xfr,
+				struct sbefifo_client *client, size_t *n)
+{
+	struct sbefifo_xfr *next = list_first_entry_or_null(&client->xfrs,
+							    struct sbefifo_xfr,
+							    client);
 
-	return sbefifo_read_common(client, buf, NULL, len);
+	*n = sbefifo_buf_nbwriteable(&client->wbuf);
+	return READ_ONCE(sbefifo->rc) || (next == xfr && *n);
 }
 
 static ssize_t sbefifo_write_common(struct sbefifo_client *client,
@@ -612,6 +645,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 				    size_t len)
 {
 	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_buf *wbuf = &client->wbuf;
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
@@ -622,24 +656,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	if (!len)
 		return 0;
 
-	n = sbefifo_buf_nbwriteable(&client->wbuf);
+	sbefifo_get_client(client);
+	n = sbefifo_buf_nbwriteable(wbuf);
 
 	spin_lock_irq(&sbefifo->lock);
-	xfr = sbefifo_next_xfr(sbefifo);
 
+	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto out;
 	}
 
-	xfr = sbefifo_enq_xfr(client);
-	if (!xfr) {
+	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
+	if (IS_ERR(xfr)) {
 		spin_unlock_irq(&sbefifo->lock);
-		return -ENOMEM;
+		ret = PTR_ERR(xfr);
+		goto out;
 	}
-	spin_unlock_irq(&sbefifo->lock);
 
-	sbefifo_get_client(client);
+	spin_unlock_irq(&sbefifo->lock);
 
 	/*
 	 * Partial writes are not really allowed in that EOT is sent exactly
@@ -647,49 +683,47 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	 */
 	while (len) {
 		if (wait_event_interruptible(sbefifo->wait,
-				READ_ONCE(sbefifo->rc) ||
-					(sbefifo_client_next_xfr(client) == xfr &&
-					 (n = sbefifo_buf_nbwriteable(
-							&client->wbuf))))) {
+					     sbefifo_write_ready(sbefifo, xfr,
+								 client,
+								 &n))) {
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
 			if (mod_timer(&sbefifo->poll_timer, jiffies))
 				sbefifo_put(sbefifo);
-
-			sbefifo_put_client(client);
-			return -ERESTARTSYS;
+			ret = -ERESTARTSYS;
+			goto out;
 		}
-		if (sbefifo->rc) {
+
+		ret = READ_ONCE(sbefifo->rc);
+		if (ret) {
 			INIT_LIST_HEAD(&client->xfrs);
-			sbefifo_put_client(client);
-			return sbefifo->rc;
+			goto out;
 		}
 
 		n = min_t(size_t, n, len);
 
 		if (ubuf) {
-			if (copy_from_user(READ_ONCE(client->wbuf.wpos), ubuf,
-			    n)) {
+			if (copy_from_user(READ_ONCE(wbuf->wpos), ubuf, n)) {
 				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 				sbefifo_get(sbefifo);
 				if (mod_timer(&sbefifo->poll_timer, jiffies))
 					sbefifo_put(sbefifo);
-				sbefifo_put_client(client);
-				return -EFAULT;
+				ret = -EFAULT;
+				goto out;
 			}
 
 			ubuf += n;
 		} else {
-			memcpy(READ_ONCE(client->wbuf.wpos), kbuf, n);
+			memcpy(READ_ONCE(wbuf->wpos), kbuf, n);
 			kbuf += n;
 		}
 
-		sbefifo_buf_wrotenb(&client->wbuf, n);
+		sbefifo_buf_wrotenb(wbuf, n);
 		len -= n;
 		ret += n;
 
-		/* set flag before starting the worker, as it may run through
-		 * and check the flag before we exit this loop!
+		/* Set this before starting timer to avoid race condition on
+		 * this flag with the timer function writer.
 		 */
 		if (!len)
 			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
@@ -702,21 +736,16 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			sbefifo_put(sbefifo);
 	}
 
+out:
 	sbefifo_put_client(client);
-
 	return ret;
 }
 
 static ssize_t sbefifo_write(struct file *file, const char __user *buf,
-		size_t len, loff_t *offset)
+			     size_t len, loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
 
-	WARN_ON(*offset);
-
-	if (!access_ok(VERIFY_READ, buf, len))
-		return -EFAULT;
-
 	return sbefifo_write_common(client, buf, NULL, len);
 }
 
@@ -742,18 +771,15 @@ static int sbefifo_release(struct inode *inode, struct file *file)
 struct sbefifo_client *sbefifo_drv_open(struct device *dev,
 					unsigned long flags)
 {
-	struct sbefifo_client *client = NULL;
-	struct sbefifo *sbefifo;
-	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct sbefifo_client *client;
+	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 
-	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
-		if (sbefifo->fsi_dev != fsi_dev)
-			continue;
+	if (!sbefifo)
+		return NULL;
 
-		client = sbefifo_new_client(sbefifo);
-		if (client)
-			client->f_flags = flags;
-	}
+	client = sbefifo_new_client(sbefifo);
+	if (client)
+		client->f_flags = flags;
 
 	return client;
 }
@@ -802,95 +828,92 @@ static int sbefifo_probe(struct device *dev)
 	u32 sts;
 	int ret, child_idx = 0;
 
-	dev_dbg(dev, "Found sbefifo device\n");
 	sbefifo = kzalloc(sizeof(*sbefifo), GFP_KERNEL);
 	if (!sbefifo)
 		return -ENOMEM;
 
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
+		dev_err(dev, "found data in downstream fifo\n");
 		return -EIO;
 	}
 
-	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
-	sbefifo->mdev.fops = &sbefifo_fops;
-	sbefifo->mdev.name = sbefifo->name;
-	sbefifo->mdev.parent = dev;
 	spin_lock_init(&sbefifo->lock);
 	kref_init(&sbefifo->kref);
+	init_waitqueue_head(&sbefifo->wait);
+	INIT_LIST_HEAD(&sbefifo->xfrs);
 
 	sbefifo->idx = ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERNEL);
 	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
-			sbefifo->idx);
-	init_waitqueue_head(&sbefifo->wait);
-	INIT_LIST_HEAD(&sbefifo->xfrs);
+		 sbefifo->idx);
 
 	/* This bit of silicon doesn't offer any interrupts... */
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
-			(unsigned long)sbefifo);
-
-	if (dev->of_node) {
-		/* create platform devs for dts child nodes (occ, etc) */
-		for_each_child_of_node(dev->of_node, np) {
-			snprintf(child_name, sizeof(child_name), "%s-dev%d",
-				 sbefifo->name, child_idx++);
-			child = of_platform_device_create(np, child_name, dev);
-			if (!child)
-				dev_warn(&sbefifo->fsi_dev->dev,
-					 "failed to create child node dev\n");
-		}
+		    (unsigned long)sbefifo);
+
+	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
+	sbefifo->mdev.fops = &sbefifo_fops;
+	sbefifo->mdev.name = sbefifo->name;
+	sbefifo->mdev.parent = dev;
+	ret = misc_register(&sbefifo->mdev);
+	if (ret) {
+		dev_err(dev, "failed to register miscdevice: %d\n", ret);
+		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
+		sbefifo_put(sbefifo);
+		return ret;
+	}
+
+	/* create platform devs for dts child nodes (occ, etc) */
+	for_each_available_child_of_node(dev->of_node, np) {
+		snprintf(child_name, sizeof(child_name), "%s-dev%d",
+			 sbefifo->name, child_idx++);
+		child = of_platform_device_create(np, child_name, dev);
+		if (!child)
+			dev_warn(dev, "failed to create child %s dev\n",
+				 child_name);
 	}
 
-	list_add(&sbefifo->link, &sbefifo_fifos);
-	
-	return misc_register(&sbefifo->mdev);
+	dev_set_drvdata(dev, sbefifo);
+
+	return 0;
 }
 
 static int sbefifo_remove(struct device *dev)
 {
-	struct fsi_device *fsi_dev = to_fsi_dev(dev);
-	struct sbefifo *sbefifo, *sbefifo_tmp;
+	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 	struct sbefifo_xfr *xfr;
 
-	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
-		if (sbefifo->fsi_dev != fsi_dev)
-			continue;
-
-		device_for_each_child(dev, NULL, sbefifo_unregister_child);
+	WRITE_ONCE(sbefifo->rc, -ENODEV);
+	wake_up(&sbefifo->wait);
 
-		misc_deregister(&sbefifo->mdev);
-		list_del(&sbefifo->link);
-		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
+	misc_deregister(&sbefifo->mdev);
+	device_for_each_child(dev, NULL, sbefifo_unregister_child);
 
-		if (del_timer_sync(&sbefifo->poll_timer))
-			sbefifo_put(sbefifo);
+	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
-		spin_lock(&sbefifo->lock);
-		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
-			kfree(xfr);
-		spin_unlock(&sbefifo->lock);
+	if (del_timer_sync(&sbefifo->poll_timer))
+		sbefifo_put(sbefifo);
 
-		WRITE_ONCE(sbefifo->rc, -ENODEV);
+	spin_lock(&sbefifo->lock);
+	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
+		kfree(xfr);
+	spin_unlock(&sbefifo->lock);
 
-		wake_up(&sbefifo->wait);
-		sbefifo_put(sbefifo);
-	}
+	sbefifo_put(sbefifo);
 
 	return 0;
 }
@@ -915,17 +938,19 @@ static int sbefifo_remove(struct device *dev)
 
 static int sbefifo_init(void)
 {
-	INIT_LIST_HEAD(&sbefifo_fifos);
 	return fsi_driver_register(&sbefifo_drv);
 }
 
 static void sbefifo_exit(void)
 {
 	fsi_driver_unregister(&sbefifo_drv);
+
+	ida_destroy(&sbefifo_ida);
 }
 
 module_init(sbefifo_init);
 module_exit(sbefifo_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Brad Bishop <bradleyb@fuzziesquirrel.com>");
-MODULE_DESCRIPTION("Linux device interface to the POWER self boot engine");
+MODULE_AUTHOR("Eddie James <eajames@linux.vnet.ibm.com>");
+MODULE_DESCRIPTION("Linux device interface to the POWER Self Boot Engine");
diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
index 1b46c63..8e55891 100644
--- a/include/linux/fsi-sbefifo.h
+++ b/include/linux/fsi-sbefifo.h
@@ -13,8 +13,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __FSI_SBEFIFO_H__
-#define __FSI_SBEFIFO_H__
+#ifndef LINUX_FSI_SBEFIFO_H
+#define LINUX_FSI_SBEFIFO_H
 
 struct device;
 struct sbefifo_client;
@@ -27,4 +27,4 @@ extern int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
 			     size_t len);
 extern void sbefifo_drv_release(struct sbefifo_client *client);
 
-#endif /* __FSI_SBEFIFO_H__ */
+#endif /* LINUX_FSI_SBEFIFO_H */
-- 
1.8.3.1
