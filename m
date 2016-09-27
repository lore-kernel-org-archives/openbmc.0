Return-Path: <maxims@google.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk7cT2VCszDrKx
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MJSWTE80; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id i129so13269837ywb.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1MxUTSVPiC35yePwOdpuiHNv7YUwo8eEEUQ64ZC39u4=;
 b=MJSWTE808D0jQ320eCLvIWrvIuMb9MnbTaFlK8vzaEKdYF4XM9rw6MqRnLlyMaFUTw
 YDkGaVB7//sxwQG3IT5zufFJhJiR8C+TqWAhTSmjHoolhCA/cQKZ3sOLJh6mER+F5Jw4
 NCTcaqYDRKL03Iq1xL5Wt3PZA22Rt58RdC2DCceqD9GHY5c23+DZ4QTFrNk7ufElvbTP
 tPI72UYGOs4GbRWaIZKIW7Z+Kt2Hx0tmO8ziWlmIPjhrNkhf+YuVamq5bpFUKYUcqTy/
 RTwMjxHED4jgx5vDKH9jCr1qLf/KmGeg76OnhBr2cdYu3YD5okNXMfBO3rxBaKTsNySP
 y3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1MxUTSVPiC35yePwOdpuiHNv7YUwo8eEEUQ64ZC39u4=;
 b=YIthDxPm25dhIbEbqx2h+YxNpTX+UbpzL3eM1LFqz+3r+H2eqGhGnp25fPQyBEWVe6
 OhcOThaEHA6BtEtJms9uHHYu936MOolSY/Ajz3Ax/vOirpYTpMTwaPZI6bDZNA5yc9rf
 6ZS5tcESzSp7zv4t6xo3l+z1Y4pJbjD0KYzJAFUqeGazGhADBIpvADCPN2kIdSCPfqKf
 PGZ+5fL3Ips8G96QNBesM1+lz/89MsLoYixOgSfI+hqByOUQ44lv2RF61oqnDMQgQG+B
 GP+j8L78fEEBz4/QklH9BKV47Gdri3C2vRVuVXblNgtEvy177D/Bhq2GY7z+C1g4VLng
 5sdQ==
X-Gm-Message-State: AE9vXwPqxoufcapjOqeKWiYZydw/0UYwAo4rIY8etMWIJ+IbuU4Uoxnh4RwPLz2jBF9y4eT5AV0xzi4swU2XzrgK
X-Received: by 10.13.212.77 with SMTP id w74mr23880585ywd.180.1474998534444;
 Tue, 27 Sep 2016 10:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Tue, 27 Sep 2016 10:48:53 -0700 (PDT)
In-Reply-To: <CACPK8XeDxCquHHG3s=Mfvn4fuy06bmWx+gQqmgsB1rWP5c6mOg@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <CACPK8XeDxCquHHG3s=Mfvn4fuy06bmWx+gQqmgsB1rWP5c6mOg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Tue, 27 Sep 2016 10:48:53 -0700
Message-ID: <CAFR_W8qvcFmzZH6xz=ko5ASrYQdW0avQK99J1pzaomymrmySkQ@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500 and eval board,
 I2C driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114faa80b1128b053d80db28
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
X-List-Received-Date: Tue, 27 Sep 2016 17:48:58 -0000

--001a114faa80b1128b053d80db28
Content-Type: text/plain; charset=UTF-8

Hi Joel,

Sorry for the delay with the reply, my work computer stopped working,
needed to attend that.

I split the patch into three different self-consistent (hopefully) patches,
but somewhat different from what you've suggested.

On Thu, Sep 22, 2016 at 6:59 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello Maxim,
>
> On Tue, Sep 20, 2016 at 2:56 AM,  <maxims@google.com> wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > The driver is limited: only single master mode is supported and only
> > byte-by-byte reads and writes are supported, no DMA or Pool Buffers.
>
> Has this code been ported from the kernel driver? If so, mention it in
> your commit message and/or a comment in the code. A comment about what
> needed to be modified in order to make it integrate in the u-boot tree
> would be helpful. Also mention where you copied the code from; which
> tree or commit.
>

I would not call that "copied". The APIs are very different at the moment,
especially since in u-boot device tree is not fully utilized, so yes, I
used kernel driver as a reference, but this is essentially a rewrite.


