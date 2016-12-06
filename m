Return-Path: <eajames.ibm@gmail.com>
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYGtz4G0fzDsxq
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 09:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hAbiY1db"; 
 dkim-atps=neutral
Received: by mail-io0-x241.google.com with SMTP id r94so9654785ioe.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=kirDc5I9UsGu3NfzGZYk9xBYId/jRZ4Ri87YFPhF5NY=;
 b=hAbiY1dbgYnDTEeTVn/sThP0zkyvHZNuOZfZ6tc0u9K5S94GMxbMYifiKLCl/GmhFk
 EbtLU4/OP+Nncj22K+sLrHjDxf1SULp8/letzuaf4GhWPpNbzr5C20Su01VGrPKflsms
 wo5R3ACyo5ODQXq4MqPM0ZVHPCv8SGLRaDGf5OVMonmOuZRltq/SrQy414ENB+5SW7Af
 IHkvC/MD82O19cw4q0ncrlyMHElXc06EZs2J/dt/qLhIatvAId70ufdpDQx5xzGWS4j4
 zOBbQ6bam3hZ6xLDFG9tAQ2hTfkBFjAV31PPlrOO6N0MdtkeG7vtjGhb7jOx3XJ0Ge/Z
 crGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kirDc5I9UsGu3NfzGZYk9xBYId/jRZ4Ri87YFPhF5NY=;
 b=gnaHt4tZynUeXlsA0W7O7LHjVpPhhwMsD3AuFkf0T9ymcKF/GcZlTnlYnWqG6LivHT
 EmefL0bpPWZF6EGD1C9/sHeMhcFEDFgljJ+43eA5YFugN8/401OXkaiD5jOepV4aA+ab
 99HwM7t3JtGC1r9TkvPHAhGBEMOaGf9hilvICXMv/oRH4tea2QYkHb8/dKohNZv/4W7G
 UcKKKPnW+MteV4x5Wq1MbfvCmPXvljaPcUEQEpkMlTtc83VuVSG3XGZqn/AvgiGmQoFp
 xPvWVFvu0PYdFYK7tmaDbvXHsdY5HMW3M/9wEtKJwhnvmewWnBKfWkCh2uyyb7kn9QvN
 7b6g==
X-Gm-Message-State: AKaTC03dEHpF/0nj9wOkw6e3rzej2IlMCKWBt2YjzCjGtZSDzml8I1IfIVbz/x6U5z0pxg==
X-Received: by 10.107.129.34 with SMTP id c34mr56505890iod.31.1481064361479;
 Tue, 06 Dec 2016 14:46:01 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.50])
 by smtp.gmail.com with ESMTPSA id n3sm2262710itb.2.2016.12.06.14.46.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 06 Dec 2016 14:46:00 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux 2/2] drivers: fsi: sbe: Add submit ioctl function
Date: Tue,  6 Dec 2016 16:45:52 -0600
Message-Id: <1481064352-20867-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 22:46:04 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The "submit" function is the primary interface to the SBE engine. The
driver provides this interface so users can submit generic requests and
receive generic replies. The driver has no scope regarding whether these
operations are reads or writes or some other operation.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbe.c        | 362 +++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/fsi-sbe.h |  13 ++
 2 files changed, 375 insertions(+)

diff --git a/drivers/fsi/fsi-sbe.c b/drivers/fsi/fsi-sbe.c
index 8a4f29a..6d89359 100644
--- a/drivers/fsi/fsi-sbe.c
+++ b/drivers/fsi/fsi-sbe.c
@@ -28,6 +28,7 @@ struct sbe_device {
 };
 
 #define to_sbe_dev(x)		container_of((x), struct sbe_device, mdev)
+#define sbe_to_dev(x)		(x)->mdev.this_device
 
 static struct list_head sbe_devices;
 static atomic_t sbe_idx = ATOMIC_INIT(0);
@@ -48,6 +49,14 @@ enum SBE_ENGINE {
 	SBE_DOWNSTREAM_MAX_TRANSFER_COUNT
 };
 
+#define SBE_FIFO_EMPTY		0x00100000
+#define SBE_FIFO_FULL		0x00200000
+#define SBE_ENTRY0_VALID	0x00008000
+#define SBE_EOT 		0x00000080   /* This is EOT flag for entry 1 */
+
+#define SBE_WAIT_EOT_SET	0x1
+#define SBE_WAIT_DATA_AVAIL	0x2
+
 static ssize_t sbe_read(struct file *filep, char __user *buf, size_t len,
 			loff_t *offset)
 {
@@ -90,6 +99,356 @@ done:
 	return rc ? rc : len;
 }
 
