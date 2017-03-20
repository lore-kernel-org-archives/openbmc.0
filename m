Return-Path: <maxims@google.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn2qq1QKVzDqZW
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 04:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Un4aZnSY"; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id y18so43763667itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XiKZmKcFmXOe/uj7/tsKLWgl8vUiKKvonCGxjuZrlC0=;
 b=Un4aZnSY+s5zRb/0nlMNrYT6gUsflh+Shprsc0EbxKA6z+ERGnsmxKIZn2HcXtnBZf
 P7C5esFy6BdkXwaw9xmPw/8aWit4axtqTFhFcBvX5Xlm0nA8BdZSpUS0VylrDKy2pT9z
 BUpXb2sdLYoPl6Qcw3GInuHagGGo7poh0G0KjlPxqRC6NF12iclkRNRBrShLEKKM3IUf
 HLK1Fo/KqLXsph6aUa3cxGrsmN8oMh8RLuVcDFOwPKdvurKPqJS6Ea5X6htB4A9T424U
 b9bSL6+nfBw2/6Y3+v5Tem0c2KUm3UI/Bje7rEqCeztd+tN6Ha7aao+IVMw5dc4rITUo
 W62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XiKZmKcFmXOe/uj7/tsKLWgl8vUiKKvonCGxjuZrlC0=;
 b=PMQDvoL8F/LhwguHwTlXs1S+v9/AT2c020Rr2C5xSo7KVoWrWf1GLr/0h0xWoBTMyA
 qaTDEFDoxFBsG7AkpmcX6NCySup3MN4OJ2CTDFOZGZcu4fpeaErU4Os7Jv+QoYQhsU/6
 Vue2quR5WvKLQQSgt2uDEHCOkIUyRj+6kd20H8CijBs7LibG9W3K+kqn9By8sWgYGpSd
 wqCh+9j5Ci/OWAmx0oD03Yk0wxaLilsKTiB1T5neTbgLIGoScgmTYSc5x+OMlOPZ0Ej8
 vORKS9u3jermHSUwO5L15yWojfSS4NqjzyirCc2uTBKOWtTY/134QfZNt6vxAWw3lYRM
 SvlA==
X-Gm-Message-State: AFeK/H11XMNeMZQwZfjrK5T9idnDXicBO8XRmRAPEm48isf3hVxds1L1ImHy0M+aI1uKRrBW2BlZlhqGGaVgJuHu
X-Received: by 10.107.150.201 with SMTP id y192mr32606753iod.33.1490030661056; 
 Mon, 20 Mar 2017 10:24:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Mon, 20 Mar 2017 10:24:20 -0700 (PDT)
In-Reply-To: <20170319164217.GN19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 20 Mar 2017 10:24:20 -0700
Message-ID: <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
To: Tom Rini <trini@konsulko.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1140ed34420572054b2cccb8
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
X-List-Received-Date: Mon, 20 Mar 2017 17:24:24 -0000

--001a1140ed34420572054b2cccb8
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:

> On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> > Add support for clocks needed by MACs to ast2500 clock driver.
> > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> > PCLK_MAC2 for MAC1 and MAC2 respectively.
> >
> > The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> > SDK. It is not entirely clear from the datasheet how this clock is used
> > by MACs, so not clear if the rate would ever need to be different. So,
> > for now, hardcoding it is probably safer.
> >
> > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected through
> > hardware strapping.
> >
> > So, the network driver would only need to enable these clocks, no need
> > to configure the rate.
> >
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > ---
> >
> >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
> >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
> >  drivers/clk/aspeed/clk_ast2500.c               | 265
> ++++++++++++++++++++++---
> >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
> >  4 files changed, 304 insertions(+), 33 deletions(-)
> >
> > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
> b/arch/arm/dts/ast2500-u-boot.dtsi
> > index faeeec1be4..f826646095 100644
> > --- a/arch/arm/dts/ast2500-u-boot.dtsi
> > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> > @@ -61,3 +61,11 @@
> >               };
> >       };
> >  };
> > +
> > +&mac0 {
> > +     clocks = <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> > +};
> > +
> > +&mac1 {
> > +     clocks = <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> > +};
>
> Why is this here and not in the main dts file?  The -u-boot.dtsi is for
> stuff that's not appropriate in the upstream dts file.  Thanks!
>

There is no clock driver for this part in mainline Linux Kernel yet and I
don't know how it will end up being configured. I suspect that they might
not use the same bindings though.

Should I put this into board specific dts?


>
> --
> Tom
>



-- 
*M*axim *S*loyko

--001a1140ed34420572054b2cccb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <span dir=3D"ltr">&lt;<a href=
=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div=
 class=3D"h5">On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:=
<br>
&gt; Add support for clocks needed by MACs to ast2500 clock driver.<br>
&gt; The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and<br=
>
&gt; PCLK_MAC2 for MAC1 and MAC2 respectively.<br>
&gt;<br>
&gt; The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed<=
br>
&gt; SDK. It is not entirely clear from the datasheet how this clock is use=
d<br>
&gt; by MACs, so not clear if the rate would ever need to be different. So,=
<br>
&gt; for now, hardcoding it is probably safer.<br>
&gt;<br>
&gt; The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected throug=
h<br>
&gt; hardware strapping.<br>
&gt;<br>
&gt; So, the network driver would only need to enable these clocks, no need=
<br>
&gt; to configure the rate.<br>
&gt;<br>
&gt; Signed-off-by: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">m=
axims@google.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;=C2=A0 arch/arm/dts/ast2500-u-boot.<wbr>dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/scu_ast2500.h |=C2=A0 62 +=
++++-<br>
&gt;=C2=A0 drivers/clk/aspeed/clk_<wbr>ast2500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 265 ++++++++++++++++++++++---<br>
&gt;=C2=A0 include/dt-bindings/clock/<wbr>ast2500-scu.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 4 files changed, 304 insertions(+), 33 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/dts/ast2500-u-boot.<wbr>dtsi b/arch/arm/dts/ast2=
500-u-boot.<wbr>dtsi<br>
&gt; index faeeec1be4..f826646095 100644<br>
&gt; --- a/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; +++ b/arch/arm/dts/ast2500-u-boot.<wbr>dtsi<br>
&gt; @@ -61,3 +61,11 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt; +<br>
&gt; +&amp;mac0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;scu PCLK_MAC1&gt;, &lt;&amp;s=
cu PLL_D2PLL&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mac1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;scu PCLK_MAC2&gt;, &lt;&amp;s=
cu PLL_D2PLL&gt;;<br>
&gt; +};<br>
<br>
</div></div>Why is this here and not in the main dts file?=C2=A0 The -u-boo=
t.dtsi is for<br>
stuff that&#39;s not appropriate in the upstream dts file.=C2=A0 Thanks!<br=
></blockquote><div><br></div><div>There is no clock driver for this part in=
 mainline Linux Kernel yet and I don&#39;t know how it will end up being co=
nfigured. I suspect that they might not use the same bindings though.</div>=
<div><br></div><div>Should I put this into board specific dts?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tom<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b=
>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a1140ed34420572054b2cccb8--
