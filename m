Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg19R3497zDqXx
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:48:43 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2ALY3mj102850
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:38 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2942q73pp0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:38 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Mar 2017 16:48:38 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Mar 2017 16:48:36 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2ALmYg341681014; Fri, 10 Mar 2017 21:48:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 406C2112057;
 Fri, 10 Mar 2017 16:48:35 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id E1BE1112047;
 Fri, 10 Mar 2017 16:48:34 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 3/5] drivers: i2c: Add transfer implementation for
 FSI algorithm
Date: Fri, 10 Mar 2017 15:48:24 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17031021-0056-0000-0000-000002FF0448
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006759; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832829; UDB=6.00408758; IPR=6.00610418; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014600; XFM=3.00000013;
 UTC=2017-03-10 21:48:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031021-0057-0000-0000-000007352180
Message-Id: <1489182506-20505-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703100168
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
X-List-Received-Date: Fri, 10 Mar 2017 21:48:43 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Use polling instead of interrupts; we have no hardware IRQ over FSI.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 226 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 225 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index c47cd234..ebdfa72 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -132,6 +132,7 @@ struct fsi_i2c_bus {
 	struct i2c_adapter	adapter;
 	struct fsi_device	*fsi;
 	u8			fifo_size;
+	u16			xfrd;
 	unsigned long		clk;
 };
 
@@ -182,10 +183,233 @@ static int fsi_i2c_dev_init(struct fsi_i2c_bus *i2c)
 	return rc;
 }
 
