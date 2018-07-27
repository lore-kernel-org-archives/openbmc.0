Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::242; helo=mail-wm0-x242.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="OClJkOy4"; 
 dkim-atps=neutral
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cMW13FRGzF0gv
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 18:26:19 +1000 (AEST)
Received: by mail-wm0-x242.google.com with SMTP id s12-v6so4428332wmc.0
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=3V8ZQilmzIHQhm8F9NKK5C8c+ECxkoYffOpav1z8jqg=;
 b=OClJkOy4s+lqyatfgcWs9mPSxxneQux0KUHZ3awrSInI7Zxiq3jW5i6x8I1hbE94hu
 i/I/+mEfmpfomcMESbRndtGftDc6FTAKVWIRXIwIJvcs5sW3BJ4ncevJRsB0HSeXZmhf
 7cAUAyqh5HM9hTScokjob/CmwqjSdm5VFj9oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3V8ZQilmzIHQhm8F9NKK5C8c+ECxkoYffOpav1z8jqg=;
 b=XIPH5XVE3ipbrL6sI4IuVRY4wvwhmLZmD9Ivv4IHMgITN8rJurdlZcmQm3LCyJntaj
 PSw4mZ9d2Gt8Uh6qRuYTMiaGeVo7Z9Hn0r+k0rZK01ISs1YGXLqBLcEAzFWKj4GCYHCU
 pz2vhkU0M7hW0rTBnjY72LdNHGuxACUDK6yhDcwjJbj63lajlfpnjmsSgAc36GSA6v/b
 QC7vF+sRIxzTytJTYzjM2XwVU/1vi+K9StC/KvMz1ffWyUdgLofxcAKuBiA+CBCycIw+
 GbmOudTzg4xVhpRLEoEsUpG9Qhv1xrYMhq5NZM3tBWREtZDgFMCBrWj3aj1ZhT6EEpAK
 o6Dg==
X-Gm-Message-State: AOUpUlFF8iz1Vi6WtrymFayGZxAuCzdF0pliB3n9d+H5FZJJORAjXYqt
 XXRTp9KT7IVPKNwwcPqrO/mKLQ==
X-Google-Smtp-Source: AAOMgpetApUB7IDIo1LveZI6Wa7U/0zO8ubILSK3jAkz8/5NyQArFajrrZTfzeLSwwzRIS20vFYFgQ==
X-Received: by 2002:a1c:6fdd:: with SMTP id
 c90-v6mr3527689wmi.16.1532679975080; 
 Fri, 27 Jul 2018 01:26:15 -0700 (PDT)
Received: from dell (host109-153-79-7.range109-153.btcentralplus.com.
 [109.153.79.7])
 by smtp.gmail.com with ESMTPSA id d26-v6sm2683970wmb.15.2018.07.27.01.26.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Jul 2018 01:26:13 -0700 (PDT)
Date: Fri, 27 Jul 2018 09:26:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v7 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
Message-ID: <20180727082611.GE4628@dell>
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-9-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180723214751.1733-9-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:14 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 08:26:22 -0000

On Mon, 23 Jul 2018, Jae Hyun Yoo wrote:

> This commit adds PECI client MFD driver.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  drivers/mfd/Kconfig                   |  14 ++
>  drivers/mfd/Makefile                  |   1 +
>  drivers/mfd/intel-peci-client.c       | 182 ++++++++++++++++++++++++++
>  include/linux/mfd/intel-peci-client.h |  81 ++++++++++++
>  4 files changed, 278 insertions(+)
>  create mode 100644 drivers/mfd/intel-peci-client.c
>  create mode 100644 include/linux/mfd/intel-peci-client.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f3fa516011ec..e38b591479d4 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -595,6 +595,20 @@ config MFD_INTEL_MSIC
>  	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
>  	  devices used in Intel Medfield platforms.
>  
> +config MFD_INTEL_PECI_CLIENT
> +	bool "Intel PECI client"
> +	depends on (PECI || COMPILE_TEST)
> +	select MFD_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  multi-funtional Intel PECI (Platform Environment Control Interface)
> +	  client. PECI is a one-wire bus interface that provides a communication
> +	  channel from PECI clients in Intel processors and chipset components
> +	  to external monitoring or control devices.
> +
> +	  Additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>  config MFD_IPAQ_MICRO
>  	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
>  	depends on SA1100_H3100 || SA1100_H3600
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2852a6042ecf..29e2cacc58bd 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -203,6 +203,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS)	+= intel-lpss.o
>  obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
>  obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
>  obj-$(CONFIG_MFD_INTEL_MSIC)	+= intel_msic.o
> +obj-$(CONFIG_MFD_INTEL_PECI_CLIENT)	+= intel-peci-client.o
>  obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>  obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
> diff --git a/drivers/mfd/intel-peci-client.c b/drivers/mfd/intel-peci-client.c
> new file mode 100644
> index 000000000000..d7702cf1ea50
> --- /dev/null
> +++ b/drivers/mfd/intel-peci-client.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Intel Corporation
> +
> +#include <linux/bitfield.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/intel-peci-client.h>
> +#include <linux/module.h>
> +#include <linux/peci.h>
> +#include <linux/of_device.h>
> +
> +enum cpu_gens {
> +	CPU_GEN_HSX = 0, /* Haswell Xeon */
> +	CPU_GEN_BRX,     /* Broadwell Xeon */
> +	CPU_GEN_SKX,     /* Skylake Xeon */
> +};
> +
> +static struct mfd_cell peci_functions[] = {
> +	{
> +		.name = "peci-cputemp",
> +		.of_compatible = "intel,peci-cputemp",
> +	},
> +	{
> +		.name = "peci-dimmtemp",
> +		.of_compatible = "intel,peci-dimmtemp",
> +	},
> +};

The more I look at this driver, the less I think it fits into MFD.

What's stopping you from registering these devices directly from DT?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
