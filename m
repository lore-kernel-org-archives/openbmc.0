Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sBlilsfW"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409k5k669zzF2BN
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 08:04:10 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id c78so110096pfj.6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wQvLHdi8imq1BFun9Q+rcanME8FCcCKs0M7c9TeIGS8=;
 b=sBlilsfWOpRnrO55fzP8GJm3dNRHAnw6D+A5UgXIaIUvkAT8n8gLDk1RnECepu3YkF
 vHpRuv2+K+W/xyEwrPjWsOeh6meRJlNHpbBo+qmuaWXbsIaoPSbr0xIQn4Il743j95w+
 JGueLozwohKf7StINzj8Qd2F8RR+XjrqZRUVcM/0144WptBU/MtnUnA6nr6YdcBOrIZU
 HdX7eLm6h9C5nExfY0NOVDoCoiWR7jQGyAkBrthzRE7Agmg981M/nQkwsVdM6izg+7VE
 hYEhNvYddsNA2kQ3pfBTI4GhwW3dqb/3dxMpuj2OB/rU231O+MiEM83rH8zsmTi8Dobz
 ek3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQvLHdi8imq1BFun9Q+rcanME8FCcCKs0M7c9TeIGS8=;
 b=rWIL2xIZhvbhgk0kWfnPRVvcy5K8sPYPtyTtHdZQzXMWGdQg2wiGUsxHwJgC80JUoq
 ARwCizYDPgxFCvZ6nT8LoE3NRKtUVKsPoNQGCAd38diE7ayA1JvZ/HOBZVf3M6ggxa0U
 5C1x2d4vdeXu1UcTfNPh00ZeM7ujVhzVFyVE4T8Ixz3iUUCulDYtXB/rXcvWnp7W9y0w
 6SRVbLgFGHWvAWe7/o/vjDxKHdv0Qeydos1bJahsR0suRiSiugP7Vz6ow7PsqJlWJivs
 CLH07XLrGLF4uK+Cmdg/ftd4/Mn+8XSsTIk/WhYKVH2akyRHOINiCuZthi684RYQ6yIg
 Kb7Q==
X-Gm-Message-State: AElRT7E4U7mvneepCazo6ucn78TRFKmJSFGfzCd7gk4xYw0wxi33Snv+
 9CCCeEyLrko1Qj3ETTc2XAI=
X-Google-Smtp-Source: AIpwx4/h7DL6l7hifmFsdAfKXEF3LL8cY3XyuUy2j9iDc70BMILD3BR/APvdTk8Fhvu5u1t2ZnP8TA==
X-Received: by 10.98.80.5 with SMTP id e5mr661775pfb.131.1522184648687;
 Tue, 27 Mar 2018 14:04:08 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id l90sm5101965pfb.96.2018.03.27.14.04.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Mar 2018 14:04:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] aspeed: watchdog: Set bootstatus during probe
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-watchdog@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 wim@linux-watchdog.org, joel@jms.id.au
References: <1522181367-11231-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <09152d5f-5b49-9b8b-5ac3-829a2c9aab2e@roeck-us.net>
Date: Tue, 27 Mar 2018 14:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522181367-11231-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 27 Mar 2018 21:04:11 -0000

On 03/27/2018 01:09 PM, Eddie James wrote:
> Check the aspeed timeout status register to see if the system has booted
> from the secondary boot source. If so, set the watchdog device
> bootstatus flag for "Card previously reset the CPU."
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v1:
>   - use bootstatus instead of status
>   - use WDIOF_CARDRESET instead of raw register contents
> 
>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index a5b8eb2..1abe4d0 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -55,6 +55,8 @@ struct aspeed_wdt_config {
>   #define   WDT_CTRL_WDT_INTR		BIT(2)
>   #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>   #define   WDT_CTRL_ENABLE		BIT(0)
> +#define WDT_TIMEOUT_STATUS	0x10
> +#define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -192,6 +194,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	struct device_node *np;
>   	const char *reset_type;
>   	u32 duration;
> +	u32 status;
>   	int ret;
>   
>   	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> @@ -307,6 +310,10 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
>   	}
>   
> +	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
>   	ret = devm_watchdog_register_device(&pdev->dev, &wdt->wdd);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to register\n");
> 
