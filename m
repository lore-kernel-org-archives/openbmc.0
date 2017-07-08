Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x4ZKP663hzDr9C
 for <openbmc@lists.ozlabs.org>; Sun,  9 Jul 2017 00:55:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="NxvdQ/97";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J4wb6N4SM9lBpR2tzjdWcWslp8g/DtTwAtb7tjiQVJA=; b=NxvdQ/97MYxY75iyPY3Ou9Egz+
 BdJ1FOy69k1VYqpnRngChD6gQlZ51ETM+H6CWAoENarCBfDWJJWJsfSitHWWc31SmQuQyYNo540tO
 4Q/1EscEtMDM+ppxf1UbpUPHydwszjDYUtwFf7qa4/dhBZR7+ecMZYmQRCRdOIn5A0r5ZmT2QsB0H
 w2RpHWY1ZuIesmsrekGpuRvGlx/qV8YisvRkm1bXj14QsIOsphazS5fvV4YuFz7PcBFFxAYrxBNyR
 KE+SIMqxZl/vNX7pm1kPVXbQpbVXr7r03c1X/7H+RUNSnhpyu/0rZS6kDWyHAsPeTE7LQJloPeQQY
 BzaptYpQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:33276 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dTr8u-0049Lc-0N; Sat, 08 Jul 2017 14:55:32 +0000
Date: Sat, 8 Jul 2017 07:55:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v4, 2/2] drivers/watchdog: ASPEED reference dev tree properties
 for config
Message-ID: <20170708145530.GA3436@roeck-us.net>
References: <20170707004901.26780-3-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170707004901.26780-3-cbostic@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Sat, 08 Jul 2017 14:55:38 -0000

On Thu, Jul 06, 2017 at 07:49:00PM -0500, Christopher Bostic wrote:
> Reference the system device tree when configuring the watchdog
> engines. If property 'aspeed,reset_type' is present then set
> reset behavior based on the specified value.  This can be one of
> three different mutually exclusive values
>   * cpu - Reset CPU only on watchdog timeout
>   * soc - Reset System on Chip
>   * system - Full system reset
> 
> No reset can also be specified by indicating:
>   * none - No reset, assumes another watchdog is responsible for
>            this.
> 
> Add optional property 'aspeed,external-signal'. If present then
> configure to generate external signal on watchdog timeout.
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v4 - Change the three reset type parameters to a new property
>      'aspeed,reset_type' and check assignment for one of four
>      different values, cpu, soc, system, none
> v3 - Invert the logic for system reset dev tree property to
>      preserve backwards compatibility. If not specified the
>      default is to configure for system reset
>    - Add check for 'aspeed,no-soc-reset' property and only if
>      not present is SOC reset to be configured.  This preserves
>      backwards compatibility.
> v2 - Change of_get_property() to of_property_read_bool()
>    - Remove redundant check for NULL struct device_node pointer
>    - Optional property names now start with prefix 'aspeed,'
> ---
>  drivers/watchdog/aspeed_wdt.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 1c65258..3ca79565 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -36,6 +36,7 @@ struct aspeed_wdt {
>  #define WDT_CTRL		0x0C
>  #define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
>  #define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
> +#define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
>  #define   WDT_CTRL_1MHZ_CLK		BIT(4)
>  #define   WDT_CTRL_WDT_EXT		BIT(3)
>  #define   WDT_CTRL_WDT_INTR		BIT(2)
> @@ -140,6 +141,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  {
>  	struct aspeed_wdt *wdt;
>  	struct resource *res;
> +	struct device_node *np;
> +	const char *reset_type;
>  	int ret;
>  
>  	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> @@ -164,14 +167,28 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
>  	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
>  
> +	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +
>  	/*
>  	 * Control reset on a per-device basis to ensure the
> -	 * host is not affected by a BMC reboot, so only reset
> -	 * the SOC and not the full chip
> +	 * host is not affected by a BMC reboot
>  	 */
> -	wdt->ctrl = WDT_CTRL_RESET_MODE_SOC |
> -		WDT_CTRL_1MHZ_CLK |
> -		WDT_CTRL_RESET_SYSTEM;
> +	np = pdev->dev.of_node;
> +	ret = of_property_read_string(np, "aspeed,reset-type", &reset_type);
> +	if (ret) {
> +		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
> +	} else {
> +		if (!strcmp(reset_type, "cpu"))
> +			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
> +		else if (!strcmp(reset_type, "soc"))
> +			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC; 
> +		else if (!strcmp(reset_type, "system"))
> +			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;

This silently accepts 'aspeed,reset-type="junk"' as "none".
I think it would be better to explicitly check for "none".

Also, if I remember the datasheet correctly, bit 1 (WDT_CTRL_RESET_SYSTEM)
enables the reset in general, and bit 5/6 specify the reset type.
With that in mind, I don't think the above will work as expected.
I think it would have to be

	WDT_CTRL_RESET_MODE_FULL_CHIP | WDT_CTRL_RESET_SYSTEM
	WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM
	WDT_CTRL_RESET_MODE_ARM_CPU | WDT_CTRL_RESET_SYSTEM

To match the original code, the default should be

	WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM

> +	}
> +	if (of_property_read_bool(np, "aspeed,external-signal"))
> +		wdt->ctrl |= WDT_CTRL_WDT_EXT;
> +
No plan to support the other new configuration flags ?

> +	writel(wdt->ctrl, wdt->base + WDT_CTRL);
>  
>  	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
>  		aspeed_wdt_start(&wdt->wdd);
