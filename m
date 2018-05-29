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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wNkt415tzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 05:16:54 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4TJECju068629
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:51 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j9a5py5v3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:51 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 29 May 2018 13:16:50 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 May 2018 13:16:47 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4TJGkEv6685048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 May 2018 12:16:47 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCD89C604A;
 Tue, 29 May 2018 13:16:46 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.80.223.183])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 202ACC6037;
 Tue, 29 May 2018 13:16:45 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, benh@kernel.crashing.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 2/3] i2c: fsi: Use mutex lock instead of
 semaphore
Date: Tue, 29 May 2018 14:16:37 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18052919-0004-0000-0000-0000142F9567
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009097; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01039494; UDB=6.00532027; IPR=6.00818622; 
 MB=3.00021361; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-29 19:16:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052919-0005-0000-0000-0000877265E5
Message-Id: <1527621398-26526-3-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 29 May 2018 19:16:55 -0000

Simplify the FSI I2C driver by using a mutex lock instead of a
semaphore. This removes the wait until timeout on the semaphore.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 46 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 3fcc14e..adc2e38 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -18,10 +18,9 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/sched.h>
-#include <linux/semaphore.h>
-#include <linux/wait.h>
 
 #define FSI_ENGID_I2C		0x7
 
@@ -145,8 +144,7 @@ struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
 	struct list_head	ports;
-	wait_queue_head_t	wait;
-	struct semaphore	lock;
+	struct mutex		lock;
 };
 
 struct fsi_i2c_port {
@@ -180,29 +178,6 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
 }
 
-static int fsi_i2c_lock_master(struct fsi_i2c_master *i2c, int timeout)
-{
-	int rc;
-
-	rc = down_trylock(&i2c->lock);
-	if (!rc)
-		return 0;
-
-	rc = wait_event_interruptible_timeout(i2c->wait,
-					      !down_trylock(&i2c->lock),
-					      timeout);
-	if (rc > 0)
-		return 0;
-
-	return -EBUSY;
-}
-
-static void fsi_i2c_unlock_master(struct fsi_i2c_master *i2c)
-{
-	up(&i2c->lock);
-	wake_up(&i2c->wait);
-}
-
 static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 {
 	int rc;
@@ -626,11 +601,10 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	int i, rc;
 	unsigned long start_time;
 	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *master = port->master;
 	struct i2c_msg *msg;
 
-	rc = fsi_i2c_lock_master(port->master, adap->timeout);
-	if (rc)
-		return rc;
+	mutex_lock(&master->lock);
 
 	rc = fsi_i2c_set_port(port);
 	if (rc)
@@ -651,7 +625,7 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 unlock:
-	fsi_i2c_unlock_master(port->master);
+	mutex_unlock(&master->lock);
 	return rc;
 }
 
@@ -667,14 +641,11 @@ static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
 	struct fsi_i2c_port *port = adap->algo_data;
 	struct fsi_i2c_master *master = port->master;
 
-	rc = fsi_i2c_lock_master(master, adap->timeout);
-	if (rc)
-		return rc;
+	mutex_lock(&master->lock);
 
 	rc = fsi_i2c_reset(master, port->port);
 
-	fsi_i2c_unlock_master(master);
-
+	mutex_unlock(&master->lock);
 	return rc;
 }
 
@@ -699,8 +670,7 @@ static int fsi_i2c_probe(struct device *dev)
 	if (!i2c)
 		return -ENOMEM;
 
-	init_waitqueue_head(&i2c->wait);
-	sema_init(&i2c->lock, 1);
+	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
 
-- 
1.8.3.1
