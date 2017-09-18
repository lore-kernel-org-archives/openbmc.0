Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XeynTu5a"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwmvk0ww2zDrVk;
 Mon, 18 Sep 2017 23:25:05 +1000 (AEST)
Received: by mail-pg0-x243.google.com with SMTP id m30so233503pgn.5;
 Mon, 18 Sep 2017 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PI7sLAFWlRtq1W8gI2lFG4UMkGvLTQMc48UpsBqzwkg=;
 b=XeynTu5a0r6e9Xorrcy9a7snCKa2fh8kEMKiYed9twa6GIoqGHKHXMZcujzoJfjIuz
 JCbHg3Y3C/mfHo7omVAimDTKFPyETqWJkHl8ei9n3QYHMTTd1xrJqRmSFDUSH+Wsd/Rv
 Lavn3ppyZiuj1cjZkcMFwbVHTcQH761DQQ8amCQI1z2pP/mHJUK4UswG7aUdgdUMbgL+
 Qy35ZsH1Oe5F5P54RoizW/OTOfzF9B4CnyZ7prNU1DoXWtPVZ94voSIEUAUM0dFZBC/3
 Xw9Brn6X+RtQUu/EYgf0oBVrf6ZrnBImTTiIVWhcdkEANkUYi8MOuzw9EKGDh6U2RCcg
 wIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PI7sLAFWlRtq1W8gI2lFG4UMkGvLTQMc48UpsBqzwkg=;
 b=K8zzZpDnfPHIgU+1oaCCaMNTVZqX0EMgUxp7x+G+S+YPGKMd7btFHkgSU2QNWndMuU
 GgJ9ej3ybQW2yWwi0xO2qpjvqLCa+dneJwjb0emcZ01Jb/iQURBPYS9u46tuhOW9sVyD
 ohPY4LFmLPg5meefPOlRsvQJpEPt8HTBs0ZdOCw2llNtwQcRQeXz6pa6ZgA55s7Plwev
 iU6Amwqr+Kp97dlqBYizEPTz9u186PuPQabULUZG9SRNrH89JEe9/JFGiqiVCNVBBg6S
 HvtXdTRFIbwKkUfuJIq+bSVXkZNOc10kuX1DOyOP23ufEQ2qYah6Om9iv5W6VByCH/Q2
 f3pQ==
X-Gm-Message-State: AHPjjUhemKwaCwYe07Y1+3o+IUUqNfn7xTgRawrCc5xBfYugxU+FqNTC
 N8m/yE31vTtSGw==
X-Google-Smtp-Source: ADKCNb4AQvHpoR23mrqqcfwgdBaR4cw35AYsklxywN6NU4vpI5q0tRtF1EzlSGIqDqI6mGj+k0gpaQ==
X-Received: by 10.99.149.84 with SMTP id t20mr33742187pgn.222.1505741104168;
 Mon, 18 Sep 2017 06:25:04 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id n19sm16929997pfj.114.2017.09.18.06.25.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Sep 2017 06:25:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/4] watchdog: aspeed: Retain watchdog enabled state
To: Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org
Cc: wim@iguana.be, joel@jms.id.au, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 ryan_chen@aspeedtech.com
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-2-andrew@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bef08c5f-b0ae-a2e4-34a1-c9e1500b4234@roeck-us.net>
Date: Mon, 18 Sep 2017 06:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918054905.16470-2-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 13:25:06 -0000

On 09/17/2017 10:49 PM, Andrew Jeffery wrote:
> An unintended post-condition of probe() is that the watchdog is
> disabled. Rework probe() such that we retain the value of the "enabled"
> bit from the control register, and take the appropriate actions with
> respect to the watchdog core if so. Otherwise, just configure the
> watchdog as directed.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/watchdog/aspeed_wdt.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 79cc766cd30f..99bc6fbd8852 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -221,7 +221,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	config = ofdid->data;
>   
> -	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +	wdt->ctrl |= readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE;
> +	wdt->ctrl |= WDT_CTRL_1MHZ_CLK;
>   
>   	/*
>   	 * Control reset on a per-device basis to ensure the
> @@ -243,11 +244,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if (of_property_read_bool(np, "aspeed,external-signal"))
>   		wdt->ctrl |= WDT_CTRL_WDT_EXT;
>   
> -	writel(wdt->ctrl, wdt->base + WDT_CTRL);
> -
> -	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
> +	if (wdt->ctrl & WDT_CTRL_ENABLE) {
>   		aspeed_wdt_start(&wdt->wdd);

Why call the start function in this case ?

>   		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status); > +	} else {
> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>   	}
>   
>   	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> 
