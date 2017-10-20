Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJcCV42pWzDqKs
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 07:02:29 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9KK24cP018261
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 16:02:27 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dqjuvn8ej-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 16:02:27 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 20 Oct 2017 16:02:25 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 20 Oct 2017 16:02:24 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9KK2LOR49217696; Fri, 20 Oct 2017 20:02:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBAA6AE054;
 Fri, 20 Oct 2017 16:03:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 852A7AE056;
 Fri, 20 Oct 2017 16:03:05 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort method
Date: Fri, 20 Oct 2017 15:02:21 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17102020-0048-0000-0000-000001F8B311
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007925; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00934000; UDB=6.00470494; IPR=6.00714288; 
 BA=6.00005651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017632; XFM=3.00000015;
 UTC=2017-10-20 20:02:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102020-0049-0000-0000-000042EEDD37
Message-Id: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710200279
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
X-List-Received-Date: Fri, 20 Oct 2017 20:02:31 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Driver wasn't cleaning up on timeout or in an error situation properly.
Need to do a full reset if we fail in order to re-stablish a good state
of the engine.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---

Changes since v1:
 * switch to TASK_UNINTERRUPTIBLE for waiting for command complete

 drivers/i2c/busses/i2c-fsi.c | 259 +++++++++++++++++++++++++++++++------------
 1 file changed, 191 insertions(+), 68 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1af9c01..fa44017 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -133,6 +133,11 @@
 #define I2C_ESTAT_SELF_BUSY	0x00000040
 #define I2C_ESTAT_VERSION	0x0000001f
 
+#define I2C_PORT_BUSY_RESET	0x80000000
+
+#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
+#define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
+
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
@@ -351,22 +356,185 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	return rc;
 }
 
+static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
+{
+	int i, rc;
+	u32 mode, dummy = 0;
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
+
+	return rc;
+}
+
+static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
+{
+	int rc;
+	u32 mode, stat, dummy = 0;
+
+	/* reset engine */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	if (rc)
+		return rc;
+
+	/* re-init engine */
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		return rc;
+
+	/* set port; default after reset is 0 */
+	if (port) {
+		mode = SETFIELD(I2C_MODE_PORT, mode, port);
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+		if (rc)
+			return rc;
+	}
+
+	/* reset busy register; hw workaround */
+	dummy = I2C_PORT_BUSY_RESET;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
+	if (rc)
+		return rc;
+
+	/* force bus reset */
+	rc = fsi_i2c_reset_bus(i2c);
+	if (rc)
+		return rc;
+
+	/* reset errors */
+	dummy = 0;
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
+	if (rc)
+		return rc;
+
+	/* wait for command complete */
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
+
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	if (rc)
+		return rc;
+
+	if (stat & I2C_STAT_CMD_COMP)
+		return 0;
+
+	/* failed to get command complete; reset engine again */
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	if (rc)
+		return rc;
+
+	/* re-init engine again */
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		return rc;
+
+	return 0;
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
 			return -EFAULT;
 
+		if (status & I2C_STAT_LOST_ARB)
+			return -ECANCELED;
+
+		if (status & I2C_STAT_STOP_ERR)
+			return -EBADMSG;
+
 		return -EIO;
 	}
 
@@ -396,9 +564,9 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
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
@@ -419,13 +587,21 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
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
@@ -469,72 +645,19 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
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
-- 
1.8.3.1
