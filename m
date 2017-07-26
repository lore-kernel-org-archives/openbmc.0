Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHjPG0bQPzDqq5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 03:52:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6QHiCkw138226
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 13:52:31 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bxubdf52c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 13:52:31 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 11:52:30 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 11:52:28 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6QHqSkA66519060; Wed, 26 Jul 2017 10:52:28 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1102A13603C;
 Wed, 26 Jul 2017 11:52:28 -0600 (MDT)
Received: from [9.10.223.138] (unknown [9.10.223.138])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id B36FD136044;
 Wed, 26 Jul 2017 11:52:27 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v2 3/4] watchdog: aspeed: Support external
 signal drive and polarity bindings
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170726160831.17867-1-andrew@aj.id.au>
 <20170726160831.17867-4-andrew@aj.id.au>
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 26 Jul 2017 12:52:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170726160831.17867-4-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17072617-0012-0000-0000-000014BDBB6C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007430; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893255; UDB=6.00446551; IPR=6.00673419; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016390; XFM=3.00000015;
 UTC=2017-07-26 17:52:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072617-0013-0000-0000-00004EC8B5AD
Message-Id: <c525e702-a7e2-2470-fca2-26dee7826fb4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707260258
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
X-List-Received-Date: Wed, 26 Jul 2017 17:52:34 -0000



On 7/26/2017 11:08 AM, Andrew Jeffery wrote:
> These bindings are optional, and only relevant on the AST2500 and
> compatible watchdog controllers.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/watchdog/aspeed_wdt.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index d29f75e90bb6..9a07ef176054 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -42,6 +42,9 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_CTRL_WDT_INTR		BIT(2)
>   #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>   #define   WDT_CTRL_ENABLE		BIT(0)
> +#define WDT_RESET_WIDTH		0x18
> +#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
> +#define   WDT_RESET_WIDTH_PUSHPULL	BIT(30)
>
>   #define WDT_RESTART_MAGIC	0x4755
>
> @@ -204,6 +207,24 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>   	}
>
> +	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +		u32 from = readl(wdt->base + WDT_RESET_WIDTH);
> +		u32 to = from;
> +
> +		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> +			to |= WDT_RESET_WIDTH_PUSHPULL;
> +		else
> +			to &= ~WDT_RESET_WIDTH_PUSHPULL;
 From the spec:

To set this bit to value ’1’, write bit[31:24] = 0xA8.
To set this bit to value ’0’, write bit[31:24] = 0x8A.

> +
> +		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> +			to |= WDT_RESET_WIDTH_ACTIVE_HIGH;
> +		else
> +			to &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
> +
And again here:
To set this bit to value ’1’, write bit[31:24] = 0xA5.
To set this bit to value ’0’, write bit[31:24] = 0x5A.
For others value, this bit will keep old value without change.
> +		if (from != to)
> +			writel(to, wdt->base + WDT_RESET_WIDTH);
> +	}
> +
>   	ret = watchdog_register_device(&wdt->wdd);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to register\n");
