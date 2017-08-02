Return-Path: <rdunlap@infradead.org>
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMxxg2Z6rzDqgY
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 01:31:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ueV4SFt8"; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=37aDX8RRFOqIIpVqeI+xvs0AY39+AxHqgeQ43xryCrk=; b=ueV4SFt8/9vdtdgSVzp4lNxf1W
 OQOJUX5NR97ssi0E0fJKJ46JxGT0Rfzg17wJZIQcj1U3aN6YXW7XkXcsTK8FEzakGAUUHcnnPJsL3
 CQCE4lV/+mTT61bkgtTpzRDKt4sxrtxy5XyCH/Ua9xAS5SExLJLcZZ2NJkXr99FTzKZxldAudCHoP
 i4gn9rWAi2DNwCsL60Ho2IT+uSahXSWmPYOJ6tb3z2PaQip6ycv5VNC5I0SS7XgC0WE6olfKac2io
 z2M86I4pHSfZQ7DC3lIXGm5EKCj485jfYVUkJnxozccixltHt0tS72Bcxe2rsvijHc5kR2MbRceq+
 bfNe1kWQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlap)
 by merlin.infradead.org with esmtpsa (Exim 4.87 #1 (Red Hat Linux))
 id 1dcvcT-0007t1-IQ; Wed, 02 Aug 2017 15:31:34 +0000
Subject: Re: [patch v1 2/2] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 Jiri Pirko <jiri@mellanox.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ce3c9f04-1651-8b59-839e-e27783b222ff@infradead.org>
Date: Wed, 2 Aug 2017 08:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Aug 2017 15:27:38 +1000
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
X-List-Received-Date: Wed, 02 Aug 2017 15:31:53 -0000

On 08/02/2017 06:18 AM, Oleksandr Shamray wrote:
> 
> diff --git a/drivers/jtag/Kconfig b/drivers/jtag/Kconfig
> index a8d0149..7bf709c 100644
> --- a/drivers/jtag/Kconfig
> +++ b/drivers/jtag/Kconfig
> @@ -16,3 +16,16 @@ menuconfig JTAG
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called jtag.
>  
> +menuconfig JTAG_ASPEED
> +	tristate "Aspeed SoC JTAG controller support"
> +	depends on JTAG
> +	---help---
> +	  This provides a support for Aspeed JTAG device, equipped on
> +	  Aspeed SoC 24xx and 25xx families. Drivers allows programming
> +	  of hardware devices, connected to SoC through the JTAG interface.
> +
> +	  If you want this support, you should say Y here.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called aspeed_jtag.

In the Makefile, it looks like it is called jtag-aspeed.

> +
> diff --git a/drivers/jtag/Makefile b/drivers/jtag/Makefile
> index e811330..e9fa7fa 100644
> --- a/drivers/jtag/Makefile
> +++ b/drivers/jtag/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_JTAG)		+= jtag.o
> +obj-$(CONFIG_JTAG_ASPEED)	+= jtag-aspeed.o


-- 
~Randy
