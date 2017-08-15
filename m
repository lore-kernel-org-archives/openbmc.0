Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWbjM0tzlzDr39
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 12:17:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="E4qGavJ9";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UXLK3ifG5GsB5nWHn+6iMxJZkIKQVvKWts2pDswZOGc=; b=E4qGavJ98rPfONKYKwss5mwFjC
 y9OQVqPb7Y/gmFtgSrmGk9ughaL3+ledAN/wpS0+fxeY5fC0JEyDENDlzfEt9TCahvCG2FNZiSDOA
 /juPx0WvkPRVlT0V0u8zqRosP/cU6cYXwkTX+dbzWUUz5QnIYeKdlmKbL49NRwoBVEHunyJ2CcfcI
 gpuAjRlz2qcrJrgcEfpnfsmGYdzAVsmynHYwIN6rcJFCFu52UascGY0spl229+BtNn2MwvKopOObt
 keWxYMXuxSTsO0PY05ZscYJtefIMdUejGMjR6KFTZ4RkMEzCwkeiMKPTtBFJLf34yjrJT7sGHo37w
 z4PY45Hg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:58326 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dhRQI-0007l5-UZ; Tue, 15 Aug 2017 02:17:39 +0000
Date: Mon, 14 Aug 2017 19:17:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v5, 2/2] drivers/watchdog: ASPEED reference dev tree properties
 for config
Message-ID: <20170815021738.GA1787@roeck-us.net>
References: <20170717192539.7950-3-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170717192539.7950-3-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 15 Aug 2017 02:17:43 -0000

On Mon, Jul 17, 2017 at 02:25:39PM -0500, Christopher Bostic wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v5 - Add explicit check for property type "none". Return error
>      if property type is not a known value.
>    - Default reset type when no property present changed to
>      match original code: SOC + SYSTEM reset
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
>  drivers/watchdog/aspeed_wdt.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 1c65258..c707ab6 100644
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
> @@ -164,14 +167,30 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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
> +		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
> +	} else {
> +		if (!strcmp(reset_type, "cpu"))
> +			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
> +		else if (!strcmp(reset_type, "soc"))
> +			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
> +		else if (!strcmp(reset_type, "system"))
> +			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
> +		else if (strcmp(reset_type, "none"))
> +			return -EINVAL;
> +	}
> +	if (of_property_read_bool(np, "aspeed,external-signal"))
> +		wdt->ctrl |= WDT_CTRL_WDT_EXT;
> +
> +	writel(wdt->ctrl, wdt->base + WDT_CTRL);
>  
>  	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
>  		aspeed_wdt_start(&wdt->wdd);
