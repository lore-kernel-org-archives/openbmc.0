Return-Path: <maxims@google.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn3Rz6p0QzDqZV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 04:52:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hJwyg3Zl"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id 190so1393359itm.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=igYRX6OZxDYx+wfYJK+kjehMpRuToZ3ByD3YiVHsTK0=;
 b=hJwyg3ZlrKId5dPCbDlXti9CVStrkOm3F1991eVChyaeYFewPYsLQrrx77tnJvkzdn
 QEMo2b1QHHXyPOUvNz8XzEltHOga69SdfecxRs1/jV33PlvVzMj4BdWEEt5R7Glgsyaw
 gpb2+UwaoppblqnS4nOv1pR1A79EVlXOSaqzDUbs+9ms2fUoYactxDqYdTZJ7MFbdnNI
 BnEELt20c5Lg4DZzw3fUBS88Nq3eb3SwNscD7f7jdJTSjFiVxdmpr152buuvEvtjX59T
 h58vZ6laJAs462NLkbmyVr0vOZ+xKiSpV6ww70Ta+pgSliID6p+csoC7vxskKnUSSN/K
 RdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=igYRX6OZxDYx+wfYJK+kjehMpRuToZ3ByD3YiVHsTK0=;
 b=Kt8lYZr7oFG/I1c+e3Razbut5zXMlCabLYiCJ1N22Zuy77jL1jpEH3s1xnoN2Ktc5S
 vCSUYJW6Mimt3tGeBcBMGRUo2FlEhNqSiMnc4K636tKMp1dtnMHLW46qjUfMRvT+VyBE
 DaABErUNqu2bcL/WwgOsrDhkCKtRolOvXIgbBLNOq1X5a3grW6zclRN6yvylRt8/rdyu
 zkzejVT2Y8fGMinIT8FoBVPv28Cov7l7niyPvb80lmmEu3F82TGZspuDao6Si9QKG0ll
 n1K5NGHyaYY7+p3kKH1eyuUmbUvYO2U0uN9pXVVSQj0NcVGtPE9BWtkX1Xj4Q3ThC54S
 uPQQ==
X-Gm-Message-State: AFeK/H29S3BeAQ6WiDIoHe5Y6s+n3zix5N2C2bUi/1dT7bDWAnskRiTE+bSmHVgFhr6n7gzrdT7ksRO8ut9XWFW+
X-Received: by 10.107.150.201 with SMTP id y192mr32744613iod.33.1490032332640; 
 Mon, 20 Mar 2017 10:52:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Mon, 20 Mar 2017 10:52:12 -0700 (PDT)
In-Reply-To: <20170320173034.GX19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
 <20170320173034.GX19897@bill-the-cat>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 20 Mar 2017 10:52:12 -0700
Message-ID: <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
To: Tom Rini <trini@konsulko.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rick Altherr <raltherr@google.com>
Content-Type: multipart/alternative; boundary=001a1140ed34e463d4054b2d2fca
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
X-List-Received-Date: Mon, 20 Mar 2017 17:52:16 -0000

--001a1140ed34e463d4054b2d2fca
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <trini@konsulko.com> wrote:

> On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote:
> > On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> > > > Add support for clocks needed by MACs to ast2500 clock driver.
> > > > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> > > > PCLK_MAC2 for MAC1 and MAC2 respectively.
> > > >
> > > > The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> > > > SDK. It is not entirely clear from the datasheet how this clock is
> used
> > > > by MACs, so not clear if the rate would ever need to be different.
> So,
> > > > for now, hardcoding it is probably safer.
> > > >
> > > > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected
> through
> > > > hardware strapping.
> > > >
> > > > So, the network driver would only need to enable these clocks, no
> need
> > > > to configure the rate.
> > > >
> > > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > > ---
> > > >
> > > >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
> > > >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
> > > >  drivers/clk/aspeed/clk_ast2500.c               | 265
> > > ++++++++++++++++++++++---
> > > >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
> > > >  4 files changed, 304 insertions(+), 33 deletions(-)
> > > >
> > > > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
> > > b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > index faeeec1be4..f826646095 100644
> > > > --- a/arch/arm/dts/ast2500-u-boot.dtsi
> > > > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > @@ -61,3 +61,11 @@
> > > >               };
> > > >       };
> > > >  };
> > > > +
> > > > +&mac0 {
> > > > +     clocks = <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> > > > +};
> > > > +
> > > > +&mac1 {
> > > > +     clocks = <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> > > > +};
> > >
> > > Why is this here and not in the main dts file?  The -u-boot.dtsi is for
> > > stuff that's not appropriate in the upstream dts file.  Thanks!
> >
> > There is no clock driver for this part in mainline Linux Kernel yet and I
> > don't know how it will end up being configured. I suspect that they might
> > not use the same bindings though.
> >
> > Should I put this into board specific dts?
>
> So this applies to a lot of parts of the series here.  What we don't
> want to do is have places where the DTS here diverges from the Linux
> kernel DTS and we don't reconcile them.  If the relevant Linux drivers
> are not in mainline, are they at least in linux-next or otherwise
> submitted to the relevant subtrees?
>

