Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3bbZ65tfzDr5D
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 10:49:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v670mvIj006579
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 20:49:28 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bhqu8j647-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 20:49:28 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 18:49:27 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 18:49:23 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v670nMmW24117400; Thu, 6 Jul 2017 17:49:22 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B41778037;
 Thu,  6 Jul 2017 18:49:22 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.0.237])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 1100278038;
 Thu,  6 Jul 2017 18:49:17 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: wim@iguana.be, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v4 2/2] drivers/watchdog: ASPEED reference dev tree properties
 for config
Date: Thu,  6 Jul 2017 19:49:00 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170707004901.26780-1-cbostic@linux.vnet.ibm.com>
References: <20170707004901.26780-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070700-0008-0000-0000-0000082D1252
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007333; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883906; UDB=6.00441001; IPR=6.00664094; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016119; XFM=3.00000015;
 UTC=2017-07-07 00:49:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070700-0009-0000-0000-000042F66F4B
Message-Id: <20170707004901.26780-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070012
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
X-List-Received-Date: Fri, 07 Jul 2017 00:49:31 -0000

Reference the system device tree when configuring the watchdog
engines. If property 'aspeed,reset_type' is present then set
reset behavior based on the specified value.  This can be one of
three different mutually exclusive values
  * cpu - Reset CPU only on watchdog timeout
  * soc - Reset System on Chip
  * system - Full system reset

No reset can also be specified by indicating:
  * none - No reset, assumes another watchdog is responsible for
           this.

Add optional property 'aspeed,external-signal'. If present then
configure to generate external signal on watchdog timeout.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v4 - Change the three reset type parameters to a new property
     'aspeed,reset_type' and check assignment for one of four
     different values, cpu, soc, system, none
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
 drivers/watchdog/aspeed_wdt.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 1c65258..3ca79565 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -36,6 +36,7 @@ struct aspeed_wdt {
 #define WDT_CTRL		0x0C
 #define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
+#define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
 #define   WDT_CTRL_1MHZ_CLK		BIT(4)
 #define   WDT_CTRL_WDT_EXT		BIT(3)
 #define   WDT_CTRL_WDT_INTR		BIT(2)
@@ -140,6 +141,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct aspeed_wdt *wdt;
 	struct resource *res;
+	struct device_node *np;
+	const char *reset_type;
 	int ret;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -164,14 +167,28 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
 
+	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+
 	/*
 	 * Control reset on a per-device basis to ensure the
-	 * host is not affected by a BMC reboot, so only reset
-	 * the SOC and not the full chip
+	 * host is not affected by a BMC reboot
 	 */
-	wdt->ctrl = WDT_CTRL_RESET_MODE_SOC |
-		WDT_CTRL_1MHZ_CLK |
-		WDT_CTRL_RESET_SYSTEM;
+	np = pdev->dev.of_node;
+	ret = of_property_read_string(np, "aspeed,reset-type", &reset_type);
+	if (ret) {
+		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+	} else {
+		if (!strcmp(reset_type, "cpu"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
+		else if (!strcmp(reset_type, "soc"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
+		else if (!strcmp(reset_type, "system"))
+			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+	}
+	if (of_property_read_bool(np, "aspeed,external-signal"))
+		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+
+	writel(wdt->ctrl, wdt->base + WDT_CTRL);
 
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
 		aspeed_wdt_start(&wdt->wdd);
-- 
1.8.2.2
