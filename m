Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNLNv6FrgzDqLR
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 01:53:03 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4AFmlIO073444
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:57 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ac5r6rfgw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:57 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 10 May 2017 09:52:56 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 09:52:53 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4AFqrn514614842; Wed, 10 May 2017 08:52:53 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539F1136043;
 Wed, 10 May 2017 09:52:53 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 0DAA913603C;
 Wed, 10 May 2017 09:52:52 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 4/6] drivers: i2c: Add I2C master locking to
 FSI algorithm
Date: Wed, 10 May 2017 10:52:40 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17051015-0020-0000-0000-00000BE9794A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007043; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858722; UDB=6.00425519; IPR=6.00638195; 
 BA=6.00005342; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015397; XFM=3.00000015;
 UTC=2017-05-10 15:52:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051015-0021-0000-0000-00005C42D033
Message-Id: <1494431562-25101-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100107
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
X-List-Received-Date: Wed, 10 May 2017 15:53:04 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Since there are many ports per master, each with it's own adapter and
chardev, we need some locking to prevent xfers from changing the master
state while other xfers are in progress.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index f690b16..d757aee 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -136,6 +136,8 @@ struct fsi_i2c_master {
 	u8			fifo_size;
 	struct list_head	ports;
 	struct ida		ida;
+	wait_queue_head_t	wait;
+	struct semaphore	lock;
 };
 
 struct fsi_i2c_port {
@@ -171,6 +173,29 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 	return fsi_device_write(fsi, reg, &raw_data, sizeof(raw_data));
 }
 
+static int fsi_i2c_lock_master(struct fsi_i2c_master *i2c, int timeout)
+{
+	int rc;
+
+	rc = down_trylock(&i2c->lock);
+	if (!rc)
+		return 0;
+
+	rc = wait_event_interruptible_timeout(i2c->wait,
+					      !down_trylock(&i2c->lock),
+					      timeout);
+	if (rc > 0)
+		return 0;
+
+	return -EBUSY;
+}
+
+static void fsi_i2c_unlock_master(struct fsi_i2c_master *i2c)
+{
+	up(&i2c->lock);
+	wake_up(&i2c->wait);
+}
+
 static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 {
 	int rc;
@@ -410,25 +435,31 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	struct fsi_i2c_port *port = adap->algo_data;
 	struct i2c_msg *msg;
 
-	rc = fsi_i2c_set_port(port);
+	rc = fsi_i2c_lock_master(port->master, adap->timeout);
 	if (rc)
 		return rc;
 
+	rc = fsi_i2c_set_port(port);
+	if (rc)
+		goto unlock;
+
 	for (i = 0; i < num; ++i) {
 		msg = msgs + i;
 		start_time = jiffies;
 
 		rc = fsi_i2c_start(port, msg, i == num - 1);
 		if (rc)
-			return rc;
+			goto unlock;
 
 		rc = fsi_i2c_wait(port, msg,
 				  adap->timeout - (jiffies - start_time));
 		if (rc)
-			return rc;
+			goto unlock;
 	}
 
-	return 0;
+unlock:
+	fsi_i2c_unlock_master(port->master);
+	return rc;
 }
 
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
@@ -453,6 +484,8 @@ static int fsi_i2c_probe(struct device *dev)
 	if (!i2c)
 		return -ENOMEM;
 
+	init_waitqueue_head(&i2c->wait);
+	sema_init(&i2c->lock, 1);
 	i2c->fsi = to_fsi_dev(dev);
 	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
 	ida_init(&i2c->ida);
-- 
1.8.3.1
