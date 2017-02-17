Return-Path: <raltherr@google.com>
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPfDz6WpWzDqBr
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vjcDxb8X"; 
 dkim-atps=neutral
Received: by mail-it0-x22a.google.com with SMTP id h10so5489879ith.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uVaJ0iiJI1RCZsQ8fDiXrmwim8mAkelRV5ZwlmvXFSg=;
 b=vjcDxb8XN7G3gn4Uet6sECzx44smGX6M9mDTiNTkjkktnqzLieVyhk5C8y6iA1MQfZ
 deS2wDCYBlolvqQCUQQxwLNlknDgisW4F4J3ARaLR4gqxia/QaDe5AxmjrLAbaSUZzBP
 3ElPWvl3NZhtru5gGdJF7lCQMF3oKkbNZj5lGnjAREnfclHCAY61F97vIMB0PqdkWvSo
 +NQQj3FQF2lUeQsML19Gujlxbrlm66FxTXQVg/7a6S9/kDYHn/OcpFrGOVsf3R0msLcO
 pRJMgpEaeAcWk8Ehd/f/IQMes+cs1LaBX/6qaXBloXSI4c9ptbuMbpZiS0JIJXZgKTfX
 Z47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uVaJ0iiJI1RCZsQ8fDiXrmwim8mAkelRV5ZwlmvXFSg=;
 b=k0rwhL/f11lZVbOZkMtkroFkjl79tbFpVpgOUyRaBgXgvzkQgOXJN3Di4uB5eBnoKV
 73M6vWJLelQJNM+ToiPPIVcHvoFc480WdqaK5c4Ktfl1v1qR15Xjgz8BA/QSeNmGmDu9
 iC+0NgCSOLLRoJAc+V/VNKjbkRPe73ocjiwLeehxslnICnLTYuXoSLybVV77sY+kGJcQ
 NAwtSq3kNqCPhcEWTrz/dDKmt4nfg5VI8ocY5Hsl8ucHBsix6f897hH5t/eYrasy8SRq
 XA0ArKgaa2Qj+oG2fgFK6LtBIVnXX5CiuWjWPkUMc5p+DqY9pnehgLNXigZY4Xr4cW6B
 3bhg==
X-Gm-Message-State: AMke39nntn8jHsqkTANFv7INCLrTwsixLQq4vMkROL6M+Zz2MNPRLAeOU5bbqVToo9LFPp9+DYgFR+pVekejMKtm
X-Received: by 10.36.254.66 with SMTP id w63mr1028372ith.28.1487303425460;
 Thu, 16 Feb 2017 19:50:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:50:24 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:50:24 -0800 (PST)
In-Reply-To: <CACPK8XfUiToyMDdP0+SzpJrtxJg+6tnk1Jp-ZShmr2-P99VDgg@mail.gmail.com>
References: <20170217031230.12800-1-cyrilbur@gmail.com>
 <CAPLgG==cyh05UMqj3VD1cTjQX9ycuG36ECGumT84MKo5sO+MAg@mail.gmail.com>
 <CAPLgG=kMbxDs32dw6uGwabVsGevv5w7g42E+KtHERToowM5HKg@mail.gmail.com>
 <CAPLgG=kFuyyZoX=g4_sZQgMG=r+dk-AjKADYBof0mwhH8Q5JZQ@mail.gmail.com>
 <CACPK8XfUiToyMDdP0+SzpJrtxJg+6tnk1Jp-ZShmr2-P99VDgg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 16 Feb 2017 19:50:24 -0800
Message-ID: <CAPLgG=ni2WL-mjHS8g7eePoSS9=82T6=KB5kE73=zUFrrVrHHA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c030bc659be140548b1d022
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
X-List-Received-Date: Fri, 17 Feb 2017 03:50:28 -0000

--94eb2c030bc659be140548b1d022
Content-Type: text/plain; charset=UTF-8

Sounds good to me.

On Feb 16, 2017 7:41 PM, "Joel Stanley" <joel@jms.id.au> wrote:

