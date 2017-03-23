Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0TB3LJFzDqZk
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:45:02 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhvk6126297
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:54 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29cg2qm5bd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:53 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:44:53 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:51 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLioFg13173004; Thu, 23 Mar 2017 14:44:50 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 361A278037;
 Thu, 23 Mar 2017 15:44:50 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id E7E5B7803F;
 Thu, 23 Mar 2017 15:44:49 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 4/7] drivers: i2c: Add transfer implementation for
 FSI algorithm
Date: Thu, 23 Mar 2017 16:44:36 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17032321-0004-0000-0000-000011D548C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006837; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837962; UDB=6.00412009; IPR=6.00615725; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:44:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0005-0000-0000-00007E0E2D77
Message-Id: <1490305479-17065-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:45:02 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Execute I2C transfers from the FSI-attached I2C master. Use polling
instead of interrupts as we have no hardware IRQ over FSI.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 189 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 188 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ad9159e..854fd3e 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -142,6 +142,7 @@ struct fsi_i2c_port {
 	struct i2c_adapter	adapter;
 	struct fsi_i2c_master	*master;
 	u16			port;
+	u16			xfrd;
 };
 
 static unsigned long fsi_i2c_get_clk_div(struct fsi_i2c_master *i2c)
@@ -221,17 +222,203 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 	return rc;
 }
 
+static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
+			 bool stop)
+{
+	int rc;
+	struct fsi_i2c_master *i2c = port->master;
+	u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
+
+	port->xfrd = 0;
+
+	if (msg->flags & I2C_M_RD)
+		cmd |= I2C_CMD_READ;
+
+	if (stop || msg->flags & I2C_M_STOP)
+		cmd |= I2C_CMD_WITH_STOP;
+
+	cmd = SETFIELD(I2C_CMD_ADDR, cmd, msg->addr >> 1);
+	cmd = SETFIELD(I2C_CMD_LEN, cmd, msg->len);
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_CMD, &cmd, sizeof(cmd));
+
+	return rc;
+}
+
+static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
+			      u8 fifo_count)
+{
+	int write;
+	int rc = 0;
+	struct fsi_i2c_master *i2c = port->master;
+	int bytes_to_write = i2c->fifo_size - fifo_count;
+	int bytes_remaining = msg->len - port->xfrd;
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
+		rc = fsi_device_write(i2c->fsi, I2C_FSI_FIFO,
+				      &msg->buf[port->xfrd], write);
+		if (rc)
+			return rc;
+
+		port->xfrd += write;
+		bytes_to_write -= write;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
+			     u8 fifo_count)
+{
+	int read;
+	int rc = 0;
+	struct fsi_i2c_master *i2c = port->master;
+	int xfr_remaining = msg->len - port->xfrd;
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
+			rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO,
+					     &msg->buf[port->xfrd], read);
+			if (rc)
+				return rc;
+
+			port->xfrd += read;
+			xfr_remaining -= read;
+		} else {
+			/* no more buffer but data in fifo, need to clear it */
+			rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO, &dummy,
+					     read);
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
+static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
+				 struct i2c_msg *msg, u32 status)
+{
+	int rc;
+	u8 fifo_count;
+	struct fsi_i2c_master *i2c = port->master;
+	u32 dummy = 0;
+
+	if (status & I2C_STAT_ERR) {
+		rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_ERR, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+
+		if (status & I2C_STAT_NACK)
+			return -EFAULT;
+
+		return -EIO;
+	}
+
+	if (status & I2C_STAT_DAT_REQ) {
+		fifo_count = GETFIELD(I2C_STAT_FIFO_COUNT, status);
+
+		if (msg->flags & I2C_M_RD)
+			rc = fsi_i2c_read_fifo(port, msg, fifo_count);
+		else
+			rc = fsi_i2c_write_fifo(port, msg, fifo_count);
+
+		return rc;
+	}
+
+	if (status & I2C_STAT_CMD_COMP) {
+		if (port->xfrd < msg->len)
+			rc = -ENODATA;
+		else
+			rc = msg->len;
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
+			unsigned long timeout)
+{
+	const unsigned long local_timeout = 2; /* jiffies */
+	u32 status = 0;
+	int rc;
+
+	do {
+		rc = fsi_device_read(port->master->fsi, I2C_FSI_STAT, &status,
+				     sizeof(status));
+		if (rc)
+			return rc;
+
+		if (status & I2C_STAT_ANY_RESP) {
+			rc = fsi_i2c_handle_status(port, msg, status);
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
+	int i;
 	int rc;
+	unsigned long start_time;
 	struct fsi_i2c_port *port = adap->algo_data;
+	struct i2c_msg *msg;
 
 	rc = fsi_i2c_set_port(port);
 	if (rc)
 		return rc;
 
-	return -ENOSYS;
+	for (i = 0; i < num; ++i) {
+		msg = msgs + i;
+		start_time = jiffies;
+
+		rc = fsi_i2c_start(port, msg, i == num - 1);
+		if (rc)
+			return rc;
+
+		rc = fsi_i2c_wait(port, msg,
+				  adap->timeout - (jiffies - start_time));
+		if (rc)
+			return rc;
+	}
+
+	return 0;
 }
 
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
-- 
1.8.3.1
