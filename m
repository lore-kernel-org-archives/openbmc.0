Return-Path: <maxims@google.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKMBY6ZR8zDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 05:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vWhAWyBC"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id p24so20412694ioi.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=iaIuvSR79ScO1qsl5eUq0IA/ZeKKlyOYuLEM26YvfbU=;
 b=vWhAWyBC9c/CvNPZiijt85lMjf8nVzVs88dbWknU3NXBCxaUGBCUgpX48w4bAMix16
 3oeRo1tB+7b+SzqkhY0XlyIywaqtzloeOYgSWEfiedXrGCv+GZ1+wiAeWvJWD4SuJmEc
 HgVBpvH0yB1MWJfF+qt87NYSSkC2NYWw0KC/wnPXtr33S9Yu2Aw+dms8n3XTLZl/rZ7K
 SQTH2Q9idSlwdDhg14C+ZxwaupMEB1rWObB78/UQRNhf5OB/f59llbZ9GlZDb7wTDjOo
 M/IhqyE8Xv0plEQ53ou2k0RUDxbit+HVw9LUnrgF2lnyMx6LJy2PMvCsIDG4V2aW5kjy
 B5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=iaIuvSR79ScO1qsl5eUq0IA/ZeKKlyOYuLEM26YvfbU=;
 b=bnYGwU0uvY6kEP1jpXGZuzcMq5Xz6qixKnkNvxKz8qeWmn77dQnrmx6WoKeNevaq74
 Jq8nWzqX/Z7RMOJWPcTxqf86/oYLPQpq+X7rH7LjmOe/076cJCwYDztkgmE91Ya0jhZ6
 BgVMmqc0bRCU6H8huNb05jzsCx1ZedW4cpD2ClZKRvO5xWqa29HcU/FncgzZxrtQGfJE
 5zciXGSvRJnxJNvehk9qMxekd67Q2Tq7cAW9t9RML2vco9kyJ0TVqGk1BlPen58dsWW5
 JFYTn9exzbXRCzII2kq3gsrRVPnVSktYnW1WAeQFl+XCj4Iquyz/+x12tTkcWbR8O7Bg
 +sgA==
X-Gm-Message-State: AN3rC/7WwFLlUfwqLmZIGVpXmptqpPsSxIKNfrtmk2F4jamby3GMp7PB
 0yGUKE1xKms3DpsbUuw7YyLOTi3kcoVtNNY=
X-Received: by 10.107.146.139 with SMTP id u133mr44111515iod.160.1494011922700; 
 Fri, 05 May 2017 12:18:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Fri, 5 May 2017 12:18:42 -0700 (PDT)
In-Reply-To: <CAPnjgZ3qis_kVdQpr2X7D2ReRev80Ce0Bfe6w5_9MEB8G3GaWg@mail.gmail.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-12-maxims@google.com>
 <CAPnjgZ3qis_kVdQpr2X7D2ReRev80Ce0Bfe6w5_9MEB8G3GaWg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 5 May 2017 12:18:42 -0700
Message-ID: <CAFR_W8qFnLfxkaF3pZhfZcq=eRbfjJLkgN7P7hc9B4QBPWc4og@mail.gmail.com>
Subject: Re: [PATCH v1 11/15] aspeed: Add I2C Driver
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Heiko Schocher <hs@denx.de>
Content-Type: multipart/alternative; boundary=94eb2c055f4ef20f6c054ecbc15d
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
X-List-Received-Date: Fri, 05 May 2017 19:18:46 -0000

--94eb2c055f4ef20f6c054ecbc15d
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 18, 2017 at 5:12 PM, Simon Glass <sjg@chromium.org> wrote:

> On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> > Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> > The driver is very limited, it only supports master mode and
> > synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
> >
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> >
> > ---
> >
> > Changes in v1:
> > - Style fixes
> >
> >
> > ---
> >  drivers/i2c/Kconfig   |   9 ++
> >  drivers/i2c/Makefile  |   1 +
> >  drivers/i2c/ast_i2c.c | 357 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++
> >  drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
> >  4 files changed, 499 insertions(+)
> >  create mode 100644 drivers/i2c/ast_i2c.c
> >  create mode 100644 drivers/i2c/ast_i2c.h
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> nit below
>
> [..]
> > +static int ast_i2c_ofdata_to_platdata(struct udevice *dev)
> > +{
> > +       struct ast_i2c_priv *priv = dev_get_priv(dev);
> > +       int ret;
> > +
> > +       priv->regs = dev_get_addr_ptr(dev);
> > +       if (IS_ERR(priv->regs))
> > +               return PTR_ERR(priv->regs);
>
> Should be
>
>  if (!priv->regs)
>
> I think
>

Looks like dev_get_addr_ptr returns FDT_ADDR_T_NONE (cast to void*) in case
of error. FDT_ADDR_T_NONE is -1, so simple !priv->regs check would be
incorrect, as far as I understand.


>
> > +
> > +       ret = clk_get_by_index(dev, 0, &priv->clk);
> > +       if (ret < 0) {
> > +               debug("%s: Can't get clock for %s: %d\n", __func__,
> dev->name,
> > +                     ret);
> > +               return ret;
>
> Regards,
> Simon
>



-- 
*M*axim *S*loyko

--94eb2c055f4ef20f6c054ecbc15d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 18, 2017 at 5:12 PM, Simon Glass <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 17 Apri=
l 2017 at 13:00, Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxi=
ms@google.com</a>&gt; wrote:<br>
&gt; Add Device Model based I2C driver for ast2500/ast2400 SoCs.<br>
&gt; The driver is very limited, it only supports master mode and<br>
&gt; synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.<br>
&gt;<br>
&gt; Signed-off-by: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">m=
axims@google.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes in v1:<br>
&gt; - Style fixes<br>
&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/Kconfig=C2=A0 =C2=A0|=C2=A0 =C2=A09 ++<br>
&gt;=C2=A0 drivers/i2c/Makefile=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.c | 357 ++++++++++++++++++++++++++++++<wbr>+=
+++++++++++++++++++<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 499 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/i2c/ast_i2c.c<br>
&gt;=C2=A0 create mode 100644 drivers/i2c/ast_i2c.h<br>
<br>
</span>Reviewed-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg=
@chromium.org</a>&gt;<br>
<br>
nit below<br>
<br>
[..]<br>
<span class=3D"">&gt; +static int ast_i2c_ofdata_to_platdata(<wbr>struct ud=
evice *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_priv *priv =3D dev_get_priv=
(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;regs =3D dev_get_addr_ptr(dev);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;regs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(priv-&gt;regs);<br>
<br>
</span>Should be<br>
<br>
=C2=A0if (!priv-&gt;regs)<br>
<br>
I think<br></blockquote><div><br></div><div>Looks like dev_get_addr_ptr ret=
urns FDT_ADDR_T_NONE (cast to void*) in case of error. FDT_ADDR_T_NONE is -=
1, so simple !priv-&gt;regs check would be incorrect, as far as I understan=
d.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_get_by_index(dev, 0, &amp;priv=
-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;%s=
: Can&#39;t get clock for %s: %d\n&quot;, __func__, dev-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
<br>
</span>Regards,<br>
Simon<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--94eb2c055f4ef20f6c054ecbc15d--
