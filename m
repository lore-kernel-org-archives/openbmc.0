Return-Path: <maxims@google.com>
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn9mY19BRzDq5g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 09:37:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UIY+KANT"; 
 dkim-atps=neutral
Received: by mail-io0-x232.google.com with SMTP id f84so38869895ioj.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DSov6OuGz1lcI2qvt3exHDgVLI5szvSPa0gOn9ZdpQU=;
 b=UIY+KANTh97vB1jaltaIH0/AP+Y5Vr4fhDd/2uAJpNCdg9JAjj5+ARuKIhyfLNVbuE
 EDjjKeBKKI9a9ep9HgCq3+edJRm3zAKt0X5vr57RLiJZS+6AoAPhCRgoX/Zr1m5/k9ST
 qB/sU06goo3yfeabBBsU56RdJX4SVbrdkZLZXyKVyA0CDkOWaKYwm69nRlcnGfbmUkjq
 DkU5zGA8qT+9r6DrU2jQskZllwhh2FJ/oGVDmiSgOG5b7eTyEO6/Bvf1mjmfW4UBbagQ
 OnSc0OJGxDeOcbn2kdNBGtIvQrW0vFFHO0R9uKt65x1oQCcBF76eZTLD1G6ArUgBdGdA
 YUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DSov6OuGz1lcI2qvt3exHDgVLI5szvSPa0gOn9ZdpQU=;
 b=BFiTE9L/6L5lgNTmWJkB6jD6wHN6KrooO60um9q/SQ2uCZ+jp/P8hSlIVfqJa2twrU
 Ox6g9QOZbxR/TL+9Blyusrn/2S+ZGgR/TcYZ847+not1pp+GpN6URN5HTuDT4/8XtK5Q
 Khdp907QMzM3OLL/7HqOyDyUbN0h426lUUdwaVMWbD2gp84pryTkGfhcawGvDZwf0ARm
 LVbkqfhpJESmGR9BmOksPhkjP0g1S9hLkKtsGrpnRincysVIq/dPKB4fKArFhXBx2k4b
 cPIzPIkArBP5sBEFKN3BCkjFatlZghefyjROp/udFnKIila8EL1Jc/K6hze2asSVawpC
 0S/w==
X-Gm-Message-State: AFeK/H0Ms8CNU70WjqXH7wmxTaL7xn3EeMpUtYEsXTlTl3WkiArjJeK6SAhW1crrCnEYtloDvP5K0AlmIHj6/zO+
X-Received: by 10.107.32.199 with SMTP id g190mr6263590iog.117.1490049418348; 
 Mon, 20 Mar 2017 15:36:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Mon, 20 Mar 2017 15:36:57 -0700 (PDT)
In-Reply-To: <20170320194821.GY19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
 <20170320173034.GX19897@bill-the-cat>
 <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
 <20170320194821.GY19897@bill-the-cat>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 20 Mar 2017 15:36:57 -0700
Message-ID: <CAFR_W8oqKeLwbZLLj6rrNo8jgyGKW2Lbw5XdnE=7XTLUWoPkBw@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 20 Mar 2017 22:37:01 -0000

On Mon, Mar 20, 2017 at 12:48 PM, Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Mar 20, 2017 at 10:52:12AM -0700, Maxim Sloyko wrote:
> > On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote:
> > > > On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > > On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> > > > > > Add support for clocks needed by MACs to ast2500 clock driver.
> > > > > > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> > > > > > PCLK_MAC2 for MAC1 and MAC2 respectively.
> > > > > >
> > > > > > The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> > > > > > SDK. It is not entirely clear from the datasheet how this clock is
> > > used
> > > > > > by MACs, so not clear if the rate would ever need to be different.
> > > So,
> > > > > > for now, hardcoding it is probably safer.
> > > > > >
> > > > > > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected
> > > through
> > > > > > hardware strapping.
> > > > > >
> > > > > > So, the network driver would only need to enable these clocks, no
> > > need
> > > > > > to configure the rate.
> > > > > >
> > > > > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > > > > ---
> > > > > >
> > > > > >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
> > > > > >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
> > > > > >  drivers/clk/aspeed/clk_ast2500.c               | 265
> > > > > ++++++++++++++++++++++---
> > > > > >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
> > > > > >  4 files changed, 304 insertions(+), 33 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > > index faeeec1be4..f826646095 100644
> > > > > > --- a/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > > @@ -61,3 +61,11 @@
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > +
> > > > > > +&mac0 {
> > > > > > +     clocks = <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> > > > > > +};
> > > > > > +
> > > > > > +&mac1 {
> > > > > > +     clocks = <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> > > > > > +};
> > > > >
> > > > > Why is this here and not in the main dts file?  The -u-boot.dtsi is for
> > > > > stuff that's not appropriate in the upstream dts file.  Thanks!
> > > >
> > > > There is no clock driver for this part in mainline Linux Kernel yet and I
> > > > don't know how it will end up being configured. I suspect that they might
> > > > not use the same bindings though.
> > > >
> > > > Should I put this into board specific dts?
> > >
> > > So this applies to a lot of parts of the series here.  What we don't
> > > want to do is have places where the DTS here diverges from the Linux
> > > kernel DTS and we don't reconcile them.  If the relevant Linux drivers
> > > are not in mainline, are they at least in linux-next or otherwise
> > > submitted to the relevant subtrees?
> > >
> >
> > No, as far as I know, maybe Rick (cc'ed) knows what is the plan there.
> >
> > I'm not really working on the linux driver and it's outside of my control.
> >
> > I can change network driver, so that it does not use this DT configuration
> > and either hard code clock config into it, or configure it's clocks in
> > board specific file -- would that be more acceptable?
>
> For all the cases where you don't have the DT portion itself upstream
> yet, go with platdata instead for now.  Unless I'm mis-recalling things
> that is.


Sorry, I don't quite follow.

My understanding is that platdata is supposed to be used as a
substitute for DT nodes, but in this case there is a node for MAC
present in upstream linux device tree, it's just that one specific
option that needs to be different. Is there an overwrite mechanism
that is platdata based?

What I was thinking about is changing the driver so that instead of
reading the clock configuration from DT it would use clock ids based
on device's sequence number, i.e. mac0 would use PCLK_MAC0, mac1 would
use PCLK_MAC1. Same for I2C.

>
>
> --
> Tom




-- 
Maxim Sloyko