> On Fri, Feb 17, 2017 at 2:03 PM, Rick Altherr <raltherr@google.com> wrote:
> > Current Zaius and Barreleye G2 boards have AST2500 which has VGA support.
> > Google hasn't tried the VGA but it is there. We plan to switch to 2520
> later
> > for our own designs but it's only a BOM option to switch between the two.
>
> I think detecting the board revision GPIOs in u-boot and performing a
> fixup of the device tree is a good way to handle these kind of things.
>
> Perhaps we will end up having different device trees if the systems
> end up with vastly different configurations, or configs that aren't
> detectable from software.
>
>
> >
> > On Feb 16, 2017 7:15 PM, "Cyril Bur" <cyrilbur@gmail.com> wrote:
> >
> > Zaius platform doesn't use VGA so don't reserve that memory
> >
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> > v2: Drop reserving the framebuffer on Zaius
> >     Both platforms have 1GB not 512MB - adjust numbers
> >     Add comment requested by Joel.
> >
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 15 +++++++++++++--
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 12 ++++++++++--
> >  2 files changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index 4b2d8aa8abb6..b79cadb2f6d7 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -25,9 +25,20 @@
> >                 #size-cells = <1>;
> >                 ranges;
> >
> > -               flash_memory: region@94000000 {
> > +               /*
> > +                * The addreses for the flash_memory reserved range are
> the
> > +                * highest allowable for the size of the mapping (ie, the
> > +                * address has no set bits greater than the size)
> > +                */
> > +
> > +               flash_memory: region@b8000000 {
> > +                       no-map;
> > +                       reg = <0xb8000000 0x04000000>; /* 64M */
> > +               };
> > +
> > +               vga_memory: framebuffer@bc000000 {
> >                         no-map;
> > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > +                       reg = <0xbc000000 0x04000000>; /* 64M */
> >                 };
> >         };
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index e1c9b3f4fe44..5a06da43801b 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -25,10 +25,18 @@
> >                 #size-cells = <1>;
> >                 ranges;
> >
> > -               flash_memory: region@94000000 {
> > +               /*
> > +                * The addreses for the flash_memory reserved range are
> the
> > +                * highest allowable for the size of the mapping (ie, the
> > +                * address has no set bits greater than the size)
> > +                */
> > +
> > +               flash_memory: region@bc000000 {
> >                         no-map;
> > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > +                       reg = <0xbc000000 0x04000000>; /* 64M */
> >                 };
> > +
> > +               /* Zaius doesn't use VGA so don't reserve VGA buffer */
> >         };
> >
> >         onewire0 {
> > --
> > 2.11.1
> >
> >
>

--94eb2c030bc659be140548b1d022
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sounds good to me.</div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Feb 16, 2017 7:41 PM, &quot;Joel Stanley&quot; =
&lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Feb 17, 2017 at 2:0=
3 PM, Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com">raltherr@goog=
le.com</a>&gt; wrote:<br>
&gt; Current Zaius and Barreleye G2 boards have AST2500 which has VGA suppo=
rt.<br>
&gt; Google hasn&#39;t tried the VGA but it is there. We plan to switch to =
2520 later<br>
&gt; for our own designs but it&#39;s only a BOM option to switch between t=
he two.<br>
<br>
I think detecting the board revision GPIOs in u-boot and performing a<br>
fixup of the device tree is a good way to handle these kind of things.<br>
<br>
Perhaps we will end up having different device trees if the systems<br>
end up with vastly different configurations, or configs that aren&#39;t<br>
detectable from software.<br>
<br>
<br>
&gt;<br>
&gt; On Feb 16, 2017 7:15 PM, &quot;Cyril Bur&quot; &lt;<a href=3D"mailto:c=
yrilbur@gmail.com">cyrilbur@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Zaius platform doesn&#39;t use VGA so don&#39;t reserve that memory<br=
>
&gt;<br>
&gt; Signed-off-by: Cyril Bur &lt;<a href=3D"mailto:cyrilbur@gmail.com">cyr=
ilbur@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Drop reserving the framebuffer on Zaius<br>
&gt;=C2=A0 =C2=A0 =C2=A0Both platforms have 1GB not 512MB - adjust numbers<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Add comment requested by Joel.<br>
&gt;<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-<wbr>opp-witherspoon.dts | 15 +++++=
++++++++--<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++++++++++--<br>
&gt;=C2=A0 2 files changed, 23 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
&gt; b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
&gt; index 4b2d8aa8abb6..b79cadb2f6d7 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
&gt; @@ -25,9 +25,20 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cel=
ls =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<b=
r>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: =
region@94000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The addrese=
s for the flash_memory reserved range are the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * highest all=
owable for the size of the mapping (ie, the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * address has=
 no set bits greater than the size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: =
region@b8000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0no-map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0xb8000000 0x04000000&gt;; /* 64M */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vga_memory: fr=
amebuffer@bc000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0no-map;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0x94000000 0x04000000&gt;; /* 64M */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0xbc000000 0x04000000&gt;; /* 64M */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
&gt; b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
&gt; index e1c9b3f4fe44..5a06da43801b 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
&gt; @@ -25,10 +25,18 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cel=
ls =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<b=
r>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: =
region@94000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The addrese=
s for the flash_memory reserved range are the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * highest all=
owable for the size of the mapping (ie, the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * address has=
 no set bits greater than the size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: =
region@bc000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0no-map;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0x94000000 0x04000000&gt;; /* 64M */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0xbc000000 0x04000000&gt;; /* 64M */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Zaius doesn=
&#39;t use VGA so don&#39;t reserve VGA buffer */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0onewire0 {<br>
&gt; --<br>
&gt; 2.11.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--94eb2c030bc659be140548b1d022--
