Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFRwx4BhgzDqBj
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 06:38:09 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v13JY3AK135415
 for <openbmc@lists.ozlabs.org>; Fri, 3 Feb 2017 14:38:06 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28crfp2gd9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2017 14:38:06 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 3 Feb 2017 14:38:05 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 3 Feb 2017 14:38:04 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 991B838C8039;
 Fri,  3 Feb 2017 14:38:04 -0500 (EST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v13Jc3tK39649318; Fri, 3 Feb 2017 19:38:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0AF2AC046;
 Fri,  3 Feb 2017 14:38:03 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 53565AC03A;
 Fri,  3 Feb 2017 14:38:03 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Clock slave prior to master command
Date: Fri,  3 Feb 2017 13:38:00 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020319-0040-0000-0000-0000028ADF55
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006550; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816782; UDB=6.00398901; IPR=6.00594217; 
 BA=6.00005114; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014171; XFM=3.00000011;
 UTC=2017-02-03 19:38:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020319-0041-0000-0000-0000067DEC05
Message-Id: <20170203193800.90838-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-03_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702030185
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
X-List-Received-Date: Fri, 03 Feb 2017 19:38:10 -0000

If the FSI bus has been idle for some period it is necessary to
wake up the slave so its ready for a new master initiated
commands. This is done by clocking out a series of 0's on the
SDA line immediately before any command.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 73d9985..49598c33 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -59,6 +59,7 @@
 #define	FSI_GPIO_MSG_ID_SIZE		2
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
 #define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
+#define	FSI_GPIO_WAKE_CLOCKS		32	/* >= 32 ok, 16 fails */
 
 static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
 
@@ -178,6 +179,16 @@ static void echo_delay(struct fsi_master_gpio *master)
 }
 
 /*
+ * Wake up the slave by clocking it a number of times prior to sending the next
+ * master command.  Needed when the bus has been idle for a while.
+ */
+static void wake_slave(struct fsi_master_gpio *master)
+{
+	set_sda_output(master, 1);
+	clock_toggle(master, FSI_GPIO_WAKE_CLOCKS);
+}
+
+/*
  * Used in bus error cases only.  Clears out any remaining data the slave
  * is attempting to send
  */
@@ -364,6 +375,7 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
 
 	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	wake_slave(master);
 	serial_out(master, &cmd);
 	echo_delay(master);
 	rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
@@ -386,6 +398,7 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
 
 	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	wake_slave(master);
 	serial_out(master, &cmd);
 	echo_delay(master);
 	rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
-- 
1.8.2.2
