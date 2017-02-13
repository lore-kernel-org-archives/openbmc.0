Return-Path: <raltherr@google.com>
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMdyp64RzzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 08:31:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lo9+ksIN"; 
 dkim-atps=neutral
Received: by mail-it0-x22d.google.com with SMTP id c7so4365944itd.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=e3VckC+5UyFRM0rcQH/9QrdjzzuOVyaftslOu6oDq24=;
 b=lo9+ksINN4OEbXzTowzlJFbU9dS5YaPsCWuy4QW+Vjx8/tdxRmzpPvPjW4pZU8AJW+
 pOAr/F17Y9Lsrpf86Cp9/x5iqYC9KwR/D7V+IYMEEBJxX9IZRJM2pAM/pQmsNs1Yf9gc
 9ahwSSULUeM73j6uGfoceSDCt/7BU+SEDtQH1e1nb57o7yvLePBdZ3sIjd/AEaGCMWqz
 JssqoCHCaPH2EEo3J/oWHaYLuLDTw1kZWLcJfZ8oHHmcU8Mc42VTc5dAUXFqk0KgXNFN
 H+LJLXaDAVSAvLWNF+YmtIFuTFfELdQ7boZnULeXnDU2FG0MCVyiVV+ePbWRs9W0mEOs
 YyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=e3VckC+5UyFRM0rcQH/9QrdjzzuOVyaftslOu6oDq24=;
 b=uAG+AcXFXLVA/97OkFvfvFekClFzn2Y9eBw1/mDvFM6LfGXpr+bsXcA3OO/OjAM8D5
 rOtcLSvSregAEax/Lj+9dL+WsYf27ruNIPpOFJ4+QdHUe4GXfTh2kr6y5MOHn5XsN9qn
 I9vN2DQBb8KhoKEf9Bjq1LtTJTew3Dc6bU+aIrV0VDN4SZ4ZDmHLydmtR7hFeMP3OkcK
 NuLv/D5rBDYUu7w6Hb7ImH39E0NH7siabxKDwnbiqxjMzc7pvjrVf8TrrK7fT8ZIohX/
 2smd8xJ0amJUZ5tgCLXjUlgASrefRZeexQg6TmiDWkxMqRrTHt/kCSHdgl70+CG6P9te
 Nfmg==
X-Gm-Message-State: AMke39kDjTQsrfL46CqElJOatT1oCWy+awq7W7/BqMZK5FIR2bJEtWFfvLDR6eGK6Pb1F0AuP3gR39SE597/6X2h
X-Received: by 10.107.12.88 with SMTP id w85mr22397156ioi.96.1487021472659;
 Mon, 13 Feb 2017 13:31:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 13 Feb 2017 13:31:12 -0800 (PST)
In-Reply-To: <1487021173.3661.24.camel@aj.id.au>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
 <20170213172440.lrqaf5v7jk66denq@asimov> <1487021173.3661.24.camel@aj.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 13 Feb 2017 13:31:12 -0800
Message-ID: <CAPLgG=kOBYuKTnZAbZtwDyZoXrUiwivyHAEzcG-tn-jmkxGZhQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: multipart/alternative; boundary=001a113e012aa720f20548702aea
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
X-List-Received-Date: Mon, 13 Feb 2017 21:31:15 -0000

--001a113e012aa720f20548702aea
Content-Type: text/plain; charset=UTF-8

The AST2500 datasheet I have covers both 2500 and 2520.  The table of
contents has many peripherals that have (AST2520 Excluded) next to them.

On Mon, Feb 13, 2017 at 1:26 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Mon, 2017-02-13 at 11:24 -0600, Patrick Williams wrote:
> > On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:
> > > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > index e1994c9e38c3..5ce0a7a65e77 100644
> > > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > @@ -1005,6 +1005,12 @@
> > > > >                                 reg = <0x1e6e202c 0x4>;
> > > > >                         };
> > >
> > > > > > > +                   gfx: display@1e6e6000 {
> > > > > +                               compatible = "aspeed,ast2500-gfx",
> "syscon";
> > > > > +                               reg = <0x1e6e6000 0x1000>;
> > > > > +                               reg-io-width = <4>;
> > > > > +                       };
> > > +
> >
>
>
> >   I believe Zaius is using a
> > variant of the 2500 that does not have the graphics engine.
>
> According to Rick, Zaius is using the AST2500 for the EVT but in the
> future they will be looking at moving to a chip without the graphics
> engine.
>
> > Is this valid to add on all G5 chips?
>
> Not on the AST2520 according to the marketing material[1]. I would
> prefer to use the datasheet for the SoC as a reference though, and I
> don't have an AST2520 datasheet.
>
> The fix *should* just be a matter of a small change to the pinctrl
> bindings, and we can do this when we come to support the AST2520.
>
> Andrew
>
> [1] https://www.aspeedtech.com/products.php?fPath=20&rId=456
>
>
> >

--001a113e012aa720f20548702aea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The AST2500 datasheet I have covers both 2500 and 2520.=C2=
=A0 The table of contents has many peripherals that have (AST2520 Excluded)=
 next to them.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Mon, Feb 13, 2017 at 1:26 PM, Andrew Jeffery <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 20=
17-02-13 at 11:24 -0600, Patrick Williams wrote:<br>
&gt; On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:<br>
&gt; &gt; diff --git a/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi b/arch/arm/boo=
t/dts/aspeed-g5.<wbr>dtsi<br>
&gt; &gt; index e1994c9e38c3..5ce0a7a65e77 100644<br>
&gt; &gt; --- a/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi<br>
&gt; &gt; +++ b/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi<br>
&gt; &gt; @@ -1005,6 +1005,12 @@<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0=
x1e6e202c 0x4&gt;;<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0gfx: display@1e6e6000 {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &=
quot;aspeed,ast2500-gfx&quot;, &quot;syscon&quot;;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e=
6e6000 0x1000&gt;;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-io-width =3D=
 &lt;4&gt;;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +<br>
&gt;<br>
<br>
<br>
</span><span class=3D"">&gt;=C2=A0=C2=A0=C2=A0I believe Zaius is using a<br=
>
&gt; variant of the 2500 that does not have the graphics engine.<br>
<br>
</span>According to Rick, Zaius is using the AST2500 for the EVT but in the=
<br>
future they will be looking at moving to a chip without the graphics<br>
engine.<br>
<span class=3D""><br>
&gt; Is this valid to add on all G5 chips?<br>
<br>
</span>Not on the AST2520 according to the marketing material[1]. I would<b=
r>
prefer to use the datasheet for the SoC as a reference though, and I<br>
don&#39;t have an AST2520 datasheet.<br>
<br>
The fix *should* just be a matter of a small change to the pinctrl<br>
bindings, and we can do this when we come to support the AST2520.<br>
<br>
Andrew<br>
<br>
[1] <a href=3D"https://www.aspeedtech.com/products.php?fPath=3D20&amp;rId=
=3D456" rel=3D"noreferrer" target=3D"_blank">https://www.aspeedtech.com/<wb=
r>products.php?fPath=3D20&amp;rId=3D456</a><br>
<br>
<br>
&gt; </blockquote></div><br></div>

--001a113e012aa720f20548702aea--
