Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrXj432KzDrnK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:24:53 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VKOG6F091091
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:24:51 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c28cxs9w2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:24:51 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 16:24:50 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 16:24:47 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKOlPU26214646; Mon, 31 Jul 2017 20:24:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE6AD28058;
 Mon, 31 Jul 2017 16:24:40 -0400 (EDT)
Received: from [9.10.223.138] (unknown [9.10.223.138])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 7E92A2803F;
 Mon, 31 Jul 2017 16:24:40 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 3/4] watchdog: aspeed: Support
 configuration of external signal properties
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170727101647.26960-1-andrew@aj.id.au>
 <20170727101647.26960-4-andrew@aj.id.au>
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 31 Jul 2017 15:24:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170727101647.26960-4-andrew@aj.id.au>
Content-Type: multipart/alternative;
 boundary="------------41484908BB86712B5027ECD7"
X-TM-AS-GCONF: 00
x-cbid: 17073120-0044-0000-0000-000003762178
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895672; UDB=6.00447986; IPR=6.00675859; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:24:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0045-0000-0000-000007A431E5
Message-Id: <e8c434f7-5c9f-37d6-4736-c63ebbcfff7b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707310341
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
X-List-Received-Date: Mon, 31 Jul 2017 20:24:53 -0000

This is a multi-part message in MIME format.
--------------41484908BB86712B5027ECD7
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 7/27/2017 5:16 AM, Andrew Jeffery wrote:
> Add support for configuring the drive strength and polarity on the
> AST2500, and the pulse duration on both the AST2400 and AST2500.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/watchdog/aspeed_wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index d29f75e90bb6..334e43f0164b 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -42,6 +42,14 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_CTRL_WDT_INTR		BIT(2)
>   #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>   #define   WDT_CTRL_ENABLE		BIT(0)
> +#define WDT_RESET_WIDTH		0x18
> +#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
> +#define     WDT_ACTIVE_HIGH_MAGIC	(0xA5 << 24)
> +#define     WDT_ACTIVE_LOW_MAGIC	(0x5A << 24)
> +#define   WDT_RESET_WIDTH_PUSH_PULL	BIT(30)
> +#define     WDT_PUSH_PULL_MAGIC		(0xA8 << 24)
> +#define     WDT_OPEN_DRAIN_MAGIC	(0x8A << 24)
> +#define   WDT_RESET_WIDTH_DURATION	0xFFF
>
>   #define WDT_RESTART_MAGIC	0x4755
>
> @@ -152,6 +160,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	struct device_node *np;
>   	const char *reset_type;
> +	u32 duration;
>   	int ret;
>
>   	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> @@ -204,6 +213,39 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>   	}
>
> +	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
> +
> +		reg &= WDT_RESET_WIDTH_DURATION;
> +		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> +			reg |= WDT_PUSH_PULL_MAGIC;
> +		else
> +			reg |= WDT_OPEN_DRAIN_MAGIC;
> +
> +		writel(reg, wdt->base + WDT_RESET_WIDTH);
> +
> +		reg &= WDT_RESET_WIDTH_DURATION;
> +		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> +			reg |= WDT_ACTIVE_HIGH_MAGIC;
> +		else
> +			reg |= WDT_ACTIVE_LOW_MAGIC;
> +
> +		writel(reg, wdt->base + WDT_RESET_WIDTH);
> +	}
> +
> +	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
> +		if (duration > WDT_RESET_WIDTH_DURATION) {
> +			dev_err(&pdev->dev, "Invalid reset width\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * The watchdog is always configured with a 1MHz source, so
> +		 * there is no need to scale the microsecond value.
> +		 */
> +		writel(duration, wdt->base + WDT_RESET_WIDTH);
> +	}
> +
>   	ret = watchdog_register_device(&wdt->wdd);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to register\n");


--------------41484908BB86712B5027ECD7
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font face="sans-serif" size="2">Tested-by: Matt Spinler  
        <a class="moz-txt-link-abbreviated" href="mailto:mspinler@linux.vnet.ibm.com">mspinler@linux.vnet.ibm.com</a></font></p>
    <br>
    <div class="moz-cite-prefix">On 7/27/2017 5:16 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote cite="mid:20170727101647.26960-4-andrew@aj.id.au"
      type="cite">
      <pre wrap="">Add support for configuring the drive strength and polarity on the
AST2500, and the pulse duration on both the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
 drivers/watchdog/aspeed_wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d29f75e90bb6..334e43f0164b 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -42,6 +42,14 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_WDT_INTR		BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
+#define WDT_RESET_WIDTH		0x18
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
+#define     WDT_ACTIVE_HIGH_MAGIC	(0xA5 &lt;&lt; 24)
+#define     WDT_ACTIVE_LOW_MAGIC	(0x5A &lt;&lt; 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL	BIT(30)
+#define     WDT_PUSH_PULL_MAGIC		(0xA8 &lt;&lt; 24)
+#define     WDT_OPEN_DRAIN_MAGIC	(0x8A &lt;&lt; 24)
+#define   WDT_RESET_WIDTH_DURATION	0xFFF

 #define WDT_RESTART_MAGIC	0x4755

@@ -152,6 +160,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device_node *np;
 	const char *reset_type;
+	u32 duration;
 	int ret;

 	wdt = devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*wdt), GFP_KERNEL);
@@ -204,6 +213,39 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &amp;wdt-&gt;wdd.status);
 	}

+	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+		u32 reg = readl(wdt-&gt;base + WDT_RESET_WIDTH);
+
+		reg &amp;= WDT_RESET_WIDTH_DURATION;
+		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
+			reg |= WDT_PUSH_PULL_MAGIC;
+		else
+			reg |= WDT_OPEN_DRAIN_MAGIC;
+
+		writel(reg, wdt-&gt;base + WDT_RESET_WIDTH);
+
+		reg &amp;= WDT_RESET_WIDTH_DURATION;
+		if (of_property_read_bool(np, "aspeed,ext-active-high"))
+			reg |= WDT_ACTIVE_HIGH_MAGIC;
+		else
+			reg |= WDT_ACTIVE_LOW_MAGIC;
+
+		writel(reg, wdt-&gt;base + WDT_RESET_WIDTH);
+	}
+
+	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &amp;duration)) {
+		if (duration &gt; WDT_RESET_WIDTH_DURATION) {
+			dev_err(&amp;pdev-&gt;dev, "Invalid reset width\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * The watchdog is always configured with a 1MHz source, so
+		 * there is no need to scale the microsecond value.
+		 */
+		writel(duration, wdt-&gt;base + WDT_RESET_WIDTH);
+	}
+
 	ret = watchdog_register_device(&amp;wdt-&gt;wdd);
 	if (ret) {
 		dev_err(&amp;pdev-&gt;dev, "failed to register\n");
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------41484908BB86712B5027ECD7--
