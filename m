Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5xh12nKzDvHV
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:15:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WRfCUqyj; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 83so6263405vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=t2ryn7rPgSgwl5kVOO/IEDzbNID3+VGEbbUT+YAzwAM=;
 b=WRfCUqyjEJTEFQlDmUpQnWzQYN0i66ZSbTsch9UfoXDhC1yMGUfdU9a7We4rmVZWYt
 bLkyYJ0t89707UsCZrSRfiDH2ctiShzUJ9WuBLqAkDxztTvRxxRfxb9O3wFeLHvloRDm
 iYNAgEPFV0b/bjocug2iSREbYsrt1cF3ismeTJmIDxlHbRRn3qftEv8IMDRD2zHbbDqw
 SeequcWOlN+tkheR7U7sqnprqTLB67neOxKjFg42yizD7aGa1ecCtiJhqInZPEa/N/Ql
 YE88/fppay/AaAqtqbf8XY7t3M+OsZyPbUYwK73eZymzMfgkFsDvwL1H6mclB/SmFSTl
 8kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=t2ryn7rPgSgwl5kVOO/IEDzbNID3+VGEbbUT+YAzwAM=;
 b=eSVcejYBqYr1rK/Jul37TNJQxcrXBVUIZ8FUmMuU3H+Jhx88fRBMXB9lSQCfDQw9/i
 XH5+S9P/+30VOFHeFhfp/D25esXwl+qo/Ck4MFDENcwMxKfAr2wMmxGuZHhuJWM1kvh1
 5+rzouQE3SENXGo8rUAWbTmSVz44iBz9kr1iSlr0lfpNX87UWi/DC73M04Hd9tDJKHYf
 mzYUtoVknwZKwYenCHiL7EYQ5orcv+YkYiYe/pFzIvyi8z2Jsc42aQcQAyGnbC0i/hgb
 lYRxykqkkjIhXCGSj3zOrrixAH8cWBUF3TeoQNDaDNUkzMAmCAq4zJGacLsFWpxynXEB
 YmXQ==
X-Gm-Message-State: AA6/9Rn8PZ7ccK44RF70bnSCZQ3E6j0KYn3x/xx9vzV80v3NBJXaisfiJH6jlyvFJVvfQ4xyyVIyB6S1RNGNQw==
X-Received: by 10.31.102.6 with SMTP id a6mr13684561vkc.151.1476681318265;
 Sun, 16 Oct 2016 22:15:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:14:57 -0700 (PDT)
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:44:57 +1030
X-Google-Sender-Auth: tAjX56Hnzgan7J15CqwFPzs49vU
Message-ID: <CACPK8Xf45-cxbmeX68bY1fCK-Fy0++vW2JkE1_Oo-E7uE5au9A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 00/12] aspeed-smc: add support for AST2500
 and DMA transfers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:15:20 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Hello,
>
> This patchset adds to the current aspeed SMC driver the register
> settings enabling support for the AST2500. Some initial work is done
> on the segment registers to provide a better configuration of the
> mapping windows on the flash modules but this area clearly needs more
> work to be solid.

Thanks for sending these out. I have a few comments that I'll give you
a chance to respond to, but then we will apply this to dev-4.7 so
teams who require flash support have it ready to go.

At that point, I suggest we send it upstream for comment in it's current st=
ate.

Cheers,

Joel

>
> Also, a first version of DMA read/write is provided. But the speed
> results are not very satisfying so they are disabled by default. You
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (7):
>   ARM: dts: aspeed-g5: update ast2500 evb with new spi-nor binding
>   mtd: spi-nor: aspeed: make locking more explicit
>   mtd: spi-nor: aspeed: introduce a device under aspeed_smc_controller
>   mtd: spi-nor: aspeed: add DMA support to smc controller
>   ARM: dts: aspeed: update SMC controller nodes supporting DMAs
>   mtd: spi-nor: aspeed: use property "aspeed,fmc-has-dma"
>   mtd: spi-nor: aspeed: use fast read when doing DMAs
>
> Milton Miller (5):
>   mtd: spi-nor: support for Aspeed AST2500 SoC
>   mtd: spi-nor: aspeed: Manage the segment address registers
>   mtd: spi-nor: Add Micronix mx66l1g45g spi flash
>   ARM: dts: aspeed-g5: update for new spi-nor binding
>   ARM: dts: aspeed-g5: update witherspoon for new spi-nor binding
>
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  32 +-
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  28 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   2 +
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  28 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  65 +++
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 449 +++++++++++++++=
++----
>  drivers/mtd/spi-nor/spi-nor.c                      |   1 +
>  7 files changed, 499 insertions(+), 106 deletions(-)
>
> --
> 2.7.4
>
