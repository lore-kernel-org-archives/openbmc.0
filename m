Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgNPV0K9ZzDsld
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 16:14:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oc8r+Upo; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 107so1009391uah.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WgklbWL3DMDISp1K3ZPJoM4TmSUmOtzli88NcRw1LPs=;
 b=oc8r+UpoLQH81ZN9tkCznKzearWbw7GDwM+DGDOIH6tqXEIvR+vkePNObK4Z1BBMLD
 4GNYtuBtzVH3E2ExqP9mO8PG6qqgWc/j5anPhaIj1CdPn8xKsBQKj8bUyhVC4MaCb2A4
 smSYJaxoxe0O0GvO0C759nUbAj/VkkZWkpLE7dYha6Qxgawr2xzUv5U+dU/WrEb5kd5N
 4VO29Utg1nAWBHsEiyxQYEn6bbbIz9Qsq+xG3Qk1Z/Nuuybs3GBypONjSEhipOg6ytDw
 sSlX+1gN/gBaEPIiBBk2MfuaLGgyruGl+d+/OWh6CyqeQRGT1aEE0WCILhHImm28IbGg
 qLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WgklbWL3DMDISp1K3ZPJoM4TmSUmOtzli88NcRw1LPs=;
 b=WCj0T6SmmW+ngCsiGWTGNDol95qMvYSxBT3c44CDhWvFhJDCRynv0B/9he4A255kT/
 yHLn1s1CS8IC27I0VwdsX5miMGFy5a0TNbKNGSlXPncgnLtcOleH7Xunmdu+i7bO4AKR
 StTVC3YEogDflMHDkcGgKVlKAFI6Gy5nDfmO+xFsVUHwRP8uMdgp/MZJFUcoSuAzUtsP
 yaXWFxz9lSAOlUc9tK2pycLDI4e8BPm2vMc4VkPWJEOZCx8CdEgpvgd05pnnlUCgaEZx
 QkHG1BSsUOPrpCqnjtPkZFhUnIpY8KQygzMJF/z6hlcAYcvG8TtXsDSIlBN55Y281nXF
 3E/g==
X-Gm-Message-State: AE9vXwN7nq2bW74wAjXRJd5CapuWgyJNSGmCK9/AmPJu6rSHnm0El2iFdfJ7Ns93bODhfzvc9qtr/Q6XTvCGXQ==
X-Received: by 10.159.36.177 with SMTP id 46mr3194841uar.78.1474611291560;
 Thu, 22 Sep 2016 23:14:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 23:14:31 -0700 (PDT)
In-Reply-To: <1473921146-19509-1-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 15:44:31 +0930
X-Google-Sender-Auth: oYCh3MLqg-dV6e-oPmbNHkpO3iA
Message-ID: <CACPK8XdYZWn9=KvdVJwrgf_w0verbAGKi0qBnDQgvYCcGvfTEQ@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.7 0/6] iBT interface changes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 23 Sep 2016 06:14:54 -0000

Hi Cedric,

On Thu, Sep 15, 2016 at 4:02 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Hello,
>
> This patchset introduces a couple of changes on the driver for the iBT
> interface on Aspeed SOCs. These were suggested by mainline and have
> some conficts with the OpenBMC userspace. The most important are name
> changes, which impact the btbridge daemon, but nothing is requiring a
> redesign of the stack.
>
> The previous driver is reverted and and reincluded in its mainline
> form. So you should mostly check patch 4 and quickly 5,6. The merge
> in openbmc kernel can wait mainline's green light I think.

Congratulations on getting the bt driver upstream. Another one crossed
off the list (https://github.com/openbmc/linux/wiki).

What are your thoughts on integrating the change in the OpenBMC tree?

With the release of v4.8 around the corner I was thinking we could
move to a dev-4.8 tree, and move to your driver then. This would give
us a chance to synchronise all of the patches with their upstream
versions (gpio, watchdog, bt, pinmux).

Alternative proposals are welcome.

Cheers,

Joel

> You can find the btbridge changes:
>
>      https://github.com/legoater/btbridge
>
> Thanks,
>
> C.
>
>
> Alistair Popple (1):
>   misc: Add Aspeed BT IPMI BMC driver
>
> C=C3=A9dric Le Goater (5):
>   Revert "misc: Add Aspeed BT IPMI host driver"
>   ARM: aspeed: remove previous definitions in default config
>   ARM: dts: aspeed: remove previous iBT definitions
>   ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>   ARM: dts: aspeed: Enable BT IPMI BMC device
>
>  .../bindings/char/ipmi/aspeed,bt-bmc.txt           |  19 +
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
>  arch/arm/configs/aspeed_g4_defconfig               |   3 +-
>  arch/arm/configs/aspeed_g5_defconfig               |   3 +-
>  drivers/char/ipmi/Kconfig                          |   7 +
>  drivers/char/ipmi/Makefile                         |   1 +
>  drivers/char/ipmi/bt-bmc.c                         | 475 +++++++++++++++=
++++++
>  drivers/misc/Kconfig                               |   5 -
>  drivers/misc/Makefile                              |   1 -
>  drivers/misc/bt-host.c                             | 427 ---------------=
---
>  include/uapi/linux/Kbuild                          |   2 +-
>  include/uapi/linux/{bt-host.h =3D> bt-bmc.h}         |  12 +-
>  13 files changed, 515 insertions(+), 444 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,bt=
-bmc.txt
>  create mode 100644 drivers/char/ipmi/bt-bmc.c
>  delete mode 100644 drivers/misc/bt-host.c
>  rename include/uapi/linux/{bt-host.h =3D> bt-bmc.h} (55%)
>
> --
> 2.7.4
>
