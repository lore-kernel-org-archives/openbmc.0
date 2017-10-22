Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/Ep4p2R"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yKkxd1pGqzDqZr;
 Mon, 23 Oct 2017 03:09:24 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id b6so15369994pfh.7;
 Sun, 22 Oct 2017 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I4c6QpkrRUlMgQyx8gco86zxKD3QmNpV0y0lemIHq5k=;
 b=I/Ep4p2REuBGduEUc4KLe+8+IzAnieCSZaaML8y5qxBRFEFFXrXk1tJ/MrMDIh78zL
 k22CTW2yGLtph3MZIoBOh4FJ0upPkRG1FYK+ItLoQkfIAoWCbyu9IiWsq8TekEbDxMq4
 ps84ejdhtDQ721rUXYwSIfkLUAlAY+YWnhXtbR+UzaAu8uwafHiZpk5W5SNFeSJsfWFx
 MSRlN4hxUFeUL2tABzqBwBQ/oXekbQ8okMEo2FliMs0+5kgMoGbD2nhL9J2tfGrWqXfh
 HgHDCHMPBHffyVWv/IvSTQl/XYaRqYH86eXYZJH1FzXcpYFCzUuej7SdJAaer2SOwX9B
 LIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=I4c6QpkrRUlMgQyx8gco86zxKD3QmNpV0y0lemIHq5k=;
 b=gI61tfasKxXREV8r7uHa3Va91eOo1JffkTVodmL0lq+RjZd2jvo/vBNE5zU6qF2hLe
 DDf4x1cLw43IAaHJ32TX6zVwW9/DNYORbk+CkNHgoLcfRU+L6Pt2+dgPf49lSg9ADr8c
 yYZ8W2xNMXAZQZC3lct7tx6m65pyp8+7q4uYPKkrkPxgmyg12EbAFLo0USiUA5mj2933
 D6gy5TvF87nsh+NV7FzwCVJb+xsNXxmlsK3GovtV8MM3lPsXjJJy1TFgvUpnS63ljFUh
 0C+B7JnaJ3JXLt9AqxqT+hQ2KYfyyjt0c+xPw99FP170GlxKaVwOP7rFq3WhNMQIGT8P
 Mqpg==
X-Gm-Message-State: AMCzsaW+JX1QBEoXRxGgbfJXNhSum4x7SgiUPNB3NEGtcz27B0fhbeWC
 3BRmMCV/PCaTnEDp9CwxDJM=
X-Google-Smtp-Source: ABhQp+QAQf/2xZc+IuRNlRaX2vrDyCY/DqKZOYiuBJ9HOi7U2Sfia+ilLPrfzsWIQqMCCbNfPyOXvw==
X-Received: by 10.99.182.66 with SMTP id v2mr9829777pgt.325.1508688562866;
 Sun, 22 Oct 2017 09:09:22 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id i89sm9486510pfj.144.2017.10.22.09.09.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Oct 2017 09:09:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Oct 2017 09:09:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, joel@jms.id.au,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: Re: [v2,1/4] watchdog: aspeed: Retain watchdog enabled state
Message-ID: <20171022160921.GA12755@roeck-us.net>
References: <20170920053020.6860-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170920053020.6860-2-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Sun, 22 Oct 2017 16:09:26 -0000

On Wed, Sep 20, 2017 at 03:00:17PM +0930, Andrew Jeffery wrote:
> An unintended post-condition of probe() is that the watchdog is
> disabled. This behaviour was introduced by an unnecessary write to the
> control register to configure the hardware based on the devicetree. The
> write is unnecessary because the cached control value that is
> manipulated by the code parsing the devicetree is eventually written by
> aspeed_wdt_enable(), which is when we care how the control register
> should be configured.
> 
> Remove the write to restore expected behaviour.
> 
> Fixes: b7f0b8ad25f3 ("drivers/watchdog: ASPEED reference dev tree properties for config")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 79cc766cd30f..6c6dd3f4c48d 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -243,9 +243,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(np, "aspeed,external-signal"))
>  		wdt->ctrl |= WDT_CTRL_WDT_EXT;
>  
> -	writel(wdt->ctrl, wdt->base + WDT_CTRL);
> -
>  	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
> +		/*
> +		 * The watchdog is running, but invoke aspeed_wdt_start() to
> +		 * write wdt->ctrl to WDT_CTRL to ensure the watchdog's
> +		 * configuration conforms to the driver's expectations.
> +		 * Primarily, ensure we're using the 1MHz clock source.
> +		 */
>  		aspeed_wdt_start(&wdt->wdd);
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
