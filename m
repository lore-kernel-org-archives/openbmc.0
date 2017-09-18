Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X+k7E5Fw"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwphJ3pdXzDqjB;
 Tue, 19 Sep 2017 00:45:20 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id v5so348734pgn.4;
 Mon, 18 Sep 2017 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ipBEDkf0aS6a7bPA2WfZYTT8w2vy2JeyLKhddwEMO2M=;
 b=X+k7E5FwYrjFmVfZunRMs8Nhup3zIBYDQjHQbu+efKT1ar0bx3gBPsOXJ5mTMaR6Xv
 qma17DwevFsgck9HPUW7DwU12kSW1r/TtN4cdzzntZDE1C1968AVSJcLXh2fzEYvBmCD
 nqYU30yoeGBtyJqwCBDCdj/kJOzTCxZnrNFdMQ4+6F4nu9pEjeaHn/60456I5EQ+hM3N
 TeipQlJFZQH8WMQZRlHuW7hGRP/xsmk5N6QfU8lo4NCpXhF+8hhTFKatXb6J83CSxKj4
 BWJ/A0g5af7HND3io+rdLh2IwkBPGXNI0t54Zbu+3WpIMlzlyBGMbTll9hpfhgTRFFvp
 JoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ipBEDkf0aS6a7bPA2WfZYTT8w2vy2JeyLKhddwEMO2M=;
 b=GI6pZJLpBQEn7v7xGiC+0H0q+sYzooBMVop4OhFgBeHt2I4xtDKveXhg3yj4mBmzfP
 cczbFwmb2t8McnjHt9xVFPQaHblY4cJ0zr6O6accYNkDs8Qp0hCHtmdDaSS0q7k+MNB8
 N0aUkyfNjqrz6b7YhiJ23Q603NqVucEKiQUcSWGUWMMmwIZS4bq0KNrQWM9iBuQuWDpf
 3pWPgg7i5zjTlrSpwVyldmM4KJy8bgu6DebJPP3rirqLd2nYsSC/ZC9xZ0VWd9o9e7UY
 iNERJcZHnbDtms/VUpc+vOrgAN8uLIHL9udg4hqmwCqP0g1RV3RiM+Kc8pk9GtYfbA/s
 X3GQ==
X-Gm-Message-State: AHPjjUgrJaj7BL0ZyrlYlsSbNggH6HToZIE2mL4FwmjBDFEexGr7SQUe
 LKcYg/WVQ3PM4bQU
X-Google-Smtp-Source: ADKCNb4+x8Z/IiD7iNyBefQROFgm1xUDB5sN35WwX+PqeF57cZu9ZvQRUi6MGA4puw3BmAhqC7ugNQ==
X-Received: by 10.84.217.129 with SMTP id p1mr25280596pli.87.1505745918301;
 Mon, 18 Sep 2017 07:45:18 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w90sm16798002pfi.80.2017.09.18.07.45.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Sep 2017 07:45:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 Sep 2017 07:45:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, joel@jms.id.au,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: Re: [PATCH 2/4] watchdog: aspeed: Fix 'Apseed' typo in Kconfig
Message-ID: <20170918144517.GB11868@roeck-us.net>
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170918054905.16470-3-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 14:45:21 -0000

On Mon, Sep 18, 2017 at 03:19:03PM +0930, Andrew Jeffery wrote:
> Apseed sounds like a good name for a web/mobile start-up incubator, but
> isn't a reflection of Aspeed themselves.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Guenter Rocek <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c722cbfdc7e6..b562d2e03eb9 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -746,7 +746,7 @@ config ASPEED_WATCHDOG
>  	select WATCHDOG_CORE
>  	help
>  	  Say Y here to include support for the watchdog timer
> -	  in Apseed BMC SoCs.
> +	  in Aspeed BMC SoCs.
>  
>  	  This driver is required to reboot the SoC.
>  
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
