Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQjzq55QCzDrns
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 05:43:33 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9UIhVoG081648
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:43:32 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dx94cheyf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:43:31 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 30 Oct 2017 12:43:31 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Oct 2017 12:43:28 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9UIhR1651773604; Mon, 30 Oct 2017 11:43:27 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB6E978037;
 Mon, 30 Oct 2017 12:43:27 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6F5AC78038;
 Mon, 30 Oct 2017 12:43:27 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4] drivers: i2c: fsi: Add proper abort method
Date: Mon, 30 Oct 2017 13:43:25 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17103018-0012-0000-0000-000015383828
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007982; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00938743; UDB=6.00473215; IPR=6.00719004; 
 BA=6.00005663; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017795; XFM=3.00000015;
 UTC=2017-10-30 18:43:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17103018-0013-0000-0000-0000501352CF
Message-Id: <1509389005-14205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710300247
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
X-List-Received-Date: Mon, 30 Oct 2017 18:43:36 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Driver wasn't cleaning up on timeout or in an error situation properly.
Need to do a full reset if we fail in order to re-stablish a good state
of the engine.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---

Changes since v3:
 * Switch arbitration lost from ECANCELED to EAGAIN.

Changes since v2:
 * Add spinlock for reset procedure to disable pre-emption
 * Add comments for timeout lengths
 * Add check for stuck bus lines in low-level reset procedure

 drivers/i2c/busses/i2c-fsi.c | 285 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 216 insertions(+), 69 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1af9c01..1cb85f3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -9,6 +9,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#include <asm/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/fsi.h>
@@ -20,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/sched.h>
 #include <linux/semaphore.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 
 #define FSI_ENGID_I2C		0x7
@@ -133,12 +135,20 @@
 #define I2C_ESTAT_SELF_BUSY	0x00000040
 #define I2C_ESTAT_VERSION	0x0000001f
 
+#define I2C_PORT_BUSY_RESET	0x80000000
+
+#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
+
+/* choose timeout length from legacy driver; it's well tested */
+#define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
+
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
 	struct list_head	ports;
 	wait_queue_head_t	wait;
 	struct semaphore	lock;
+	spinlock_t		reset_lock;
 };
 
 struct fsi_i2c_port {
@@ -351,21 +361,202 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	return rc;
 }
 
+static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
+{
+	int i, rc;
+	u32 mode, stat, ext, dummy = 0;
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		return rc;
+
+	mode |= I2C_MODE_DIAG;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < 9; ++i) {
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
+		if (rc)
+			return rc;
+
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
+		if (rc)
+			return rc;
+	}
+
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
+	if (rc)
+		return rc;
+
+	mode &= ~I2C_MODE_DIAG;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	if (rc)
+		return rc;
+
+	/* check for hardware fault */
+	if (!(stat & I2C_STAT_SCL_IN) || !(stat & I2C_STAT_SDA_IN)) {
+		rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_ESTAT, &ext);
+		if (rc)
+			return rc;
+
+		dev_err(&i2c->fsi->dev, "bus stuck status[%08X] ext[%08X]\n",
+			stat, ext);
+	}
+
+	return 0;
+}
+
+static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
+{
+	int rc;
+	u32 mode, stat, dummy = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&i2c->reset_lock, flags);
+
+	/* reset engine */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	if (rc)
+		goto done;
+
+	/* re-init engine */
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		goto done;
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		goto done;
+
+	/* set port; default after reset is 0 */
+	if (port) {
+		mode = SETFIELD(I2C_MODE_PORT, mode, port);
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+		if (rc)
+			goto done;
+	}
+
+	/* reset busy register; hw workaround */
+	dummy = I2C_PORT_BUSY_RESET;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
+	if (rc)
+		goto done;
+
+	/* force bus reset */
+	rc = fsi_i2c_reset_bus(i2c);
+	if (rc)
+		goto done;
+
+	/* reset errors */
+	dummy = 0;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
+	if (rc)
+		goto done;
+
+	/* wait for command complete; length from legacy driver */
+	udelay(1000);
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	if (rc)
+		goto done;
+
+	if (stat & I2C_STAT_CMD_COMP)
+		goto done;
+
+	/* failed to get command complete; reset engine again */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	if (rc)
+		goto done;
+
+	/* re-init engine again */
+	rc = fsi_i2c_dev_init(i2c);
+
+done:
+	spin_unlock_irqrestore(&i2c->reset_lock, flags);
+	return rc;
+}
+
+static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
+{
+	int rc;
+	unsigned long start;
+	u32 cmd = I2C_CMD_WITH_STOP;
+	struct fsi_device *fsi = port->master->fsi;
+
+	rc = fsi_i2c_reset(port->master, port->port);
+	if (rc)
+		return rc;
+
+	/* skip final stop command for these errors */
+	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
+		return 0;
+
+	rc = fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
+	if (rc)
+		return rc;
+
+	start = jiffies;
+
+	do {
+		rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
+		if (rc)
+			return rc;
+
+		if (status & I2C_STAT_CMD_COMP)
+			return 0;
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
+			return -EINTR;
+
+	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));
+
+	return -ETIME;
+}
+
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
 	int rc;
 	u8 fifo_count;
