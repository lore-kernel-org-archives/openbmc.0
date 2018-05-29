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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wNkw22BfzDrJF
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 05:16:56 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4TJEAMP058368
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:53 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j9c3pt0u6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:16:53 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 29 May 2018 13:16:52 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 May 2018 13:16:50 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4TJGnQQ5702064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 May 2018 12:16:49 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E670C6037;
 Tue, 29 May 2018 13:16:49 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.80.223.183])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 93F6EC603E;
 Tue, 29 May 2018 13:16:48 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, benh@kernel.crashing.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 3/3] i2c: fsi: Use usleep instead of schedule
 calls
Date: Tue, 29 May 2018 14:16:38 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18052919-0004-0000-0000-0000142F956C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009097; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01039494; UDB=6.00532027; IPR=6.00818622; 
 MB=3.00021361; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-29 19:16:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052919-0005-0000-0000-0000877265ED
Message-Id: <1527621398-26526-4-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 29 May 2018 19:16:57 -0000

Simplify the FSI I2C driver by calling usleep_range while waiting for
data to be made available instead of scheduling a timeout. The schedule
overhead isn't worth it for what should be a short time.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index adc2e38..52a662c 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/sched.h>
 
 #define FSI_ENGID_I2C		0x7
 
@@ -135,7 +134,8 @@
 
 #define I2C_PORT_BUSY_RESET	0x80000000
 
-#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
+#define I2C_LOCAL_SLEEP_MAX_US	500
+#define I2C_LOCAL_SLEEP_MIN_US	50
 
 /* choose timeout length from legacy driver; it's well tested */
 #define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
@@ -490,10 +490,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 		if (status & I2C_STAT_CMD_COMP)
 			return 0;
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
-			return -EINTR;
-
+		usleep_range(I2C_LOCAL_SLEEP_MIN_US, I2C_LOCAL_SLEEP_MAX_US);
 	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));
 
 	return -ETIME;
@@ -556,7 +553,7 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			unsigned long timeout)
 {
 	u32 status = 0;
-	int rc, rc_abort;
+	int rc;
 	unsigned long start = jiffies;
 
 	do {
@@ -578,21 +575,10 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			continue;
 		}
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0) {
-			rc = -EINTR;
-			goto abort;
-		}
+		usleep_range(I2C_LOCAL_SLEEP_MIN_US, I2C_LOCAL_SLEEP_MAX_US);
 	} while (time_after(start + timeout, jiffies));
 
-	rc = -ETIME;
-
-abort:
-	rc_abort = fsi_i2c_abort(port, status);
-	if (rc_abort)
-		return rc_abort;
-
-	return rc;
+	return -ETIME;
 }
 
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-- 
1.8.3.1
