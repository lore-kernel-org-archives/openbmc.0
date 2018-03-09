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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zyhG72z9TzDrKy
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 09:03:11 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w29LxJMt111266
 for <openbmc@lists.ozlabs.org>; Fri, 9 Mar 2018 17:03:09 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gm02fnm8w-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 17:03:09 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Mar 2018 17:03:07 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Mar 2018 17:03:05 -0500
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w29M35oJ40042720; Fri, 9 Mar 2018 22:03:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 930B02803F;
 Fri,  9 Mar 2018 17:02:28 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 39FE32803A;
 Fri,  9 Mar 2018 17:02:28 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Milton Miller <miltonm@us.ibm.com>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 2/3] watchdog: aspeed: Allow configuring for
 alternate boot
Date: Fri,  9 Mar 2018 16:02:59 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18030922-0056-0000-0000-0000042B3B98
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008643; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000702; UDB=6.00509033; IPR=6.00780032; 
 MB=3.00019945; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-09 22:03:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030922-0057-0000-0000-0000086D432D
Message-Id: <1520632980-26812-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803090260
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
X-List-Received-Date: Fri, 09 Mar 2018 22:03:11 -0000

From: Milton Miller <miltonm@us.ibm.com>

Allow the device tree to specify a watchdog to fallover to
the alternate boot source.

The aspeeed watchdog can set a latch directing flash chip select 0 to
chip select 1, allowing boot from an alternate media if the watchdog
is not reset in time.  On the ast2400 bank 1 also goes to flash bank 1,
while on the ast2500 the chip selects are swapped.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d1987d6..f41d246 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -46,6 +46,7 @@ struct aspeed_wdt_config {
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
 #define WDT_CTRL		0x0C
+#define   WDT_CTRL_BOOT_SECONDARY	BIT(7)
 #define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
 #define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
@@ -245,6 +246,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 	if (of_property_read_bool(np, "aspeed,external-signal"))
 		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+	if (of_property_read_bool(np, "aspeed,alt-boot"))
+		wdt->ctrl |= WDT_CTRL_BOOT_SECONDARY;
 
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
 		/*
-- 
1.8.3.1