-	struct fsi_i2c_master *i2c = port->master;
-	u32 dummy = 0;
 
 	if (status & I2C_STAT_ERR) {
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
+		rc = fsi_i2c_abort(port, status);
 		if (rc)
 			return rc;
 
+		if (status & I2C_STAT_INV_CMD)
+			return -EINVAL;
+
+		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
+		    I2C_STAT_BE_ACCESS))
+			return -EPROTO;
+
 		if (status & I2C_STAT_NACK)
-			return -EFAULT;
+			return -ENXIO;
+
+		if (status & I2C_STAT_LOST_ARB)
+			return -EAGAIN;
+
+		if (status & I2C_STAT_STOP_ERR)
+			return -EBADMSG;
 
 		return -EIO;
 	}
@@ -396,9 +587,9 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			unsigned long timeout)
 {
-	const unsigned long local_timeout = 2; /* jiffies */
 	u32 status = 0;
-	int rc;
+	int rc, rc_abort;
+	unsigned long start = jiffies;
 
 	do {
 		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
@@ -419,13 +610,21 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			continue;
 		}
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(local_timeout);
-		timeout = (timeout < local_timeout) ? 0 :
-			timeout - local_timeout;
-	} while (timeout);
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0) {
+			rc = -EINTR;
+			goto abort;
+		}
+	} while (time_after(start + timeout, jiffies));
 
-	return -ETIME;
+	rc = -ETIME;
+
+abort:
+	rc_abort = fsi_i2c_abort(port, status);
+	if (rc_abort)
+		return rc_abort;
+
+	return rc;
 }
 
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
@@ -469,72 +668,19 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 		| I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
-static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
-{
-	int i, rc;
-	u32 mode, dummy = 0;
-
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
-	if (rc)
-		return rc;
-
-	mode |= I2C_MODE_DIAG;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
-	if (rc)
-		return rc;
-
-	for (i = 0; i < 9; ++i) {
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
-		if (rc)
-			return rc;
-
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
-		if (rc)
-			return rc;
-	}
-
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
-	if (rc)
-		return rc;
-
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
-	if (rc)
-		return rc;
-
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
-	if (rc)
-		return rc;
-
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
-	if (rc)
-		return rc;
-
-	mode &= ~I2C_MODE_DIAG;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
-
-	return rc;
-}
-
 static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
 {
 	int rc;
-	u32 dummy = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_master *master = port->master;
 
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	rc = fsi_i2c_lock_master(master, adap->timeout);
 	if (rc)
 		return rc;
 
-	rc = fsi_i2c_dev_init(i2c);
-	if (rc)
-		return rc;
+	rc = fsi_i2c_reset(master, port->port);
 
-	rc = fsi_i2c_low_level_recover_bus(i2c);
-	if (rc)
-		return rc;
-
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
+	fsi_i2c_unlock_master(master);
 
 	return rc;
 }
@@ -562,6 +708,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 	init_waitqueue_head(&i2c->wait);
 	sema_init(&i2c->lock, 1);
+	spin_lock_init(&i2c->reset_lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
 
-- 
1.8.3.1
