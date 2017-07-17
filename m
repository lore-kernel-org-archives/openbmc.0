Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBCvQ0CzrzDrFM
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 05:26:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6HJNcC0132599
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:26:07 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2brpbtjuy9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:26:07 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 17 Jul 2017 13:26:06 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 17 Jul 2017 13:26:03 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6HJQ2Eg8520068; Mon, 17 Jul 2017 12:26:02 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E46E46A04C;
 Mon, 17 Jul 2017 13:26:02 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.207.188])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 5C4EE6A03C;
 Mon, 17 Jul 2017 13:25:57 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: wim@iguana.be, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v5 2/2] drivers/watchdog: ASPEED reference dev tree properties
 for config
Date: Mon, 17 Jul 2017 14:25:39 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170717192539.7950-1-cbostic@linux.vnet.ibm.com>
References: <20170717192539.7950-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17071719-0016-0000-0000-00000731D1AA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007379; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00888981; UDB=6.00444004; IPR=6.00669153; 
 BA=6.00005476; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016251; XFM=3.00000015;
 UTC=2017-07-17 19:26:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071719-0017-0000-0000-00003AA06D6F
Message-Id: <20170717192539.7950-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-17_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707170311
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
X-List-Received-Date: Mon, 17 Jul 2017 19:26:10 -0000

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
v5 - Add explicit check for property type "none". Return error
     if property type is not a known value.
   - Default reset type when no property present changed to
     match original code: SOC + SYSTEM reset
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
 drivers/watchdog/aspeed_wdt.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 1c65258..c707ab6 100644
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
@@ -164,14 +167,30 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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
+		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
+	} else {
+		if (!strcmp(reset_type, "cpu"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
+		else if (!strcmp(reset_type, "soc"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
+		else if (!strcmp(reset_type, "system"))
+			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+		else if (strcmp(reset_type, "none"))
+			return -EINVAL;
+	}
+	if (of_property_read_bool(np, "aspeed,external-signal"))
+		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+
+	writel(wdt->ctrl, wdt->base + WDT_CTRL);
 
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
 		aspeed_wdt_start(&wdt->wdd);
-- 
1.8.2.2