+static int check_fifos_empty(struct sbe_device *sbe)
+{
+	int rc;
+	unsigned long status = 0;
+
+	rc = fsi_device_read(sbe->fsi_dev, SBE_UPSTREAM_STATUS, &status,
+			     sizeof(unsigned long));
+	if (rc)
+		return rc;
+
+	if (!(status & SBE_FIFO_EMPTY)) {
+		dev_dbg(sbe_to_dev(sbe), "upstream fifo not empty\n");
+		return -EAGAIN;
+	}
+
+	rc = fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_STATUS, &status,
+			     sizeof(unsigned long));
+	if (rc)
+		return rc;
+
+	if (!(status & SBE_FIFO_EMPTY)) {
+		dev_dbg(sbe_to_dev(sbe), "downstream fifo not empty\n");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static int write_max_message_len(struct sbe_device *sbe, size_t wordcount)
+{
+	unsigned long value = wordcount + 1;
+
+	return fsi_device_write(sbe->fsi_dev,
+				SBE_DOWNSTREAM_MAX_TRANSFER_COUNT, &value,
+				sizeof(unsigned long));
+}
+
+static int read_max_message_len(struct sbe_device *sbe,
+				unsigned long *wordcount)
+{
+	return fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_MAX_TRANSFER_COUNT,
+			       wordcount, sizeof(unsigned long));
+}
+
+static int wait_free_space_upstream(struct sbe_device *sbe,
+				    unsigned long timeout,
+				    unsigned long *time_spent)
+{
+	int rc;
+	const int sleeptime = 2;
+	int no_free_slot = 1;
+	int i = 0;
+	unsigned long status = 0;
+
+	while (no_free_slot && (i * sleeptime) < timeout) {
+		rc = fsi_device_read(sbe->fsi_dev, SBE_UPSTREAM_STATUS,
+				     &status, sizeof(unsigned long));
+		if (rc)
+			return rc;
+
+		if (status & SBE_FIFO_FULL) {
+			++i;
+
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(msecs_to_jiffies(sleeptime));
+		}
+		else
+			no_free_slot = 0;
+	}
+
+	*time_spent = sleeptime * i;
+
+	if (no_free_slot) {
+		dev_dbg(sbe_to_dev(sbe), "timeout no free fifo upstream\n");
+		return -ETIME;
+	}
+
+	return 0;
+}
+
+static int write_data_upstream(struct sbe_device *sbe, unsigned long *request,
+			       size_t wordcount, unsigned long timeout)
+{
+	int rc;
+	unsigned int offset;
+	unsigned long time_spent = 0;
+
+	/* TODO: optimize for newer fsi write which isn't 4 bytes only ? */
+	for (offset = 0; offset < wordcount; ++offset) {
+		rc = wait_free_space_upstream(sbe, timeout, &time_spent);
+		if (rc)
+			return rc;
+		else
+			timeout -= time_spent;
+
+		rc = fsi_device_write(sbe->fsi_dev, SBE_UPSTREAM_FIFO,
+				      request + offset, sizeof(unsigned long));
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int set_eot_flag_upstream(struct sbe_device *sbe, unsigned long timeout)
+{
+	int rc;
+	unsigned long time_spent = 0;
+	unsigned long value = 0xFFFFFFFF;
+
+	rc = wait_free_space_upstream(sbe, timeout, &time_spent);
+	if (rc)
+		return rc;
+
+	return fsi_device_write(sbe->fsi_dev, SBE_UPSTREAM_EOT, &value,
+				sizeof(unsigned long));
+}
+
+static int wait_data_downstream_or_eot(struct sbe_device *sbe,
+				       unsigned long timeout,
+				       unsigned long *time_spent)
+{
+	int rc;
+	int no_data_in_fifo = 1;
+	int eot = 0;
+	const int sleeptime = 2;
+	const int initial_polls = 10;
+	int i = 0, i_start = 0;
+	unsigned long status = 0;
+
+	while (no_data_in_fifo && (i * sleeptime) < timeout && !eot) {
+		rc = fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_STATUS,
+				     &status, sizeof(unsigned long));
+		if (rc)
+			return rc;
+
+		if (status & SBE_FIFO_EMPTY || !(status & SBE_ENTRY0_VALID)) {
+			if (i_start > initial_polls) {
+				++i;
+
+				set_current_state(TASK_INTERRUPTIBLE);
+				schedule_timeout(msecs_to_jiffies(sleeptime));
+			}
+			else {
+				++i_start;
+				udelay(2);
+			}
+		}
+		else
+			no_data_in_fifo = 0;
+
+		if (status & SBE_EOT)
+			eot = 1;
+	}
+
+	*time_spent = sleeptime * i;
+
+	if (eot)
+		return SBE_WAIT_EOT_SET;
+	if (no_data_in_fifo) {
+		dev_dbg(sbe_to_dev(sbe), "timeout no data downstream\n");
+		return -ETIME;
+	}
+
+	return SBE_WAIT_DATA_AVAIL;
+}
+
+static int read_until_eot(struct sbe_device *sbe, unsigned long *reply,
+			  size_t wordcount, unsigned long timeout)
+{
+	int rc;
+	int no_eot = 1;
+	int wc = 0;
+	unsigned long time_spent = 0;
+	unsigned long status = 0;
+	unsigned long dummy, value = 0xFFFFFFFF;
+	unsigned long remaining;
+
+	while (no_eot && wc < wordcount) {
+		rc = wait_data_downstream_or_eot(sbe, timeout, &time_spent);
+		if (rc > 0)
+			timeout -= time_spent;
+		else
+			return rc;
+
+		if (rc != SBE_WAIT_EOT_SET) {
+			rc = fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_FIFO,
+					     reply + wc,
+					     sizeof(unsigned long));
+			if (rc)
+				return rc;
+			++wc;
+		}
+
+		rc = fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_STATUS,
+				     &status, sizeof(unsigned long));
+		if (rc)
+			return rc;
+
+		if (status & SBE_EOT) {
+			no_eot = 0;
+			fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_FIFO,
+					&dummy, sizeof(unsigned long));
+			fsi_device_write(sbe->fsi_dev, SBE_DOWNSTREAM_ACK_EOT,
+					 &value, sizeof(unsigned long));
+		}
+	}
+
+	rc = read_max_message_len(sbe, &remaining);
+
+	return wc;
+}
+
+static void timediff(struct timeval *before, struct timeval *after,
+		     struct timeval *diff) {
+	diff->tv_sec = after->tv_sec - before->tv_sec;
+
+	if (after->tv_usec < before->tv_usec) {
+		diff->tv_sec--;
+		diff->tv_usec = 1000000 - before->tv_usec + after->tv_usec;
+	}
+	else
+		diff->tv_usec = after->tv_usec - before->tv_usec;
+}
+
+static int sbe_submit(struct sbe_device *sbe, unsigned long data)
+{
+	int rc, rc2;
+	struct sbe_ioctl_submit *userspace = (struct sbe_ioctl_submit *)data;
+	struct sbe_ioctl_submit submit;
+	unsigned long *request = NULL;
+	unsigned long *reply = NULL;
+	unsigned long time_spent;
+	unsigned long diff_msec;
+	struct timeval start, end, diff;
+
+	rc = copy_from_user(&submit, (void *)data,
+			    sizeof(struct sbe_ioctl_submit));
+	if (rc) {
+		dev_dbg(sbe_to_dev(sbe), "failed copy from user:%p rc:%d\n",
+			(void *)data, rc);
+		goto done;
+	}
+
+	request = kmalloc(submit.request.wordcount * 4, GFP_KERNEL);
+	if (!request) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	reply = kmalloc(submit.reply.wordcount * 4, GFP_KERNEL);
+	if (!reply) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = copy_from_user(request, submit.request.data,
+			    submit.request.wordcount * 4);
+	if (rc) {
+		dev_dbg(sbe_to_dev(sbe),
+			"failed copy request from user:%p rc:%d\n",
+			submit.request.data, rc);
+		goto done;
+	}
+
+	do_gettimeofday(&start);
+
+	/* 1. Ensure both fifos are empty */
+	rc = check_fifos_empty(sbe);
+	if (rc)
+		goto done;
+
+	/* 2. Setup register to indicate max size of reply buffer */
+	rc = write_max_message_len(sbe, submit.reply.wordcount);
+	if (rc)
+		goto done;
+
+	/* 3. Write data to the upstream fifo */
+	rc = write_data_upstream(sbe, request, submit.request.wordcount,
+				 submit.timeout_in_msecs);
+	if (rc)
+		goto done;
+
+	/* 4. Set the EOT flag in the upstream fifo */
+	rc = set_eot_flag_upstream(sbe, submit.timeout_in_msecs);
+	if (rc)
+		goto done;
+
+	/* check the time elapsed so far and change timeout accordingly */
+	do_gettimeofday(&end);
+	timediff(&start, &end, &diff);
+	diff_msec = (diff.tv_sec * 1000) + (diff.tv_usec / 1000);
+	if (diff_msec < submit.timeout_in_msecs)
+		submit.timeout_in_msecs -= diff_msec;
+	else {
+		dev_dbg(sbe_to_dev(sbe), "timeout submit upstream msecs:%d\n",
+			diff_msec);
+		rc = -ETIME;
+		goto done;
+	}
+
+	/* 5. Wait for data to come back in the downstream fifo */
+	rc = wait_data_downstream_or_eot(sbe, submit.timeout_in_msecs,
+					 &time_spent);
+	if (rc < 0)
+		goto done;
+
+	/* subtract the timeout again */
+	submit.timeout_in_msecs -= time_spent;
+
+	/* 6. Read data from the downstream fifo until EOT flag found */
+	rc = read_until_eot(sbe, reply, submit.reply.wordcount,
+			    submit.timeout_in_msecs);
+	if (rc < 0)
+		goto done;
+
+	submit.reply.wordcount = rc;
+
+	/* copy data back to user */
+	rc = copy_to_user(submit.reply.data, reply, rc * 4);
+	if (rc)
+		dev_dbg(sbe_to_dev(sbe), "failed copy reply to usr:%p rc:%d\n",
+			submit.reply.data, rc);
+	rc = copy_to_user(&userspace->reply.wordcount,
+			  &submit.reply.wordcount, sizeof(size_t));
+	if (rc)
+		dev_dbg(sbe_to_dev(sbe), "failed copy wc to user:%p rc:%d\n",
+			&userspace->reply.wordcount, rc);
+
+done:
+	rc2 = fsi_device_read(sbe->fsi_dev, SBE_DOWNSTREAM_STATUS,
+			      &submit.reply.status, sizeof(unsigned long));
+	if (rc2)
+		dev_dbg(sbe_to_dev(sbe), "failed fsi read stat rc:%d\n", rc2);
+
+	rc2 = copy_to_user(&userspace->reply.status, &submit.reply.status,
+			   sizeof(unsigned long));
+	if (rc2)
+		dev_dbg(sbe_to_dev(sbe), "failed copy to user:%p rc:%d\n",
+			&userspace->reply.status, rc2);
+
+	if (request)
+		kfree(request);
+
+	if (reply)
+		kfree(reply);
+
+	return rc;
+}
+
 static int sbe_register_read(struct sbe_device *sbe, unsigned long data)
 {
 	int rc;
@@ -152,6 +511,9 @@ static long sbe_ioctl(struct file *filep, uint32_t cmd, unsigned long data)
 	ssize_t rc;
 
 	switch (cmd) {
+	case SBE_IOCTL_SUBMIT:
+		rc = sbe_submit(sbe, data);
+		break;
 	case SBE_IOCTL_READ_REG:
 		rc = sbe_register_read(sbe, data);
 		break;
diff --git a/include/uapi/linux/fsi-sbe.h b/include/uapi/linux/fsi-sbe.h
index 57726de..c077534 100644
--- a/include/uapi/linux/fsi-sbe.h
+++ b/include/uapi/linux/fsi-sbe.h
@@ -17,8 +17,21 @@ struct sbe_ioctl_register {
 	unsigned long value;
 };
 
+struct sbe_op {
+	void *data;
+	size_t wordcount;
+	unsigned long status;
+};
+
+struct sbe_ioctl_submit {
+	struct sbe_op request;
+	struct sbe_op reply;
+	unsigned long timeout_in_msecs;
+};
+
 #define SBE_IOCTL_MAGIC		0xF5	/* not sure about this magic number */
 
+#define SBE_IOCTL_SUBMIT	_IOWR(SBE_IOCTL_MAGIC, 0, struct sbe_ioctl_submit)
 #define SBE_IOCTL_READ_REG	_IOWR(SBE_IOCTL_MAGIC, 1, struct sbe_ioctl_register)
 #define SBE_IOCTL_WRITE_REG	_IOWR(SBE_IOCTL_MAGIC, 2, struct sbe_ioctl_register)
 #define SBE_IOCTL_REQUEST_RESET	_IO(SBE_IOCTL_MAGIC, 3)
-- 
1.9.1
