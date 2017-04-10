Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1yWy2xBdzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 03:55:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3AHsMFi073917
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 13:55:18 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29rbx8rn3m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 13:55:18 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 11:55:17 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 11:55:15 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3AHtEE611010474; Mon, 10 Apr 2017 10:55:14 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 806866A03F;
 Mon, 10 Apr 2017 11:55:14 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id B85706A03D;
 Mon, 10 Apr 2017 11:55:12 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: FSI protocol updates to improve
 reliability
Date: Mon, 10 Apr 2017 12:55:06 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17041017-0008-0000-0000-000007966AB8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006912; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845652; UDB=6.00417035; IPR=6.00624086; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014995; XFM=3.00000013;
 UTC=2017-04-10 17:55:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041017-0009-0000-0000-0000415E987C
Message-Id: <20170410175506.62007-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100141
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
X-List-Received-Date: Mon, 10 Apr 2017 17:55:27 -0000

Re-order delays in the clock toggle from: delay clock 0, delay,
clock 1 to clock 0, delay, clock 1, delay.  Allows removal of
delay added just prior to sampling SDA line for SDA input.

Slow down the delay period from 1ns to 3us.  The original 1ns
delay was actually 1-2 us based on real time measurements so
this isn't a factor of 3000x slowdown.

Removed echo delay on send command as its not needed.

Removed the 100x prime clocks after command and now send 50x
clocks prior to command as is done by the pdbg tool.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index a8976d5..1517c21 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -13,7 +13,7 @@
 
 #include "fsi-master.h"
 
-#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
+#define	FSI_GPIO_STD_DLY	3	/* Standard pin delay in uS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
@@ -61,7 +61,6 @@
 #define	FSI_GPIO_CRC_SIZE	4
 #define	FSI_GPIO_MSG_ID_SIZE		2
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
-#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
 
 static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
 
@@ -86,10 +85,10 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		ndelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 0);
-		ndelay(FSI_GPIO_STD_DLY);
+		udelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 1);
+		udelay(FSI_GPIO_STD_DLY);
 	}
 }
 
@@ -97,7 +96,6 @@ static int sda_in(struct fsi_master_gpio *master)
 {
 	int in;
 
-	ndelay(FSI_GPIO_STD_DLY);
 	in = gpiod_get_value(master->gpio_data);
 	return in ? 1 : 0;
 }
@@ -287,8 +285,6 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
 			return -EIO;
 		}
-		/* Clock the slave enough to be ready for next operation */
-		clock_toggle(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
 		return 0;
 
 	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
@@ -362,8 +358,9 @@ static int send_command(struct fsi_master_gpio *master,
 	int rc;
 
 	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	set_sda_output(master, 1);
+	clock_toggle(master, 50);
 	serial_out(master, cmd);
-	echo_delay(master);
 	rc = poll_for_response(master, expected, size, val);
 	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
 
-- 
1.8.2.2
