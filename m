Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0bXJ5cbxzDvQB
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:35:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=edAA+rqX; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id e203so9721685itc.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xpUqdikd6w8fp0/Cd0pjar+whPXgxYdrjhGKQDUUfV4=;
 b=edAA+rqXnrXPT7rkZfawWBBt17eTChSqBfTs2sVtE9W9dwv+92H+mC2c5m1wCVaOvI
 AHa4cevP8Dg2Oihp0KJtAYn+FQvwZjoTI763tMeHnXEP1piwF3RnVt6Pl5tgHocvDJQF
 5T1o7Yo6pHymcgwuetynSlfSMBy8ii+V6NkrP+ae5Q95Mdzq4OqbG8ax5j30yaPQ70rV
 49g3XWLCanoEsM01SI/LYJeyns28/B9GD7CFQM+X+9o0AynsSmpU0DuqZ9Q/UXcl8MxO
 dNvv1MX0StoKLTcefiGVHoCswn68B/g1CKfRCewDzxKkr1+OxuAHWOgIT3rRtv29pbUz
 95JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xpUqdikd6w8fp0/Cd0pjar+whPXgxYdrjhGKQDUUfV4=;
 b=SU6tciALS+0Hu5Ps7xhDFwETdLsQxdJzGoanE0WCL+d15gKj9YSWe/Tbl2NY7ht4HU
 QWbecTZd7DoRBv4zfE5OUoTve2kJPxH6LZ1TqhCmDrtQxyb/qi/PQZQdUzEz7Evw689l
 S+/aw5Uz7rLZWKOeTdxhufsk84URg2D8Qx4vb8oTB8Jajx8b0S0DUO6WCt/kj3qnBM+4
 ekXiSHK9i+UdUCvI7FiG+5KeAoMbyNggyHZJu4orypiGx5ppo+71jiqFM3PLJzAIiafb
 IvyvXyc4mkhEtqbiMhBLpbjU4oBImUPjRY0foiz+LCCgHjE7f3xR1SIL5sA4FCOK9oKq
 h9sg==
X-Gm-Message-State: AA6/9RmbeQIAjcy1PlAVsyPev2m7wNs6bUl4DaHyi8iemTV1rM4HuREqtsEM5GjdXAu38vhKvnMR80J0uZ1HLQ==
X-Received: by 10.202.94.7 with SMTP id s7mr9076574oib.134.1477031726573; Thu,
 20 Oct 2016 23:35:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 23:35:06 -0700 (PDT)
In-Reply-To: <1477028690-27239-1-git-send-email-clg@kaod.org>
References: <1477028690-27239-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 17:05:06 +1030
X-Google-Sender-Auth: DADAlopkG5VNUwCgYigNyZS0fdA
Message-ID: <CACPK8Xc-AoL_vagpZovRbowwjer+c6ac2mGVZE=0g6DnAeWNKA@mail.gmail.com>
Subject: Re: [PATCH linux dev4.7 v2 0/9] aspeed-smc: add support for AST2500
 and DMA transfers
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
X-List-Received-Date: Fri, 21 Oct 2016 06:35:29 -0000

On Fri, Oct 21, 2016 at 4:14 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Hello,
>
> This patchset adds to the current aspeed SMC driver the register
> settings enabling support for the AST2500. Some initial work is done
> on the segment registers to provide a better configuration of the
> mapping windows on the flash modules but this area clearly needs more
> work to be solid.
>
> Also, a first version of DMA read/write is provided. But the speed
> results are not very satisfying so they are disabled by default. You
>
> Thanks,
>
> C.
>
> Changes since v1:
>
>  - included a first revert of the current driver
>  - merged all the difference in one patch to be sent to mainline
>  - added a pinctrl fix for the witherspoon.

Series applied to dev-4.7 as of d676d5ee0e1b3b5e774c2d61d2c9a760f5df78b0.

Cheers,

Joel

>
> C=C3=A9dric Le Goater (6):
>   Revert "mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs"
>   mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
>   ARM: dts: aspeed-g5: update ast2500 evb with new spi-nor binding
>   mtd: spi-nor: aspeed: add DMA support to smc controller
>   ARM: dts: aspeed: update SMC controller nodes supporting DMAs
>   ARM: dts: witherspoon: use spi1debug pinctrl group
>
> Milton Miller (3):
>   mtd: spi-nor: Add Micronix mx66l1g45g spi flash
>   ARM: dts: aspeed-g5: update for new spi-nor binding
>   ARM: dts: aspeed-g5: update witherspoon for new spi-nor binding
>
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  37 +-
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  28 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   2 +
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  31 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  65 ++
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 655 +++++++++++++++=
++----
>  drivers/mtd/spi-nor/spi-nor.c                      |   1 +
>  7 files changed, 665 insertions(+), 154 deletions(-)
>
> --
> 2.7.4
>
