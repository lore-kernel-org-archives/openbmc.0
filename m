Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxjXp18NTzDrmx
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 03:57:12 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBDGsTZ6140572
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 11:57:10 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2eu6k7n0ug-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 11:57:10 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 13 Dec 2017 11:57:09 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 13 Dec 2017 11:57:07 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBDGv7pG53477418; Wed, 13 Dec 2017 16:57:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08A5011204B;
 Wed, 13 Dec 2017 11:55:26 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.80.216.25])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 97AA8112040;
 Wed, 13 Dec 2017 11:55:25 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers: i2c: FSI: Prevent holding CPU for a
 long time
Date: Wed, 13 Dec 2017 10:57:03 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17121316-0056-0000-0000-000003F7BFB6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008199; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00959691; UDB=6.00485376; IPR=6.00739712; 
 BA=6.00005740; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018523; XFM=3.00000015;
 UTC=2017-12-13 16:57:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121316-0057-0000-0000-0000082F0013
Message-Id: <1513184223-5115-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-13_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712130239
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
X-List-Received-Date: Wed, 13 Dec 2017 16:57:14 -0000

From: "Edward A. James" <eajames@us.ibm.com>

During multiple messages, the FSI-attached I2C driver may continually
transfer data without allowing any cycles for the kernel or userspace to
run. This becomes a problem during large transfers (50k or more) since
the kernel or userspace watchdog doesn't get pinged, resulting in a
system reboot. Add some schedule time in between messages to prevent
this.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1cb85f3..1e48c5c 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -137,7 +137,9 @@
 
 #define I2C_PORT_BUSY_RESET	0x80000000
 
-#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
+#define I2C_LOCAL_WAIT_TIMEOUT	msecs_to_jiffies(10)
+
+#define I2C_MSG_SCHED_TIMEOUT	msecs_to_jiffies(50)
 
 /* choose timeout length from legacy driver; it's well tested */
 #define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
@@ -655,6 +657,19 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				  adap->timeout - (jiffies - start_time));
 		if (rc)
 			goto unlock;
+
+		if (i && i != (num - 1)) {
+			/*
+			 * Release the CPU for a while if we're in the middle
+			 * of some large transfers. Otherwise, we could hold
+			 * the CPU for a very long and risk watchdog problems.
+			 */
+			set_current_state(TASK_INTERRUPTIBLE);
+			if (schedule_timeout(I2C_MSG_SCHED_TIMEOUT) > 0) {
+				rc = -EINTR;
+				goto unlock;
+			}
+		}
 	}
 
 unlock:
-- 
1.8.3.1
