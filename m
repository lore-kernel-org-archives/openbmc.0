Return-Path: <raltherr@google.com>
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJBlM0JWGzDrJy
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 10:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ouuX1wo7; 
 dkim-atps=neutral
Received: by mail-yw0-x235.google.com with SMTP id j12so63334409ywb.2
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 17:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Hx9e15zqUZ9R+7czrp4wgABOJ601zf+oDBOmM3fNyuM=;
 b=ouuX1wo7MoY1IxR2qyYGbmhlFcudfdyttUwocuQSHsfpfWPRh9RqowzzbsNDzUPf8+
 FoJzRxbCILelTMgvtyw6hs2hjDkcyFuRtxA8m75xS0rEiMNXvaF0tFjQ/OvbaFEqKdZC
 hOk5CxcmJu+YFYadQXRvgyUgpVbi5zan1G6QUx3Fi90Las/hiiZ6xeRmBv+AMrufadEt
 j42lx21YJ9ziOJnrEbYrUBjwY3oK55iWASH/xScceyZDoHPkX3LgfXWnItER41ia5SXM
 SkcgY4YNIL+HmQtBozVft30E8h4AiGlqHkrg3T7K0tJQrImgBVD+gox4j6y1zV9XFEGv
 v7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Hx9e15zqUZ9R+7czrp4wgABOJ601zf+oDBOmM3fNyuM=;
 b=T5beU8Fa+wCodzDWs/vPRAnpXJ+IjQtgEpRgUCY9+x1r2OoGWlZHAj2CakMDjvNDpu
 djy5uD8jeWLeAzMsCf04vE/jKLj51zErzf6jDohHb/wooWspnRZULb+44wbIKINH/+4Z
 DUQQT5PpiBw8CO1/8VKvXtWZHVeK4pvyi+V4wp9bVCKtJaeU5H//jmu3uyjApXRzqdBT
 Kmc6vWZW0Jfiu95e2K2dWnIIetWaANrMN+b8T089XoyNXi4m2Qq+NWrCMtm+RPLlwO8F
 et9gvYO5suUZ4U6LKpumLyyWQmvyiqAjnuTz/VasvFdvxDXAg4Ro3+TDRu0W5zJv4unr
 nqxw==
X-Gm-Message-State: AEkoouuMh/3XJcDDtOXRmsZaE7of4WrOh3lsClcOZkM+875pU4h3fnnIOutgj/t/rIcZYWxKU3sneliS0NaxgQwM
X-Received: by 10.129.120.82 with SMTP id t79mr20239144ywc.51.1471913628578;
 Mon, 22 Aug 2016 17:53:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Mon, 22 Aug 2016 17:53:48 -0700 (PDT)
In-Reply-To: <CACPK8XenpYnKWwuEwvbf=ePrNZwkzMZJW=es-Gpu=VgTvD7yGg@mail.gmail.com>
References: <CACPK8XckyWBdN+B+ieudY8FmgOXR7N4RMGaSt2yuOyZ8tCmodg@mail.gmail.com>
 <79e11c2d-2450-735f-094e-d43e329b4c3f@google.com>
 <CACPK8XenpYnKWwuEwvbf=ePrNZwkzMZJW=es-Gpu=VgTvD7yGg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 22 Aug 2016 17:53:48 -0700
Message-ID: <CAPLgG=n3TvvQnuKCasoYNbF-7H+LCC5USyMS2Yj0vBjKQxvzcw@mail.gmail.com>
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Joel Stanley <joel@jms.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0afaa2f915d3053ab298a4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2016 00:53:51 -0000

--94eb2c0afaa2f915d3053ab298a4
Content-Type: text/plain; charset=UTF-8

I remember a discussion in IRC about how to modify obmc-console for
multiple vuarts, etc.  I asked then if it made sense to entirely define the
vuart in the dts (specify sirq and lpc_addr) instead of having obmc-console
do it.  If we need to setup vuart aliases in the dts anyway, that seems to
make even more sense.

