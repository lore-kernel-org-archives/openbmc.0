Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZO71fPnF"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxjKy63gczDqNm;
 Wed, 20 Sep 2017 11:47:34 +1000 (AEST)
Received: by mail-lf0-x243.google.com with SMTP id l196so623580lfl.3;
 Tue, 19 Sep 2017 18:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2OizzXL8uGdphVZROeUBOIPoD2RihG4cYudNgiQfcjQ=;
 b=ZO71fPnFIaCCylE0heUa2K3BpN4clTvuVPcdQ5zA1rCK6e9PImd/W98L1+LUnukSPI
 EX6+DfzHabEH7ZmQIJeprm7UfO7J1I7n3IGGTSvVC735nuVyq1YIRifbrh1AGGau7vdu
 xE7jKbTUmbvUfg2qOotF6PmFFgQGDlQxqeYHiOzTjGWGBZHeFZNw5yyC5SEXoVO8L6Mr
 WuRfop45AWn7txYhY8k+exv6pfq2/zWerqEF+6NBx3cms+FkLGX8Fq7SgUmbu1brOT5D
 xhyPPcCXuLKmU87ikBko6G24JKjdmqM6kCH942VCIX0lXOClJIDWb8ILOAghMrlxYgc7
 OGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2OizzXL8uGdphVZROeUBOIPoD2RihG4cYudNgiQfcjQ=;
 b=UEgVmM4rOlhFA+HKwmC06ficpSmrZJFd9iUeGpidqTeJE5BTXNpD68hsqg//+UtXJ0
 a0FVfrbgDd0xvR6P+ILJks3biCOgiEeRrs23iqNltE9I5Oc4qKxLElDCwN4JhBxeP8iY
 9PZJWyzwA4WqIzsQt8ZNv7L2NMND7rdysfhqnP9+18BXm1BkNnuFgHO41oKpDZf1FswB
 KMnuzXeHz44B5vhM7tpLAt/Yu3R7PrEz5rKryQP1A4Oi7msl0KeU65e2T8MT6qinnvtC
 o3OAEzgaKHwRrHRW6d3qULGw6bxFFEQwEkN0UMkfDfAtZikICRVwlgDDkmWrstVj0Hsz
 avNg==
X-Gm-Message-State: AHPjjUgEN937eNPNVQM8fWI80NlttfWXKczMzPU1SsIADibxhyyzu+Yi
 XD7lnpV7uYF/o13Riqb6xmLX4nQHjbxdLlti840=
X-Google-Smtp-Source: AOwi7QCJXX2AURd0/QJngbFhTENPuS+/pv7vuebCwl9h42RXsq8GtZo666v3ybfcPQ9ouh0fUphCJ3jaTmj+Nw3rtkQ=
X-Received: by 10.46.71.193 with SMTP id u184mr1519915lja.166.1505872050451;
 Tue, 19 Sep 2017 18:47:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 18:47:09 -0700 (PDT)
In-Reply-To: <20170918054905.16470-2-andrew@aj.id.au>
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 11:17:09 +0930
X-Google-Sender-Auth: cFpsyoMZMuRwzG3U0TiVDKMqiM4
Message-ID: <CACPK8XezE6ZSfSQ7Aq7g85imqXLuahWGu_SQzG=+LAq0UxSdyA@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: aspeed: Retain watchdog enabled state
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 20 Sep 2017 01:47:35 -0000

On Mon, Sep 18, 2017 at 3:19 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> An unintended post-condition of probe() is that the watchdog is
> disabled. Rework probe() such that we retain the value of the "enabled"
> bit from the control register, and take the appropriate actions with
> respect to the watchdog core if so. Otherwise, just configure the
> watchdog as directed.
>

This should have a fixes line. The code as it stands in 4.14-rc1
unconditionally disables the watchdog at boot :(

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/watchdog/aspeed_wdt.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 79cc766cd30f..99bc6fbd8852 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -221,7 +221,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>                 return -EINVAL;
>         config = ofdid->data;
>
> -       wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +       wdt->ctrl |= readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE;

If we go back to before b7f0b8ad25f3 ("drivers/watchdog: ASPEED
reference dev tree properties for config"), the driver set up the
cached ctrl value and then tested the hardware state to decide if we
should have the watchdog enabled.

Looking at the driver now there's little reason to keep the cached
ctrl value. I'd suggest reworking the driver to not have it so we can
avoid bugs like the ones that b7f0b8ad25f3 introduced.

Cheers,

Joel

> +       wdt->ctrl |= WDT_CTRL_1MHZ_CLK;
>
>         /*
>          * Control reset on a per-device basis to ensure the
> @@ -243,11 +244,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>         if (of_property_read_bool(np, "aspeed,external-signal"))
>                 wdt->ctrl |= WDT_CTRL_WDT_EXT;
>
> -       writel(wdt->ctrl, wdt->base + WDT_CTRL);
> -
> -       if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
> +       if (wdt->ctrl & WDT_CTRL_ENABLE) {
>                 aspeed_wdt_start(&wdt->wdd);
>                 set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +       } else {
> +               writel(wdt->ctrl, wdt->base + WDT_CTRL);
>         }
>
>         if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> --
> 2.11.0
>
