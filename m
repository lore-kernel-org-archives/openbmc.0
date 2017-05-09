Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMt741P8szDqLk
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 07:39:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v49LYQGI004027
 for <openbmc@lists.ozlabs.org>; Tue, 9 May 2017 17:39:15 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2abfbe0ms1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 17:39:15 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 9 May 2017 17:39:14 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 May 2017 17:39:13 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v49LdCLn55509128; Tue, 9 May 2017 21:39:12 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87750124050;
 Tue,  9 May 2017 17:39:07 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 3E62912403D;
 Tue,  9 May 2017 17:39:07 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 6/7] drivers/fsi: GPIO stability changes for
 Cronus/Hostboot
Date: Tue,  9 May 2017 16:39:01 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050921-0040-0000-0000-000003377DE7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00858366; UDB=6.00425300; IPR=6.00637830; 
 BA=6.00005339; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015382; XFM=3.00000015;
 UTC=2017-05-09 21:39:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050921-0041-0000-0000-0000072BA504
Message-Id: <20170509213902.37939-7-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-09_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705090123
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
X-List-Received-Date: Tue, 09 May 2017 21:39:28 -0000

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
