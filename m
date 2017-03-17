Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vlJ9j6xn0zDqZJ
 for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2017 08:18:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2HLDwWm106742
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 17:18:44 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 298qcq0dum-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 17:18:43 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 17 Mar 2017 17:18:42 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Mar 2017 17:18:39 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2HLIfRc37421232; Fri, 17 Mar 2017 21:18:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C278AC03F;
 Fri, 17 Mar 2017 17:18:32 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 52B9DAC03A;
 Fri, 17 Mar 2017 17:18:32 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling input
 on SDA
Date: Fri, 17 Mar 2017 16:18:36 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17031721-0040-0000-0000-000002EC2971
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006800; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00835290; UDB=6.00410298; IPR=6.00612945; 
 BA=6.00005216; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014700; XFM=3.00000013;
 UTC=2017-03-17 21:18:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031721-0041-0000-0000-000006E02B17
Message-Id: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-17_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703170177
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
X-List-Received-Date: Fri, 17 Mar 2017 21:18:50 -0000

During high cpu loads the SDA in line can shift relative to the
clock signal which can corrupt the received input data.  Slow
down the time to sample input to account for this.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2 - Increase delay for SDA in sampling only.
   - Decrease the original delay for SDA sampling from 1us to 200ns
---
 drivers/fsi/fsi-master-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index a8976d5..8e832e0 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -14,6 +14,7 @@
 #include "fsi-master.h"
 
 #define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
+#define	FSI_GPIO_SDA_IN_DLY	200	/* Wait to sample SDA line, in nS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
@@ -97,7 +98,7 @@ static int sda_in(struct fsi_master_gpio *master)
 {
 	int in;
 
-	ndelay(FSI_GPIO_STD_DLY);
+	ndelay(FSI_GPIO_SDA_IN_DLY);
 	in = gpiod_get_value(master->gpio_data);
 	return in ? 1 : 0;
 }
-- 
1.8.2.2
