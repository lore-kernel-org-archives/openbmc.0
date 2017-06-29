Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wygWM2sMVzDr4T
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 10:28:47 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5T0SchZ125044
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 20:28:43 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bcnmqamxy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 20:28:42 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 28 Jun 2017 20:28:41 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 28 Jun 2017 20:28:36 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5T0SaxW24117466; Thu, 29 Jun 2017 00:28:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2F6EAE03B;
 Wed, 28 Jun 2017 20:28:38 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.6.33])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id B9316AE034;
 Wed, 28 Jun 2017 20:28:33 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: wim@iguana.be, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/2] drivers/watchdog: ASPEED reference dev tree properties
 for config
Date: Wed, 28 Jun 2017 19:28:11 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17062900-0052-0000-0000-000002314AA7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007292; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880138; UDB=6.00438730; IPR=6.00660292; 
 BA=6.00005445; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015996; XFM=3.00000015;
 UTC=2017-06-29 00:28:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062900-0053-0000-0000-00005123902A
Message-Id: <20170629002811.87199-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-28_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706290007
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
X-List-Received-Date: Thu, 29 Jun 2017 00:28:47 -0000

Reference the system device tree when configuring the watchdog
engines. If optional property 'aspeed,no-sys-reset' is specified
then override the default config and do not set sys reset mode.
If optional property 'aspeed,no-soc-reset' is specified then
override the default and do not set soc reset mode.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v3 - Invert the logic for system reset dev tree property to
     preserve backwards compatibility. If not specified the
     default is to configure for system reset
   - Add check for 'aspeed,no-soc-reset' property and only if
     not present is SOC reset to be configured.  This preserves
     backwards compatibility.
v2 - Change of_get_property() to of_property_read_bool()
   - Remove redundant check for NULL struct device_node pointer
   - Optional property names now start with prefix 'aspeed,'
---
 drivers/watchdog/aspeed_wdt.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 1c65258..ace74f8 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -140,6 +140,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct aspeed_wdt *wdt;
 	struct resource *res;
+	struct device_node *np;
 	int ret;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -166,12 +167,21 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 	/*
 	 * Control reset on a per-device basis to ensure the
-	 * host is not affected by a BMC reboot, so only reset
-	 * the SOC and not the full chip
+	 * host is not affected by a BMC reboot
 	 */
-	wdt->ctrl = WDT_CTRL_RESET_MODE_SOC |
-		WDT_CTRL_1MHZ_CLK |
-		WDT_CTRL_RESET_SYSTEM;
+	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+
+	np = pdev->dev.of_node;
+	if (!(of_property_read_bool(np, "aspeed,no-soc-reset")))
+		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
+
+	if (!(of_property_read_bool(np, "aspeed,no-sys-reset")))
+		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+
+	if (of_property_read_bool(np, "aspeed,external-signal"))
+		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+
+	writel(wdt->ctrl, wdt->base + WDT_CTRL);
 
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
 		aspeed_wdt_start(&wdt->wdd);
-- 
1.8.2.2
