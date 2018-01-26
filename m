Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSqN24nK4zF0Q8
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2018 06:53:38 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0QJrGTe130305
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:36 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fr7nyy9p1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:35 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 Jan 2018 12:53:34 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Jan 2018 12:53:32 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0QJrWFb11469078; Fri, 26 Jan 2018 12:53:32 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 493C66E03F;
 Fri, 26 Jan 2018 12:53:32 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.85.176.85])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 99B7F6E035;
 Fri, 26 Jan 2018 12:53:31 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/5] watchdog: aspeed: update ASPEED reference
 dev tree properties for config
Date: Fri, 26 Jan 2018 13:53:21 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18012619-8235-0000-0000-00000CEDEAF5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008433; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00980763; UDB=6.00497211; IPR=6.00760064; 
 BA=6.00005797; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019231; XFM=3.00000015;
 UTC=2018-01-26 19:53:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012619-8236-0000-0000-00003F6B53CC
Message-Id: <1516996404-25133-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
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
X-List-Received-Date: Fri, 26 Jan 2018 19:53:39 -0000

From: Milton Miller <miltonm@us.ibm.com>

Update the dev-4.10 branch from the v4 upstream propsal to the v5 version
before proposing further changes.

v4: http://patchwork.ozlabs.org/patch/785315/
v5: http://patchwork.ozlabs.org/patch/789692/

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index ba9b938..9d40802 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -194,7 +194,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	np = pdev->dev.of_node;
 	ret = of_property_read_string(np, "aspeed,reset-type", &reset_type);
 	if (ret) {
-		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
 	} else {
 		if (!strcmp(reset_type, "cpu"))
 			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
@@ -202,6 +202,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
 		else if (!strcmp(reset_type, "system"))
 			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+		else if (strcmp(reset_type, "none"))
+			return -EINVAL;
 	}
 	if (of_property_read_bool(np, "aspeed,external-signal"))
 		wdt->ctrl |= WDT_CTRL_WDT_EXT;
-- 
1.8.3.1
