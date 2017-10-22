Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r0utC/o+"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yKl2T40r2zDqZr;
 Mon, 23 Oct 2017 03:13:36 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id 17so15373828pfn.12;
 Sun, 22 Oct 2017 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YEoAkLjiVHgq18kgrTs+tlq9khcKCAlCRxYoRSXcZVc=;
 b=r0utC/o+dphop5ooGVf/PelK9SYjJPvcI4vZVLBrSuygCasieZIetkz2yQniu6z4Xd
 xJhrrFje+MYxIloyuUBa0pf6HLOSJZvevd1PXv8uIpp5P502N2ysLZRlJvOoNklRWjzn
 vjnCVi6/ihmWgbtXJOYWXR0ab98zxyX6ZzBmSm+/lWzIPh6n6RclfjI69G/lyKTl1/Ll
 bO2Jf5KmVUhcKnF//VWFiVqVRn3e7XQy08mUE0P9WpJ98YpHf4nFRzIwt3O3ggF8MnM5
 kQ1pCZ45eoFXt4cLrOzv1CQBvVshEfVoCi/SIVBdsmXJRVEYxQtA8QkxhRlVQn8dEXNM
 Yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YEoAkLjiVHgq18kgrTs+tlq9khcKCAlCRxYoRSXcZVc=;
 b=e2RVfBM5fO6YcqCH/ZbFsf8NenuvU1ZC31QE/2LeGvN49y9uoJ5UJNB6JphkPE+KIX
 VsYdsXsAXhKqCBR5AB2Q9McWZ83KK1Cj9a0wd+LZn6wtqDS+b2GcSA52IGd68oiptekM
 cHcbBUusGv2UtWK6FNsMP+dkeIoWxVnnRAouaTKNsK7GkiOEZmOq6KN3Et8G3cV/QoqF
 PlhHh/Gr+rUHzbqyQqx5Fjuq/E8fSCzWxu8WDV/fr5wK3O+soScNVWC+5fFEKb0ferGG
 fRgLfYkSkB1SR1F9+fQKEUH/wmOD9c/BKXeq5C7ZmTFc2X19d8gF8DHua76BoaiMyBVv
 tNhQ==
X-Gm-Message-State: AMCzsaUh0s6Hv9Lf32gDiGg2EdORVrZjygxdRmvMNlkn+yOt8i2NTjW6
 NVGkWhsZvTFA9VYmPQXVwkQ=
X-Google-Smtp-Source: ABhQp+Tf5tAkQkViZPJbHU7hHcZmnJ6EwnU5Xk5qjNO/xzPoZgeHh8B3srhGHdtTaRJ8xwQyTZo1XA==
X-Received: by 10.98.53.196 with SMTP id c187mr10769637pfa.38.1508688814769;
 Sun, 22 Oct 2017 09:13:34 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id q2sm7456630pgp.81.2017.10.22.09.13.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Oct 2017 09:13:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Oct 2017 09:13:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, joel@jms.id.au,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: Re: [v2,4/4] watchdog: aspeed: Move init to arch_initcall
Message-ID: <20171022161333.GA20816@roeck-us.net>
References: <20170920053020.6860-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170920053020.6860-5-andrew@aj.id.au>
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
X-List-Received-Date: Sun, 22 Oct 2017 16:13:38 -0000

On Wed, Sep 20, 2017 at 03:00:20PM +0930, Andrew Jeffery wrote:
> Probing at device_initcall time lead to perverse cases where the
> watchdog was probed after, say, I2C devices, which then leaves a
> potentially running watchdog at the mercy of I2C device behaviour and
> bus conditions.
> 
> Load the watchdog driver early to ensure that the kernel is patting it
> well before initialising peripherals.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

At some point we'll need to come up with a generic means to handle those
situations. Until then, I don't have a better idea.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 6c6dd3f4c48d..ca5b91e2eb92 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -316,7 +316,18 @@ static struct platform_driver aspeed_watchdog_driver = {
>  		.of_match_table = of_match_ptr(aspeed_wdt_of_table),
>  	},
>  };
> -module_platform_driver(aspeed_watchdog_driver);
> +
> +static int __init aspeed_wdt_init(void)
> +{
> +	return platform_driver_register(&aspeed_watchdog_driver);
> +}
> +arch_initcall(aspeed_wdt_init);
> +
> +static void __exit aspeed_wdt_exit(void)
> +{
> +	platform_driver_unregister(&aspeed_watchdog_driver);
> +}
> +module_exit(aspeed_wdt_exit);
>  
>  MODULE_DESCRIPTION("Aspeed Watchdog Driver");
>  MODULE_LICENSE("GPL");
