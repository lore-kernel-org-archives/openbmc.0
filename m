Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wNks0vV7zDr7s
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 05:16:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4TJGMMc075485
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:49 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j9ahnp5yh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:48 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 29 May 2018 13:16:48 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 May 2018 13:16:45 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4TJGisS11338028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 May 2018 12:16:44 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24160C6037;
 Tue, 29 May 2018 13:16:44 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.80.223.183])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 59F88C603E;
 Tue, 29 May 2018 13:16:43 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, benh@kernel.crashing.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 1/3] i2c: fsi: Don't take a lock around FSI
 accesses
Date: Tue, 29 May 2018 14:16:36 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18052919-0020-0000-0000-00000E09C8B9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009097; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01039494; UDB=6.00532026; IPR=6.00818622; 
 MB=3.00021361; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-29 19:16:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052919-0021-0000-0000-000061A47EE2
Message-Id: <1527621398-26526-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-29_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805290205
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 19:16:53 -0000

That lock is incorrect as FSI can sleep and thus will
trigger lockdep warnings. It is also unnecessary as
it was meant to "speed up" the reset process for
unspecified reasons, not to protect against anything.

The the master semaphore should prevent any concurrent user from
seeing the intermediate state already and the recent improvements
to the FSI layer should take care of potential speed issues.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
This is Benjamin Herrenschmidt's <benh@kernel.crashing.org> patch, but I also
removed the reset_lock in the master structure and didn't add delay.h include;
thought I would just get these in one patch set for convenience.

 drivers/i2c/busses/i2c-fsi.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10f693f..3fcc14e 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -21,7 +21,6 @@
 #include <linux/of.h>
 #include <linux/sched.h>
 #include <linux/semaphore.h>
-#include <linux/spinlock.h>
 #include <linux/wait.h>
 
 #define FSI_ENGID_I2C		0x7
@@ -148,7 +147,6 @@ struct fsi_i2c_master {
 	struct list_head	ports;
 	wait_queue_head_t	wait;
 	struct semaphore	lock;
-	spinlock_t		reset_lock;
 };
 
 struct fsi_i2c_port {
@@ -427,71 +425,63 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
 {
 	int rc;
 	u32 mode, stat, dummy = 0;
-	unsigned long flags;
-
-	/* disable pre-emption; bus won't get left in a bad state for long */
-	spin_lock_irqsave(&i2c->reset_lock, flags);
 
 	/* reset engine */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* re-init engine */
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
-		goto done;
+		return rc;
 
 	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* set port; default after reset is 0 */
 	if (port) {
 		mode = SETFIELD(I2C_MODE_PORT, mode, port);
 		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 		if (rc)
-			goto done;
+			return rc;
 	}
 
 	/* reset busy register; hw workaround */
 	dummy = I2C_PORT_BUSY_RESET;
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* force bus reset */
 	rc = fsi_i2c_reset_bus(i2c);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* reset errors */
 	dummy = 0;
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* wait for command complete; time from legacy driver */
-	udelay(1000);
+	msleep(1);
 
 	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 	if (rc)
-		goto done;
+		return rc;
 
 	if (stat & I2C_STAT_CMD_COMP)
-		goto done;
+		return rc;
 
 	/* failed to get command complete; reset engine again */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
 	if (rc)
-		goto done;
+		return rc;
 
 	/* re-init engine again */
-	rc = fsi_i2c_dev_init(i2c);
-
-done:
-	spin_unlock_irqrestore(&i2c->reset_lock, flags);
-	return rc;
+	return fsi_i2c_dev_init(i2c);
 }
 
 static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
@@ -711,7 +701,6 @@ static int fsi_i2c_probe(struct device *dev)
 
 	init_waitqueue_head(&i2c->wait);
 	sema_init(&i2c->lock, 1);
-	spin_lock_init(&i2c->reset_lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
 
-- 
1.8.3.1
