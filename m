Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSqN55WGNzF0SG
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2018 06:53:41 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0QJi6Ni045326
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:39 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2fr5cw50p2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:38 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 Jan 2018 12:53:37 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Jan 2018 12:53:35 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0QJrZZ713238626; Fri, 26 Jan 2018 12:53:35 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE0396E040;
 Fri, 26 Jan 2018 12:53:34 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.85.176.85])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 4D8666E038;
 Fri, 26 Jan 2018 12:53:33 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/5] watchdog: aspeed: Fix translation of reset
 mode to ctrl register
Date: Fri, 26 Jan 2018 13:53:22 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18012619-0016-0000-0000-0000082BAFBA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008433; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00980763; UDB=6.00497211; IPR=6.00760064; 
 BA=6.00005797; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019231; XFM=3.00000015;
 UTC=2018-01-26 19:53:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012619-0017-0000-0000-00003D374307
Message-Id: <1516996404-25133-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801260259
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 19:53:42 -0000

From: Milton Miller <miltonm@us.ibm.com>

Assert RESET_SYSTEM bit for any reset and set MODE field from reset
type.

The watchdog control register has a RESET_SYSTEM bit that is really
closer to activate a reset, and RESET_SYSTEM_MODE field that chooses
how much to reset.

Before this patch, a node without these optional property would do a
SOC reset, but a node with properties requesting a cpu or SOC reset
would do nothing and a node requesting a system reset would do a
SOC reset.

Fixes: ede7ddfef3d9 ("watchdog: aspeed: Support configuration of external signal properties")
Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 9d40802..7eef0dd 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -197,11 +197,14 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
 	} else {
 		if (!strcmp(reset_type, "cpu"))
-			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU |
+				     WDT_CTRL_RESET_SYSTEM;
 		else if (!strcmp(reset_type, "soc"))
-			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC |
+				     WDT_CTRL_RESET_SYSTEM;
 		else if (!strcmp(reset_type, "system"))
-			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_FULL_CHIP |
+				     WDT_CTRL_RESET_SYSTEM;
 		else if (strcmp(reset_type, "none"))
 			return -EINVAL;
 	}
-- 
1.8.3.1