>
> Be sure to incorporate any changes made to the upstream Linux driver
> as it goes through review.
>
> > Also, pin function configuration is performed by the I2C driver, because
> > there is no pinctrl driver at the moment.
>
> It looks like you've got several patches combined into one. To make it
> easier to review, try to have a separate patch for each feature you're
> adding.
>
> > ---
> >  arch/arm/dts/Makefile                       |   2 +
> >  arch/arm/dts/aspeed-g5-evb.dts              |  28 ++
> >  arch/arm/dts/aspeed-g5.dtsi                 | 392
> ++++++++++++++++++++++++++++
>
> This would be one patch.
>
> I assume they came from the kernel tree? If so, mention this,
> including which tree/commit you got them from.
>
> >  arch/arm/include/asm/arch-aspeed/ast_scu.h  |   6 +
> >  arch/arm/include/asm/arch-aspeed/regs-scu.h |  74 +++---
>
> This would be another.
>
> >  arch/arm/mach-aspeed/ast-scu.c              |  31 ++-
> >  board/aspeed/ast-g5/ast-g5.c                |   2 +-
>
> I believe these integrate the i2c driver with the arch and the board.
> They should be separate commits.
>
> >  configs/ast_g5_defconfig                    |   4 +-
>
> Updating the defconfig should be it's own patch.
>

This change was dropped.


>
> >  drivers/i2c/Kconfig                         |   6 +
> >  drivers/i2c/Makefile                        |   1 +
> >  drivers/i2c/ast_i2c.c                       | 306 ++++++++++++++++++++++
> >  drivers/i2c/ast_i2c.h                       | 155 +++++++++++
>
> Adding the i2c driver has nothing to do with the other functions, so
> that could be it's own patch.
>
> Cheers,
>
> Joel
>



-- 
*M*axim *S*loyko

--001a114faa80b1128b053d80db28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Sorry for the delay with the r=
eply, my work computer stopped working, needed to attend that.</div><div><b=
r></div><div>I split the patch into three different self-consistent (hopefu=
lly) patches, but somewhat different from what you&#39;ve suggested.</div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Sep 22, 20=
16 at 6:59 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jm=
s.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hello Maxim,<br>
<span class=3D""><br>
On Tue, Sep 20, 2016 at 2:56 AM,=C2=A0 &lt;<a href=3D"mailto:maxims@google.=
com">maxims@google.com</a>&gt; wrote:<br>
&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@goo=
gle.com</a>&gt;<br>
&gt;<br>
&gt; The driver is limited: only single master mode is supported and only<b=
r>
&gt; byte-by-byte reads and writes are supported, no DMA or Pool Buffers.<b=
r>
<br>
</span>Has this code been ported from the kernel driver? If so, mention it =
in<br>
your commit message and/or a comment in the code. A comment about what<br>
needed to be modified in order to make it integrate in the u-boot tree<br>
would be helpful. Also mention where you copied the code from; which<br>
tree or commit.<br></blockquote><div><br></div><div>I would not call that &=
quot;copied&quot;. The APIs are very different at the moment, especially si=
nce in u-boot device tree is not fully utilized, so yes, I used kernel driv=
er as a reference, but this is essentially a rewrite.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Be sure to incorporate any changes made to the upstream Linux driver<br>
as it goes through review.<br>
<span class=3D""><br>
&gt; Also, pin function configuration is performed by the I2C driver, becau=
se<br>
&gt; there is no pinctrl driver at the moment.<br>
<br>
</span>It looks like you&#39;ve got several patches combined into one. To m=
ake it<br>
easier to review, try to have a separate patch for each feature you&#39;re<=
br>
adding.<br>
<span class=3D""><br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 arch/arm/dts/aspeed-g5-evb.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 28 ++<br>
&gt;=C2=A0 arch/arm/dts/aspeed-g5.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 392 ++++++++++++++++++++++++++++<br>
<br>
</span>This would be one patch.<br>
<br>
I assume they came from the kernel tree? If so, mention this,<br>
including which tree/commit you got them from.<br>
<span class=3D""><br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h=C2=A0 |=C2=A0 =
=C2=A06 +<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h |=C2=A0 74 +++-=
--<br>
<br>
</span>This would be another.<br>
<span class=3D""><br>
&gt;=C2=A0 arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 31 ++-<br>
&gt;=C2=A0 board/aspeed/ast-g5/ast-g5.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
<br>
</span>I believe these integrate the i2c driver with the arch and the board=
.<br>
They should be separate commits.<br>
<br>
&gt;=C2=A0 configs/ast_g5_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
<br>
Updating the defconfig should be it&#39;s own patch.<br></blockquote><div><=
br></div><div>This change was dropped.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<span class=3D""><br>
&gt;=C2=A0 drivers/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 drivers/i2c/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 306 ++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 155 +++++++++++<br>
<br>
</span>Adding the i2c driver has nothing to do with the other functions, so=
<br>
that could be it&#39;s own patch.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114faa80b1128b053d80db28--
