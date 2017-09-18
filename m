Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJyN84Kb"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwn4f17BbzDsG0;
 Mon, 18 Sep 2017 23:32:49 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id u18so133649pgo.1;
 Mon, 18 Sep 2017 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=swSiAH4srO/AxPB/M40t5f1Ge8RzQVyXz44/3MjlZp4=;
 b=VJyN84KbmE0vbJW4en9NKkZ0GB4xR1D/Bdx7WuotM2/EXDRteiTCyBVPJIQgwMFESc
 1gk4lE/hsLEqn00pwXysgvZTM4e+4aW1E5dTmpaILZZrSRJ2NRg53wdx7sB1IyBT7AdJ
 6GAr87FU5Oc6TO/c9fPqkLcrPw3X0hvQNvCqTsglSYCOkLTSEokm9rbfNbb3crdT/tPj
 F+Sdy7x+pXnyYPslF4blLEG1dj1o4QEgV81RrXiLh4mgJeHAWhVgRsqWKhN/oWCKmsy5
 7IEfVJu+4mzTgcYkox3XS+rd/5+UsNIxBjMUSvwexeBsYIGvFlVYPf62Z8GeRyvtySSx
 IgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=swSiAH4srO/AxPB/M40t5f1Ge8RzQVyXz44/3MjlZp4=;
 b=GX6de+LaahWbamCOrh6QB+vljM+G8sjhb4T4KkLlb9FpX8tRnJanaZi/barDoqp7go
 1EDkOztS2KCxIapc+cLs562qHtxINe4ovdsgkmh2b5OrMXc41TCMW4jMAxfUsNfG60Wg
 oS07a+ihMce9Iw/jaVULUotBIbA1xyPk3QWt2yht7pcvTk4oeLtC6OB/nLx50/25zor7
 VqgwcunUjQBUDEH85pXLceT/mJ2wsh5VM/5ScnwIwMoknTxcxS2t+9/lUljrjL6oJLE6
 fpvwrauYlAz1/DZCSyVR3Lk8j+htnbAK8r9Im85FRvqPqgLqK//FESk2QtowaqG6Pj9+
 l7gw==
X-Gm-Message-State: AHPjjUj4k5uFS0kgApPDAnaV2VTbf7rhMjmZCTDmnb6mep1zjlHnfZR8
 EHUAzPdVc0VDmw==
X-Google-Smtp-Source: ADKCNb5VUe7PXfsEmgS1NVL7SfbkZoRI2MVrHRJy4oGD4WHCZzY2QvETsrUmrZw1/BYiDsOEiNiUmg==
X-Received: by 10.99.130.198 with SMTP id w189mr31512969pgd.175.1505741568107; 
 Mon, 18 Sep 2017 06:32:48 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 78sm14884825pfk.70.2017.09.18.06.32.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Sep 2017 06:32:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/4] watchdog: aspeed: Move init to arch_initcall
To: Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org
Cc: wim@iguana.be, joel@jms.id.au, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 ryan_chen@aspeedtech.com
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-5-andrew@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b7524108-1927-95a5-e5d6-ade0a8b9ab47@roeck-us.net>
Date: Mon, 18 Sep 2017 06:32:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918054905.16470-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 13:32:50 -0000

On 09/17/2017 10:49 PM, Andrew Jeffery wrote:
> Probing at device_initcall time lead to perverse cases where the
> watchdog was probed after, say, I2C, which then leaves a potentially
> running watchdog at the mercy of I2C device behaviour and bus
> conditions.
> 
> Load the watchdog driver early to ensure that the kernel is patting it
> well before initialising peripherals.
> 
But you are doing a bit more. You are making it bool, and you are enabling it
by default. Both isn't needed for the intended goal (arch_initcall is converted
to module_initcall if a driver is built as module). Your change focuses on
and optimizes the case where the watchdog is already running. That may not
always be the case, and there may be systems where the driver is not loaded
on purpose.

Guenter

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/watchdog/Kconfig      | 6 ++----
>   drivers/watchdog/aspeed_wdt.c | 7 ++++++-
>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index a1b92ebe74b6..6103185983ed 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -741,8 +741,9 @@ config RENESAS_RZAWDT
>   	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>   
>   config ASPEED_WATCHDOG
> -	tristate "Aspeed BMC watchdog support"
> +	bool "Aspeed BMC watchdog support"
>   	depends on ARCH_ASPEED || COMPILE_TEST
> +	default y if ARCH_ASPEED
>   	select WATCHDOG_CORE
>   	help
>   	  Say Y here to include support for the watchdog timer
> @@ -750,9 +751,6 @@ config ASPEED_WATCHDOG
>   
>   	  This driver is required to reboot the SoC.
>   
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called aspeed_wdt.
> -
>   config ZX2967_WATCHDOG
>   	tristate "ZTE zx2967 SoCs watchdog support"
>   	depends on ARCH_ZX
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 99bc6fbd8852..679c35abadc4 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -313,7 +313,12 @@ static struct platform_driver aspeed_watchdog_driver = {
>   		.of_match_table = of_match_ptr(aspeed_wdt_of_table),
>   	},
>   };
> -module_platform_driver(aspeed_watchdog_driver);
> +
> +static int __init aspeed_wdt_init(void)
> +{
> +	return platform_driver_register(&aspeed_watchdog_driver);
> +}
> +arch_initcall(aspeed_wdt_init);
>   
>   MODULE_DESCRIPTION("Aspeed Watchdog Driver");
>   MODULE_LICENSE("GPL");
> 
