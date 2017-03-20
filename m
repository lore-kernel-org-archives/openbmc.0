Return-Path: <raltherr@google.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn7FM4t1hzDqZR
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 07:43:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dhT9jZ8/"; 
 dkim-atps=neutral
Received: by mail-wm0-x229.google.com with SMTP id u132so73066755wmg.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rj7CYFfbepobPg/Nm1cE/PVAhveoskLOQ9B57M7vtGE=;
 b=dhT9jZ8/Nb+sUeJt5kZjaY83y0fquLtHZE4VTLdzBpFB9uFtmXL/tZayGobKnZ23OB
 dacPjApdpqH5wl4iMqOAL1Seshl/0fe3/iFtKKyNcynHJuX4WUQS2MZuJaHV7A0YWvB4
 CoC1nSgFelDXWchnXt49VhSbUE0PZRagHtF/Th0RFliYZm0kAZGpP2w3aXoG0mTbFJQR
 SOz49T8/wU4IbrhwmXbtHljFtc7bOzLVWcgPMSQS+coCPniJ4DmbUo0pjA61xxkRNTrJ
 Ocuar2ZCdNAaCwYb2hQzszeExkKnsRBKXQc+iym/40RCkELEr1Dj/I7RVuXvBcRL36YZ
 el+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rj7CYFfbepobPg/Nm1cE/PVAhveoskLOQ9B57M7vtGE=;
 b=dhJqK4Vyp968HzCzZh/4NRmDZdMnIF7v7bur+VM03gi5xjsgbI6YDXFUiM6GIX08+3
 +QwKL3B2fMryCmJ3OLJj0wDZ8Yr/6bmd7fqBEJUxyVlSAP+SjsdDOa6SZ1tPBDgC4fBw
 bt/cgJjUkUF3Ktks1tbBx0+2eLtIUoBvqWu6x2q3izDd54brX8iWkwtCQwv3QTW1OxdZ
 XCTXz4X8xwznbN4ZnJY5xw7K8nwVT+YYtX3551oFmPtNVhmPZa12S6fEQ/moJE7QcYgF
 3jQpatpUFZd26vKSjBQdJaynrS9DEt0LP1aZn9qyInSIwFAbWsee/Hh20yPYV9us19J2
 rc0A==
X-Gm-Message-State: AFeK/H0DxtWEwRicwPATK6VHo0LXPwYWAt4hhh5z3lLRovqlX1fNtqNB8jm1pR4qtIaN/lhddeYskLvGQLODZRiL
X-Received: by 10.28.9.213 with SMTP id 204mr12334685wmj.89.1490042593890;
 Mon, 20 Mar 2017 13:43:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Mon, 20 Mar 2017 13:43:13 -0700 (PDT)
In-Reply-To: <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
 <20170320173034.GX19897@bill-the-cat>
 <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 20 Mar 2017 13:43:13 -0700
Message-ID: <CAPLgG==Ommast2gz38UXtEmLhO0EziJw6HKbU5J2NRFyh9K7uQ@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
To: Maxim Sloyko <maxims@google.com>
Cc: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
 Simon Glass <sjg@chromium.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Mon, 20 Mar 2017 20:43:20 -0000

+Joel

On Mon, Mar 20, 2017 at 10:52 AM, Maxim Sloyko <maxims@google.com> wrote:
>
>
> On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <trini@konsulko.com> wrote:
>>
>> On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote:
>> > On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > > On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
>> > > > Add support for clocks needed by MACs to ast2500 clock driver.
>> > > > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
>> > > > PCLK_MAC2 for MAC1 and MAC2 respectively.
>> > > >
>> > > > The rate of D2-PLL is hardcoded to 250MHz -- the value used in
>> > > > Aspeed
>> > > > SDK. It is not entirely clear from the datasheet how this clock is
>> > > > used
>> > > > by MACs, so not clear if the rate would ever need to be different.
>> > > > So,
>> > > > for now, hardcoding it is probably safer.
>> > > >
>> > > > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected
>> > > > through
>> > > > hardware strapping.
>> > > >
>> > > > So, the network driver would only need to enable these clocks, no
>> > > > need
>> > > > to configure the rate.
>> > > >
>> > > > Signed-off-by: Maxim Sloyko <maxims@google.com>
>> > > > ---
>> > > >
>> > > >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
>> > > >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
>> > > >  drivers/clk/aspeed/clk_ast2500.c               | 265
>> > > ++++++++++++++++++++++---
>> > > >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
>> > > >  4 files changed, 304 insertions(+), 33 deletions(-)
>> > > >
>> > > > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
>> > > b/arch/arm/dts/ast2500-u-boot.dtsi
>> > > > index faeeec1be4..f826646095 100644
>> > > > --- a/arch/arm/dts/ast2500-u-boot.dtsi
>> > > > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
>> > > > @@ -61,3 +61,11 @@
>> > > >               };
>> > > >       };
>> > > >  };
>> > > > +
>> > > > +&mac0 {
>> > > > +     clocks = <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
>> > > > +};
>> > > > +
>> > > > +&mac1 {
>> > > > +     clocks = <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
>> > > > +};
>> > >
>> > > Why is this here and not in the main dts file?  The -u-boot.dtsi is
>> > > for
>> > > stuff that's not appropriate in the upstream dts file.  Thanks!
>> >
>> > There is no clock driver for this part in mainline Linux Kernel yet and
>> > I
>> > don't know how it will end up being configured. I suspect that they
>> > might
>> > not use the same bindings though.
>> >
>> > Should I put this into board specific dts?
>>
>> So this applies to a lot of parts of the series here.  What we don't
>> want to do is have places where the DTS here diverges from the Linux
>> kernel DTS and we don't reconcile them.  If the relevant Linux drivers
>> are not in mainline, are they at least in linux-next or otherwise
>> submitted to the relevant subtrees?
>
>
> No, as far as I know, maybe Rick (cc'ed) knows what is the plan there.
>
> I'm not really working on the linux driver and it's outside of my control.
>

Looks like the Aspeed SDK version of U-Boot was configuring D2PLL as
part of platform_g5.S
(https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/arch/arm/mach-aspeed/platform_g5.S).
OpenBMC kernel doesn't seem to have any clock drivers for these PLLs.
I assume that since they were enabled by U-Boot, the ftgmac100 driver
doesn't need to do anything for it to work.  It should be
straightforward to follow the pattern of the other clock drivers in
https://github.com/openbmc/linux/blob/dev-4.7/arch/arm/boot/dts/aspeed-g5.dtsi
and create a new driver for D2PLL.

> I can change network driver, so that it does not use this DT configuration
> and either hard code clock config into it, or configure it's clocks in board
> specific file -- would that be more acceptable?
>
>>
>>
>> --
>> Tom
>
>
>
>
> --
> Maxim Sloyko