On Tue, Aug 16, 2016 at 5:15 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hey Xo,
>
> On Wed, Aug 17, 2016 at 9:55 AM, Xo Wang <xow@google.com> wrote:
> >
> >> We need to use a mechanism to tell userspace which device is the
> >> vuart. udev? systemd?
> >
> > I think that's covered by this userspace configuration file:
> > https://github.com/openbmc/openbmc/blob/master/meta-
> phosphor/common/recipes-phosphor/obmc-console/obmc-
> console/obmc-console.conf
>
> Yeah. Ideally we would have systemd/udev populate this configuration
> file. There has been some work in this area; I think there are a few
> prerequisites from our systemd setup to land before we can turn that
> on.
>
> > It specifies the VUART console device as ttyS5, which doesn't exist using
> > our current DTS for the EVB.
> >
> >> $ ls /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/tty
> >> ttyS0
> >>
> >> We could also set an alias in the device tree?
> >
> > That's how I did my testing for AST2500 EVB connected to an LPC host.
> This
> > enabled and aliased the vuart for me (please note s/uart6/vuart/g for
> > dev-4.7):
>
> I had a similar idea. If we can't think of a better solution then I
> will commit a patch to this effect today.
>
> Cheers,
>
> Joel
>
> > diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> > b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> > index 28b0045..51b032d 100644
> > --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> > +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> > @@ -8,6 +8,7 @@
> >
> >         aliases {
> >                 serial4 = &uart5;
> > +               serial5 = &uart6;
> >         };
> >
> >         chosen {
> > @@ -39,6 +40,10 @@
> >         status = "okay";
> >  };
> >
> > +&uart6 {
> > +       status = "okay";
> > +};
> > +
> >  &mac0 {
> >         status = "okay";
> >  };
> >
> >
> >
> >
> > cheers
> > xo
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c0afaa2f915d3053ab298a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I remember a discussion in IRC about how to modify obmc-co=
nsole for multiple vuarts, etc.=C2=A0 I asked then if it made sense to enti=
rely define the vuart in the dts (specify sirq and lpc_addr) instead of hav=
ing obmc-console do it.=C2=A0 If we need to setup vuart aliases in the dts =
anyway, that seems to make even more sense.</div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Tue, Aug 16, 2016 at 5:15 PM, Joel Stanl=
ey <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank=
">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">He=
y Xo,<br>
<span class=3D""><br>
On Wed, Aug 17, 2016 at 9:55 AM, Xo Wang &lt;<a href=3D"mailto:xow@google.c=
om">xow@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; We need to use a mechanism to tell userspace which device is the<b=
r>
&gt;&gt; vuart. udev? systemd?<br>
&gt;<br>
&gt; I think that&#39;s covered by this userspace configuration file:<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phospho=
r/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/b=
lob/master/meta-<wbr>phosphor/common/recipes-<wbr>phosphor/obmc-console/obm=
c-<wbr>console/obmc-console.conf</a><br>
<br>
</span>Yeah. Ideally we would have systemd/udev populate this configuration=
<br>
file. There has been some work in this area; I think there are a few<br>
prerequisites from our systemd setup to land before we can turn that<br>
on.<br>
<span class=3D""><br>
&gt; It specifies the VUART console device as ttyS5, which doesn&#39;t exis=
t using<br>
&gt; our current DTS for the EVB.<br>
&gt;<br>
&gt;&gt; $ ls /sys/devices/platform/ahb/ahb:<wbr>apb/1e787000.vuart/tty<br>
&gt;&gt; ttyS0<br>
&gt;&gt;<br>
&gt;&gt; We could also set an alias in the device tree?<br>
&gt;<br>
&gt; That&#39;s how I did my testing for AST2500 EVB connected to an LPC ho=
st. This<br>
&gt; enabled and aliased the vuart for me (please note s/uart6/vuart/g for<=
br>
&gt; dev-4.7):<br>
<br>
</span>I had a similar idea. If we can&#39;t think of a better solution the=
n I<br>
will commit a patch to this effect today.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-<wbr>ast2500-evb.dts<br>
&gt; b/arch/arm/boot/dts/aspeed-<wbr>ast2500-evb.dts<br>
&gt; index 28b0045..51b032d 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-<wbr>ast2500-evb.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-<wbr>ast2500-evb.dts<br>
&gt; @@ -8,6 +8,7 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial4 =
=3D &amp;uart5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial5 =3D &a=
mp;uart6;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt; @@ -39,6 +40,10 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +&amp;uart6 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 &amp;mac0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; cheers<br>
&gt; xo<br>
&gt;<br>
&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0afaa2f915d3053ab298a4--