No, as far as I know, maybe Rick (cc'ed) knows what is the plan there.

I'm not really working on the linux driver and it's outside of my control.

I can change network driver, so that it does not use this DT configuration
and either hard code clock config into it, or configure it's clocks in
board specific file -- would that be more acceptable?


>
> --
> Tom
>



-- 
*M*axim *S*loyko

--001a1140ed34e463d4054b2d2fca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><di=
v class=3D"h5">On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote=
:<br>
&gt; On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini &lt;<a href=3D"mailto:trini@=
konsulko.com">trini@konsulko.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:<br>
&gt; &gt; &gt; Add support for clocks needed by MACs to ast2500 clock drive=
r.<br>
&gt; &gt; &gt; The clocks are D2-PLL, which is used by both MACs and PCLK_M=
AC1 and<br>
&gt; &gt; &gt; PCLK_MAC2 for MAC1 and MAC2 respectively.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The rate of D2-PLL is hardcoded to 250MHz -- the value used =
in Aspeed<br>
&gt; &gt; &gt; SDK. It is not entirely clear from the datasheet how this cl=
ock is used<br>
&gt; &gt; &gt; by MACs, so not clear if the rate would ever need to be diff=
erent. So,<br>
&gt; &gt; &gt; for now, hardcoding it is probably safer.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The rate of PCLK_MAC{1,2} is chosen based on MAC speed selec=
ted through<br>
&gt; &gt; &gt; hardware strapping.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So, the network driver would only need to enable these clock=
s, no need<br>
&gt; &gt; &gt; to configure the rate.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Maxim Sloyko &lt;<a href=3D"mailto:maxims@goo=
gle.com">maxims@google.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 arch/arm/dts/ast2500-u-boot.<wbr>dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt; &gt; &gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/scu_ast2500.h |=
=C2=A0 62 +++++-<br>
&gt; &gt; &gt;=C2=A0 drivers/clk/aspeed/clk_<wbr>ast2500.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 265<br>
&gt; &gt; ++++++++++++++++++++++---<br>
&gt; &gt; &gt;=C2=A0 include/dt-bindings/clock/<wbr>ast2500-scu.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt;=C2=A0 4 files changed, 304 insertions(+), 33 deletions(-)<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; &gt; b/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; &gt; &gt; index faeeec1be4..f826646095 100644<br>
&gt; &gt; &gt; --- a/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; &gt; &gt; +++ b/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; &gt; &gt; @@ -61,3 +61,11 @@<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&amp;mac0 {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;scu PCLK_MAC1&gt;, =
&lt;&amp;scu PLL_D2PLL&gt;;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&amp;mac1 {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;scu PCLK_MAC2&gt;, =
&lt;&amp;scu PLL_D2PLL&gt;;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt;<br>
&gt; &gt; Why is this here and not in the main dts file?=C2=A0 The -u-boot.=
dtsi is for<br>
&gt; &gt; stuff that&#39;s not appropriate in the upstream dts file.=C2=A0 =
Thanks!<br>
&gt;<br>
&gt; There is no clock driver for this part in mainline Linux Kernel yet an=
d I<br>
&gt; don&#39;t know how it will end up being configured. I suspect that the=
y might<br>
&gt; not use the same bindings though.<br>
&gt;<br>
&gt; Should I put this into board specific dts?<br>
<br>
</div></div>So this applies to a lot of parts of the series here.=C2=A0 Wha=
t we don&#39;t<br>
want to do is have places where the DTS here diverges from the Linux<br>
kernel DTS and we don&#39;t reconcile them.=C2=A0 If the relevant Linux dri=
vers<br>
are not in mainline, are they at least in linux-next or otherwise<br>
submitted to the relevant subtrees?<br></blockquote><div><br></div><div>No,=
 as far as I know, maybe Rick (cc&#39;ed) knows what is the plan there.</di=
v><div><br></div><div>I&#39;m not really working on the linux driver and it=
&#39;s outside of my control.</div><div><br></div><div>I can change network=
 driver, so that it does not use this DT configuration and either hard code=
 clock config into it, or configure it&#39;s clocks in board specific file =
-- would that be more acceptable?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tom<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b=
>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a1140ed34e463d4054b2d2fca--
