Return-Path: <robh+dt@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFXelQkA"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fYfX6TrFzF14h;
 Tue, 31 Jul 2018 08:10:28 +1000 (AEST)
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
 [209.85.220.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86BED208B7;
 Mon, 30 Jul 2018 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1532988626;
 bh=tOc1jQB1NfdDC3H4hkPBtE7+My8ugLd7mfpE6xEzx+U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OFXelQkAz5e8E1joTvYAMPAZxAO2mGj1mHrjGaQ3TJqQkQ4bNx38Agba799mY5j/F
 nFTGuJm4loy2rPlh9/zPXXReZIbNoU6wZmrxwYduFHUgasSE7+QpQ6rzKHYbrHp82e
 P3iS9LsjpqnENfXhxMuvWw6cRR5Jy4575/AUbTYc=
Received: by mail-qk0-f179.google.com with SMTP id c126-v6so8934779qkd.7;
 Mon, 30 Jul 2018 15:10:26 -0700 (PDT)
X-Gm-Message-State: AOUpUlGgKI/vq46IEipUuwwazJuxXS6qmEDR0hN5IzrOqmJrQSdU7E0n
 UU7CbofstCMC9U5pf2j4X8ve+Qxddv3ffRKLEw==
X-Google-Smtp-Source: AAOMgpd0iyV4T8Vw4gs3LBL7lY12sMqXqqfcieS6jG0s3zcyAeWJv46+/8uBZdK7PsK4yZh7KGxPZWormVdJMrCwORg=
X-Received: by 2002:ae9:e817:: with SMTP id
 a23-v6mr17520793qkg.213.1532988624453; 
 Mon, 30 Jul 2018 15:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-9-jae.hyun.yoo@linux.intel.com>
 <20180727082611.GE4628@dell>
 <acffdfef-cb20-4208-5297-d94bac5ecb1b@linux.intel.com>
In-Reply-To: <acffdfef-cb20-4208-5297-d94bac5ecb1b@linux.intel.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Jul 2018 16:10:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7WkDOaegwmBDqLkRh0JfCo7O2krONVstjWMUsLiJMrg@mail.gmail.com>
Message-ID: <CAL_JsqL7WkDOaegwmBDqLkRh0JfCo7O2krONVstjWMUsLiJMrg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, darrick.wong@oracle.com,
 sandeen@redhat.com, 
 Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
 kusumi.tomohiro@gmail.com, 
 bryantly@linux.vnet.ibm.com, fbarrat@linux.vnet.ibm.com, 
 David Miller <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, david.kershner@unisys.com, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, jgross@suse.com, 
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 30 Jul 2018 22:10:29 -0000

On Fri, Jul 27, 2018 at 11:36 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Lee,
>
> On 7/27/2018 1:26 AM, Lee Jones wrote:
> > On Mon, 23 Jul 2018, Jae Hyun Yoo wrote:
> >
> >> This commit adds PECI client MFD driver.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> Cc: Lee Jones <lee.jones@linaro.org>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Andrew Jeffery <andrew@aj.id.au>
> >> Cc: James Feist <james.feist@linux.intel.com>
> >> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> >> Cc: Joel Stanley <joel@jms.id.au>
> >> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> >> ---
> >>   drivers/mfd/Kconfig                   |  14 ++
> >>   drivers/mfd/Makefile                  |   1 +
> >>   drivers/mfd/intel-peci-client.c       | 182 ++++++++++++++++++++++++++
> >>   include/linux/mfd/intel-peci-client.h |  81 ++++++++++++
> >>   4 files changed, 278 insertions(+)
> >>   create mode 100644 drivers/mfd/intel-peci-client.c
> >>   create mode 100644 include/linux/mfd/intel-peci-client.h
> >>
> >> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >> index f3fa516011ec..e38b591479d4 100644
> >> --- a/drivers/mfd/Kconfig
> >> +++ b/drivers/mfd/Kconfig
> >> @@ -595,6 +595,20 @@ config MFD_INTEL_MSIC
> >>        Passage) chip. This chip embeds audio, battery, GPIO, etc.
> >>        devices used in Intel Medfield platforms.
> >>
> >> +config MFD_INTEL_PECI_CLIENT
> >> +    bool "Intel PECI client"
> >> +    depends on (PECI || COMPILE_TEST)
> >> +    select MFD_CORE
> >> +    help
> >> +      If you say yes to this option, support will be included for the
> >> +      multi-funtional Intel PECI (Platform Environment Control Interface)
> >> +      client. PECI is a one-wire bus interface that provides a communication
> >> +      channel from PECI clients in Intel processors and chipset components
> >> +      to external monitoring or control devices.
> >> +
> >> +      Additional drivers must be enabled in order to use the functionality
> >> +      of the device.
> >> +
> >>   config MFD_IPAQ_MICRO
> >>      bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
> >>      depends on SA1100_H3100 || SA1100_H3600
> >> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >> index 2852a6042ecf..29e2cacc58bd 100644
> >> --- a/drivers/mfd/Makefile
> >> +++ b/drivers/mfd/Makefile
> >> @@ -203,6 +203,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS)     += intel-lpss.o
> >>   obj-$(CONFIG_MFD_INTEL_LPSS_PCI)   += intel-lpss-pci.o
> >>   obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)  += intel-lpss-acpi.o
> >>   obj-$(CONFIG_MFD_INTEL_MSIC)       += intel_msic.o
> >> +obj-$(CONFIG_MFD_INTEL_PECI_CLIENT) += intel-peci-client.o
> >>   obj-$(CONFIG_MFD_PALMAS)   += palmas.o
> >>   obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
> >>   obj-$(CONFIG_MFD_RC5T583)  += rc5t583.o rc5t583-irq.o
> >> diff --git a/drivers/mfd/intel-peci-client.c b/drivers/mfd/intel-peci-client.c
> >> new file mode 100644
> >> index 000000000000..d7702cf1ea50
> >> --- /dev/null
> >> +++ b/drivers/mfd/intel-peci-client.c
> >> @@ -0,0 +1,182 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +// Copyright (c) 2018 Intel Corporation
> >> +
> >> +#include <linux/bitfield.h>
> >> +#include <linux/mfd/core.h>
> >> +#include <linux/mfd/intel-peci-client.h>
> >> +#include <linux/module.h>
> >> +#include <linux/peci.h>
> >> +#include <linux/of_device.h>
> >> +
> >> +enum cpu_gens {
> >> +    CPU_GEN_HSX = 0, /* Haswell Xeon */
> >> +    CPU_GEN_BRX,     /* Broadwell Xeon */
> >> +    CPU_GEN_SKX,     /* Skylake Xeon */
> >> +};
> >> +
> >> +static struct mfd_cell peci_functions[] = {
> >> +    {
> >> +            .name = "peci-cputemp",
> >> +            .of_compatible = "intel,peci-cputemp",
> >> +    },
> >> +    {
> >> +            .name = "peci-dimmtemp",
> >> +            .of_compatible = "intel,peci-dimmtemp",
> >> +    },
> >> +};
> >
> > The more I look at this driver, the less I think it fits into MFD.
> >
> > What's stopping you from registering these devices directly from DT?
> >
>
> Because DT doesn't allow 2 nodes at the same address so Rob suggested
> MFD for this case.

Only after I first suggested you create cpu and dimm sensors from a
single hwmon driver. Perhaps you should figure out how to fix the
problem with delayed registration. Perhaps you can register the
sensor, but just delay returning actual data until it is ready.

Rob
