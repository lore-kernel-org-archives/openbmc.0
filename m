Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJB2F3JWszDqBH
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 07:22:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v43LJgOV078045
 for <openbmc@lists.ozlabs.org>; Wed, 3 May 2017 17:22:26 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a7dbj42au-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 17:22:26 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 3 May 2017 15:22:25 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 3 May 2017 15:22:22 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v43LMMZb6553900; Wed, 3 May 2017 14:22:22 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EDD778038;
 Wed,  3 May 2017 15:22:22 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.1.58])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 46BCD7804D;
 Wed,  3 May 2017 15:22:19 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/fsi: GPIO stability changes for
 Cronus/Hostboot
Date: Wed,  3 May 2017 16:22:15 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17050321-0024-0000-0000-0000165ABA71
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007018; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00855829; UDB=6.00423602; IPR=6.00634992; 
 BA=6.00005323; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015287; XFM=3.00000014;
 UTC=2017-05-03 21:22:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050321-0025-0000-0000-00004ABBA821
Message-Id: <20170503212215.89562-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-03_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705030371
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
X-List-Received-Date: Wed, 03 May 2017 21:22:29 -0000

Improve stability in the FSI protocol by re-ordering the clocking
delays. Increase clocking delays to 3 microseconds.  Remove
delay prior to sampling input - now redundant given new clocking
delay order.

New effective delay per clock toggle is now 6 microseconds.
Previous clocking summed up to 3 nS but real time measurements
of each 1 nS delay actually was approx 1.8 microseconds.
Previous total delay was then 1.8 * 3 = 5.4 microseconds.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index d5cce88..ef209ef 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -14,7 +14,7 @@
 
 #include "fsi-master.h"
 
-#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
+#define	FSI_GPIO_STD_DLY	3	/* Standard pin delay in uS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
@@ -76,10 +76,10 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
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
 
@@ -87,7 +87,6 @@ static int sda_in(struct fsi_master_gpio *master)
 {
 	int in;
 
-	ndelay(FSI_GPIO_STD_DLY);
 	in = gpiod_get_value(master->gpio_data);
 	return in ? 1 : 0;
 }
-- 
1.8.2.2
