Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G53nXNZu"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwpj01rQRzDqjB;
 Tue, 19 Sep 2017 00:45:56 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id j16so356280pga.2;
 Mon, 18 Sep 2017 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OEBXf7j1lyERepXlCMHdDStA1dPvbae7tA0eNSx8r84=;
 b=G53nXNZuH3wk397LOioHvdFH8FOnjGEmy8Xm9jwLygMI+DSR0vct5bjuuwKFmq/1Xx
 f4vV85X4QwosE/Zre0l1B1J/r+Ob6xOnohS7ovMobqp6XXt/q2V8OyFUXfoDggDmU+hq
 oB6uiXwg8dwXYUQKxj/OzsWFSBM2IIsdK67v3kIH+AQhodbfAA5YBmDPDxNGQjzUQnxO
 /HeBkqjNQMZ6k+c71cSSeBKyrdIqQ6+YRND/9v8K5AdZ9b0y/frTk+iuyIyy3XeKJo/A
 vQcuWHgdaRN8zs+nqZ0T4LRbPZre4rCJk16rLrcFq6BqRqFYqZJ/gGjSJvBmKNlQ0MJv
 09vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OEBXf7j1lyERepXlCMHdDStA1dPvbae7tA0eNSx8r84=;
 b=qITHRuPgrLC8AThGIOKcicORvbFUoGq7mhz2ne6irnLu6skLb3dt6RFAqvi/OXM5n+
 qoNQX5xrdum+zqXn8x2ecnAMehzNP0ZA8vxhJ4EOmwQLtoW+aam7thhD2ABSiPBaZb7p
 yEr7DD5qMGv02wL2cFEasmZwkYXnTQoCfwawXubDTGWz2bdQvy+HpUBMJvSdt5HuslV3
 EW86CWX31tyGOadLPD/Lob16ryevZNrDhh+zGD2l78ZlVz+D2m+wEYGUuocR0YJhkJq/
 1+FKmoAj7Jslcc11R2qPgz8cQ3vVRvoT9C2QGKM0KchUs2HtwtSk/3ZqCvxEdlsbBOoN
 nVNA==
X-Gm-Message-State: AHPjjUh5VzIcyAD2wI2o1l3DQ2xhj6GotSHXRcb35U2CZzdYVMoUMmrM
 xLopjfRMUg5Nug==
X-Google-Smtp-Source: AOwi7QDTyp9s2tHlY/ibLWJYSdQORvo6zfUgnhZmKPPiAIFnIkWK6JM7I7HBvfWt7/3qSRJnJqUzHQ==
X-Received: by 10.99.138.73 with SMTP id y70mr5309716pgd.317.1505745954509;
 Mon, 18 Sep 2017 07:45:54 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id m9sm15390205pgt.49.2017.09.18.07.45.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Sep 2017 07:45:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 Sep 2017 07:45:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, joel@jms.id.au,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: Re: [PATCH 3/4] watchdog: aspeed: Remove specific reference to
 AST2400 in Kconfig
Message-ID: <20170918144553.GC11868@roeck-us.net>
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-4-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170918054905.16470-4-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 14:45:56 -0000

On Mon, Sep 18, 2017 at 03:19:04PM +0930, Andrew Jeffery wrote:
> The driver also supports the watchdog in the AST25xx series, and
> may work on earlier SoCs as well.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b562d2e03eb9..a1b92ebe74b6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -741,7 +741,7 @@ config RENESAS_RZAWDT
>  	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>  
>  config ASPEED_WATCHDOG
> -	tristate "Aspeed 2400 watchdog support"
> +	tristate "Aspeed BMC watchdog support"
>  	depends on ARCH_ASPEED || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	help
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