+static int fsi_i2c_set_port(struct fsi_device *dev, int port)
+{
+	int rc;
+	u32 mode, dummy = 0;
+	int old_port;
+
+	rc = fsi_device_read(dev, I2C_BOE_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	old_port = GETFIELD(I2C_BOE_MODE_PORT, mode);
+
+	if (old_port != port) {
+		mode = SETFIELD(I2C_BOE_MODE_PORT, mode, port);
+		rc = fsi_device_write(dev, I2C_BOE_MODE, &mode,
+				      sizeof(mode));
+		if (rc)
+			return rc;
+
+		/* reset engine when port is changed */
+		rc = fsi_device_write(dev, I2C_BOE_RESET_ERR, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_start(struct fsi_i2c_bus *i2c, struct i2c_msg *msg,
+			 bool stop)
+{
+	int rc;
+	u32 cmd = I2C_BOE_CMD_WITH_START | I2C_BOE_CMD_WITH_ADDR;
+
+	i2c->xfrd = 0;
+
+	if (msg->flags & I2C_M_RD)
+		cmd |= I2C_BOE_CMD_READ;
+
+	if (stop || msg->flags & I2C_M_STOP)
+		cmd |= I2C_BOE_CMD_WITH_STOP;
+
+	cmd = SETFIELD(I2C_BOE_CMD_ADDR, cmd, msg->addr >> 1);
+	cmd = SETFIELD(I2C_BOE_CMD_LEN, cmd, msg->len);
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_CMD, &cmd, sizeof(cmd));
+
+	return rc;
+}
+
+static int fsi_i2c_write_fifo(struct fsi_i2c_bus *i2c, struct i2c_msg *msg,
+			      u8 fifo_count)
+{
+	int write;
+	int rc = 0;
+	int bytes_to_write = i2c->fifo_size - fifo_count;
+	int bytes_remaining = msg->len - i2c->xfrd;
+
+	if (bytes_to_write > bytes_remaining)
+		bytes_to_write = bytes_remaining;
+
+	while (bytes_to_write > 0) {
+		write = bytes_to_write;
+		/* fsi limited to 4 byte ops */
+		if (bytes_to_write > 4)
+			write = 4;
+
+		rc = fsi_device_write(i2c->fsi, I2C_BOE_FIFO,
+				      &msg->buf[i2c->xfrd], write);
+		if (rc)
+			return rc;
+
+		i2c->xfrd += write;
+		bytes_to_write -= write;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_read_fifo(struct fsi_i2c_bus *i2c, struct i2c_msg *msg,
+			     u8 fifo_count)
+{
+	int read;
+	int rc = 0;
+	int xfr_remaining = msg->len - i2c->xfrd;
+	u32 dummy;
+
+	while (fifo_count) {
+		read = fifo_count;
+		/* fsi limited to 4 byte ops */
+		if (fifo_count > 4)
+			read = 4;
+
+		if (xfr_remaining) {
+			if (xfr_remaining < read)
+				read = xfr_remaining;
+
+			rc = fsi_device_read(i2c->fsi, I2C_BOE_FIFO,
+					     &msg->buf[i2c->xfrd], read);
+			if (rc)
+				return rc;
+
+			i2c->xfrd += read;
+			xfr_remaining -= read;
+		} else {
+			/* no more buffer but data in fifo, need to clear it */
+			rc = fsi_device_read(i2c->fsi, I2C_BOE_FIFO,
+					     &dummy, read);
+			if (rc)
+				return rc;
+		}
+
+		fifo_count -= read;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_handle_status(struct fsi_i2c_bus *i2c, struct i2c_msg *msg,
+				 u32 status)
+{
+	int rc;
+	u8 fifo_count;
+	u32 dummy = 0;
+
+	if (status & I2C_BOE_STAT_ERR) {
+		rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_ERR, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+
+		if (status & I2C_BOE_STAT_NACK)
+			return -EFAULT;
+
+		return -EIO;
+	}
+
+	if (status & I2C_BOE_STAT_DAT_REQ) {
+		fifo_count = GETFIELD(I2C_BOE_STAT_FIFO_COUNT, status);
+
+		if (msg->flags & I2C_M_RD)
+			rc = fsi_i2c_read_fifo(i2c, msg, fifo_count);
+		else
+			rc = fsi_i2c_write_fifo(i2c, msg, fifo_count);
+
+		return rc;
+	}
+
+	if (status & I2C_BOE_STAT_CMD_COMP) {
+		if (i2c->xfrd < msg->len)
+			rc = -ENODATA;
+		else
+			rc = msg->len;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_wait(struct fsi_i2c_bus *i2c, struct i2c_msg *msg,
+			unsigned long timeout)
+{
+	const unsigned long local_timeout = 2; /* jiffies */
+	u32 status = 0;
+	int rc;
+
+	do {
+		rc = fsi_device_read(i2c->fsi, I2C_BOE_STAT, &status,
+				     sizeof(status));
+		if (rc)
+			return rc;
+
+		if (status & I2C_BOE_STAT_ANY_RESP) {
+			rc = fsi_i2c_handle_status(i2c, msg, status);
+			if (rc < 0)
+				return rc;
+
+			/* cmd complete and all data xfrd */
+			if (rc == msg->len)
+				return 0;
+
+			/* need to xfr more data, but maybe don't need wait */
+			continue;
+		}
+
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(local_timeout);
+		timeout = (timeout < local_timeout) ? 0 :
+			timeout - local_timeout;
+	} while (timeout);
+
+	return -ETIME;
+}
+
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			int num)
 {
-	return -ENOSYS;
+	int i;
+	int rc = 0;
+	int port;
+	unsigned long start_time;
+	struct fsi_i2c_bus *i2c = adap->algo_data;
+	struct i2c_msg *msg;
+
+	if (num) {
+		/* TODO: how else to get port information? this works though */
+		port = GETFIELD(I2C_ADDR_PORT, msgs[0].addr);
+		rc = fsi_i2c_set_port(i2c->fsi, port);
+		if (rc)
+			return rc;
+	}
+
+	for (i = 0; i < num; ++i) {
+		msg = msgs + i;
+		start_time = jiffies;
+
+		rc = fsi_i2c_start(i2c, msg, i == num - 1);
+		if (rc)
+			return rc;
+
+		rc = fsi_i2c_wait(i2c, msg,
+				  adap->timeout - (jiffies - start_time));
+		if (rc)
+			return rc;
+	}
+
+	return rc;
 }
 
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
-- 
1.8.3.1
