Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3mkT1NhqzDqhX
 for <openbmc@lists.ozlabs.org>; Sat, 30 Sep 2017 08:41:20 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8TMdUeT115223
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:18 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d9xgm9g2g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:18 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 29 Sep 2017 16:41:17 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Sep 2017 16:41:15 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8TMfEUp7602432; Fri, 29 Sep 2017 15:41:14 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 991B96A03B;
 Fri, 29 Sep 2017 16:41:14 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.183.77])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id C44836A045;
 Fri, 29 Sep 2017 16:41:13 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/9] drivers: fsi: SBEFIFO: General clean-up
Date: Fri, 29 Sep 2017 17:41:00 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092922-0016-0000-0000-00000796D385
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007813; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00924260; UDB=6.00464728; IPR=6.00704398; 
 BA=6.00005613; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017330; XFM=3.00000015;
 UTC=2017-09-29 22:41:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092922-0017-0000-0000-00003BAB18F0
Message-Id: <1506724868-13010-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709290322
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
X-List-Received-Date: Fri, 29 Sep 2017 22:41:22 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Correct formatting and improve the flow a bit. Remove warnings for
offset in read/write functions, and remove the user pointer verification
since the copy_from/to_user will do that anyway. Correct the include
guards in the header file.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 207 +++++++++++++++++++++++++-------------------
 include/linux/fsi-sbefifo.h |   6 +-
 2 files changed, 119 insertions(+), 94 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 1c37ff7..a4cd353 100644
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
@@ -44,6 +51,8 @@
 #define   SBEFIFO_EOT_MAGIC		0xffffffff
 #define SBEFIFO_EOT_ACK		0x14
 
+#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
+
 struct sbefifo {
 	struct timer_list poll_timer;
 	struct fsi_device *fsi_dev;
@@ -94,7 +103,7 @@ struct sbefifo_client {
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
 {
 	int rc;
-	u32 raw_word;
+	__be32 raw_word;
 
 	rc = fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
 			     sizeof(raw_word));
@@ -102,17 +111,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
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
@@ -136,7 +147,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
 		return ret;
 
 	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
-			SBEFIFO_EOT_MAGIC);
+			    SBEFIFO_EOT_MAGIC);
 }
 
 static size_t sbefifo_dev_nwreadable(u32 sts)
@@ -210,6 +221,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *buf, size_t n)
 		rpos = buf->buf;
 
 	WRITE_ONCE(buf->rpos, rpos);
+
 	return rpos == wpos;
 }
 
@@ -229,14 +241,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf *buf, size_t n)
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
 
@@ -349,6 +352,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
 			kfree(xfr);
 			continue;
 		}
+
 		return xfr;
 	}
 
@@ -370,7 +374,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	spin_lock(&sbefifo->lock);
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
-			xfrs);
+				       xfrs);
 	if (!xfr)
 		goto out_unlock;
 
@@ -388,8 +392,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Drain the write buffer. */
 	while ((bufn = sbefifo_buf_nbreadable(wbuf))) {
-		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
-				&sts);
+		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
 		if (ret)
 			goto out;
 
@@ -397,7 +400,7 @@ static void sbefifo_poll_timer(unsigned long data)
 		if (devn == 0) {
 			/* No open slot for write.  Reschedule. */
 			sbefifo->poll_timer.expires = jiffies +
-				msecs_to_jiffies(500);
+				SBEFIFO_RESCHEDULE;
 			add_timer(&sbefifo->poll_timer);
 			goto out_unlock;
 		}
@@ -414,9 +417,8 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	 /* Send EOT if the writer is finished. */
 	if (test_and_clear_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags)) {
-		ret = sbefifo_outw(sbefifo,
-				SBEFIFO_UP | SBEFIFO_EOT_RAISE,
-				SBEFIFO_EOT_MAGIC);
+		ret = sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_EOT_RAISE,
+				   SBEFIFO_EOT_MAGIC);
 		if (ret)
 			goto out;
 
@@ -438,7 +440,7 @@ static void sbefifo_poll_timer(unsigned long data)
 		if (devn == 0) {
 			/* No data yet.  Reschedule. */
 			sbefifo->poll_timer.expires = jiffies +
-				msecs_to_jiffies(500);
+				SBEFIFO_RESCHEDULE;
 			add_timer(&sbefifo->poll_timer);
 			goto out_unlock;
 		}
@@ -466,7 +468,7 @@ static void sbefifo_poll_timer(unsigned long data)
 			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
 			list_del(&xfr->xfrs);
 			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
-							&xfr->flags)))
+					      &xfr->flags)))
 				kfree(xfr);
 			break;
 		}
@@ -476,7 +478,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	if (unlikely(ret)) {
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
-				"Fatal bus access failure: %d\n", ret);
+			"Fatal bus access failure: %d\n", ret);
 		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
 			kfree(xfr);
 		INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -497,7 +499,7 @@ static void sbefifo_poll_timer(unsigned long data)
 static int sbefifo_open(struct inode *inode, struct file *file)
 {
 	struct sbefifo *sbefifo = container_of(file->private_data,
-			struct sbefifo, mdev);
+					       struct sbefifo, mdev);
 	struct sbefifo_client *client;
 	int ret;
 
@@ -535,6 +537,16 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static bool sbefifo_read_ready(struct sbefifo *sbefifo,
+			       struct sbefifo_client *client, size_t *n,
+			       size_t *ret)
+{
+	*n = sbefifo_buf_nbreadable(&client->rbuf);
+	*ret = READ_ONCE(sbefifo->rc);
+
+	return *ret || *n;
+}
+
 static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 				   char __user *ubuf, char *kbuf, size_t len)
 {
@@ -551,30 +563,37 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 
 	sbefifo_get_client(client);
 	if (wait_event_interruptible(sbefifo->wait,
-				(ret = READ_ONCE(sbefifo->rc)) ||
-				(n = sbefifo_buf_nbreadable(
-						&client->rbuf)))) {
-		sbefifo_put_client(client);
-		return -ERESTARTSYS;
+				     sbefifo_read_ready(sbefifo, client,
+							&n, &ret))) {
+		ret = -ERESTARTSYS;
+		goto out;
 	}
+
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
+			WARN_ONCE(1, "no xfr in queue");
+			goto out;
+		}
+
 		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
 			/*
 			 * Fill the read buffer back up.
@@ -589,22 +608,31 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
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
@@ -612,6 +640,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 				    size_t len)
 {
 	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_buf *wbuf = &client->wbuf;
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
@@ -622,24 +651,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
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
+	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
 	if (!xfr) {
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
@@ -647,49 +678,47 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
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
+
 		if (sbefifo->rc) {
 			INIT_LIST_HEAD(&client->xfrs);
-			sbefifo_put_client(client);
-			return sbefifo->rc;
+			ret = sbefifo->rc;
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
@@ -702,21 +731,16 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
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
 
@@ -802,29 +826,27 @@ static int sbefifo_probe(struct device *dev)
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
 
@@ -837,13 +859,13 @@ static int sbefifo_probe(struct device *dev)
 
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
@@ -852,7 +874,7 @@ static int sbefifo_probe(struct device *dev)
 				 sbefifo->name, child_idx++);
 			child = of_platform_device_create(np, child_name, dev);
 			if (!child)
-				dev_warn(&sbefifo->fsi_dev->dev,
+				dev_warn(dev,
 					 "failed to create child node dev\n");
 		}
 	}
@@ -922,10 +944,13 @@ static int sbefifo_init(void)
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
