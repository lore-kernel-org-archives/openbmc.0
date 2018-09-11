Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RCSo7558"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428xYw129kzF3Dr
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 06:37:55 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id j81-v6so94399ite.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 13:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tQd9ADZLvVye0SQ5u9VcqHmBufJwEQGdRmT8ydK1AE=;
 b=RCSo7558KU4gLctsMnFY8D6K+7mkv3tk14seprknFVxTKE9c4RQYttNFeAaBEaOJBc
 P4K3tgVjhBqw/D0B0wsinUEvx4wfKq4tB9DQ0Fq5F6t51M95aC3s9RuXjkgw3bFuY890
 xehC0yxUhLhEZaS+dZ/qvlwO7mCW3aL1cjkx+cblt4iwFCVKefZUAid+t3m8aLo/BheE
 fSmG8zqDWgNTyiBoLKfsA82UsOnWEoO9NkzENSsvGKUUHViKHuEKh/HJG2DdZ3Hv1/P5
 IdrU+lkAlbjRr/jCViEcs2ey5uyohC5yDq2OnVArU67kYBJCI1ypnGaa/V7+KFWHlyQb
 z/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tQd9ADZLvVye0SQ5u9VcqHmBufJwEQGdRmT8ydK1AE=;
 b=SvmzD8OQ9X8XxC3ZlJASyLXU6Y2AspzHUXioFZljd14MekZdWndOPJ9W7Kb1bKWOEe
 MO8dGBIgfl0IqijV40RzT5NtSp3M296UKzooUmqBGOdtbsmGD+wAAs0hIOaxwIAjdreX
 JgMRss9eTNsV2KWxByWG4T3zpP0op/ol4X6/VHfq1vuZf3vVdZSgYoT+n40PIO/ZM9TD
 YyOoVueF2wQ376H7nHbDrWLSKMR51WT3l2kCsFpwf6dz6cNamiorIkNI+pHqw8saYPTf
 PNdJo7S+QiR8ima438EP21UmGJ7rssY1XwWAh2psAV/FCRkjkyZpQ58bJnGgszuxwbeM
 CY6w==
X-Gm-Message-State: APzg51ChdsZAx7sDeXqNkZTpTRT7lyQTV+Wy6XAHOZbwzx8RzbXdLTdQ
 GCUhRksyghwJDouSSh2tUTvGnNL/pEVg//hAbEvLAQ==
X-Google-Smtp-Source: ANB0VdYVrUaYpYHyZrMyyh4RabKK3w/KBMvbBtxfhJKAjPj4w0kzzySkppKqZw/omnQAT6OOSWWqpO0tjqt23NbQftg=
X-Received: by 2002:a02:4f89:: with SMTP id
 r9-v6mr24970750jad.143.1536698273657; 
 Tue, 11 Sep 2018 13:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180911203656.GA25948@roeck-us.net>
In-Reply-To: <20180911203656.GA25948@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Tue, 11 Sep 2018 13:37:26 -0700
Message-ID: <CAGMNF6VO-Uwi17ioxyyQdupPCEdMn2kLjSkXyTRxp-s0UBDxGw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (lm75) Add MAX31725/6 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, frodol@dds.nl, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <rlippert@google.com>, 
 Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="000000000000bb1b8d05759e725a"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 20:37:57 -0000

--000000000000bb1b8d05759e725a
Content-Type: text/plain; charset="UTF-8"

Great, thanks!

On Tue, Sep 11, 2018 at 1:37 PM Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Sep 11, 2018 at 01:25:58PM -0700, Kun Yi wrote:
> > MAX31725/MAX31726 are local temperature sensors with +/- 0.5 degree
> > Celsius accuracy and 16-bit (0.00390625 degrees Celsius) resolution.
> > They have a register mapping and encoding compatible with the lm75
> > series drivers. Address scan and extended temperature range are
> > not supported by this patch.
> >
> > Tested on real hardware and verified temperature readings are correct.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> >  Documentation/hwmon/lm75 |  6 +++---
> >  drivers/hwmon/lm75.c     | 18 ++++++++++++++++--
> >  2 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
> > index ac95edfcd907..2f1120f88c16 100644
> > --- a/Documentation/hwmon/lm75
> > +++ b/Documentation/hwmon/lm75
> > @@ -17,8 +17,8 @@ Supported chips:
> >      Addresses scanned: none
> >      Datasheet: Publicly available at the Maxim website
> >                 http://www.maximintegrated.com/
> > -  * Maxim MAX6625, MAX6626
> > -    Prefixes: 'max6625', 'max6626'
> > +  * Maxim MAX6625, MAX6626, MAX31725, MAX31726
> > +    Prefixes: 'max6625', 'max6626', 'max31725', 'max31726'
> >      Addresses scanned: none
> >      Datasheet: Publicly available at the Maxim website
> >                 http://www.maxim-ic.com/
> > @@ -86,7 +86,7 @@ The LM75 is essentially an industry standard; there
> may be other
> >  LM75 clones not listed here, with or without various enhancements,
> >  that are supported. The clones are not detected by the driver, unless
> >  they reproduce the exact register tricks of the original LM75, and must
> > -therefore be instantiated explicitly. Higher resolution up to 12-bit
> > +therefore be instantiated explicitly. Higher resolution up to 16-bit
> >  is supported by this driver, other specific enhancements are not.
> >
> >  The LM77 is not supported, contrary to what we pretended for a long
> time.
> > diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> > index 49f4b33a5685..e6e5a1080f09 100644
> > --- a/drivers/hwmon/lm75.c
> > +++ b/drivers/hwmon/lm75.c
> > @@ -47,6 +47,7 @@ enum lm75_type {            /* keep sorted in
> alphabetical order */
> >       lm75b,
> >       max6625,
> >       max6626,
> > +     max31725,
> >       mcp980x,
> >       stds75,
> >       tcn75,
> > @@ -64,7 +65,6 @@ enum lm75_type {            /* keep sorted in
> alphabetical order */
> >  static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
> 0x4c,
> >                                       0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
> >
> > -
> >  /* The LM75 registers */
> >  #define LM75_REG_TEMP                0x00
> >  #define LM75_REG_CONF                0x01
> > @@ -76,7 +76,7 @@ struct lm75_data {
> >       struct i2c_client       *client;
> >       struct regmap           *regmap;
> >       u8                      orig_conf;
> > -     u8                      resolution;     /* In bits, between 9 and
> 12 */
> > +     u8                      resolution;     /* In bits, between 9 and
> 16 */
> >       u8                      resolution_limits;
> >       unsigned int            sample_time;    /* In ms */
> >  };
> > @@ -339,6 +339,10 @@ lm75_probe(struct i2c_client *client, const struct
> i2c_device_id *id)
> >               data->resolution_limits = 9;
> >               data->sample_time = MSEC_PER_SEC / 4;
> >               break;
> > +     case max31725:
> > +             data->resolution = 16;
> > +             data->sample_time = MSEC_PER_SEC / 8;
> > +             break;
> >       case tcn75:
> >               data->resolution = 9;
> >               data->sample_time = MSEC_PER_SEC / 8;
> > @@ -415,6 +419,8 @@ static const struct i2c_device_id lm75_ids[] = {
> >       { "lm75b", lm75b, },
> >       { "max6625", max6625, },
> >       { "max6626", max6626, },
> > +     { "max31725", max31725, },
> > +     { "max31726", max31725, },
> >       { "mcp980x", mcp980x, },
> >       { "stds75", stds75, },
> >       { "tcn75", tcn75, },
> > @@ -471,6 +477,14 @@ static const struct of_device_id lm75_of_match[] = {
> >               .compatible = "maxim,max6626",
> >               .data = (void *)max6626
> >       },
> > +     {
> > +             .compatible = "maxim,max31725",
> > +             .data = (void *)max31725
> > +     },
> > +     {
> > +             .compatible = "maxim,max31726",
> > +             .data = (void *)max31725
> > +     },
> >       {
> >               .compatible = "maxim,mcp980x",
> >               .data = (void *)mcp980x
> > --
> > 2.19.0.rc2.392.g5ba43deb5a-goog
> >
>


-- 
Regards,
Kun

--000000000000bb1b8d05759e725a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks!=C2=A0<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Tue, Sep 11, 2018 at 1:37 PM Guenter Roeck &lt;<a hr=
ef=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Tue, Sep 11, 2018 at 01:25:58PM -0700, K=
un Yi wrote:<br>
&gt; MAX31725/MAX31726 are local temperature sensors with +/- 0.5 degree<br=
>
&gt; Celsius accuracy and 16-bit (0.00390625 degrees Celsius) resolution.<b=
r>
&gt; They have a register mapping and encoding compatible with the lm75<br>
&gt; series drivers. Address scan and extended temperature range are<br>
&gt; not supported by this patch.<br>
&gt; <br>
&gt; Tested on real hardware and verified temperature readings are correct.=
<br>
&gt; <br>
&gt; Signed-off-by: Kun Yi &lt;<a href=3D"mailto:kunyi@google.com" target=
=3D"_blank">kunyi@google.com</a>&gt;<br>
<br>
Applied to hwmon-next.<br>
<br>
Thanks,<br>
Guenter<br>
<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/hwmon/lm75 |=C2=A0 6 +++---<br>
&gt;=C2=A0 drivers/hwmon/lm75.c=C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++--<=
br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75<br>
&gt; index ac95edfcd907..2f1120f88c16 100644<br>
&gt; --- a/Documentation/hwmon/lm75<br>
&gt; +++ b/Documentation/hwmon/lm75<br>
&gt; @@ -17,8 +17,8 @@ Supported chips:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Addresses scanned: none<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Datasheet: Publicly available at the Maxim website=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"http://www.maximintegrated.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.maximintegrated.com/</a><br>
&gt; -=C2=A0 * Maxim MAX6625, MAX6626<br>
&gt; -=C2=A0 =C2=A0 Prefixes: &#39;max6625&#39;, &#39;max6626&#39;<br>
&gt; +=C2=A0 * Maxim MAX6625, MAX6626, MAX31725, MAX31726<br>
&gt; +=C2=A0 =C2=A0 Prefixes: &#39;max6625&#39;, &#39;max6626&#39;, &#39;ma=
x31725&#39;, &#39;max31726&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Addresses scanned: none<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Datasheet: Publicly available at the Maxim website=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"http://www.maxim-ic.com/" rel=3D"noreferrer" target=3D"_blank">http://w=
ww.maxim-ic.com/</a><br>
&gt; @@ -86,7 +86,7 @@ The LM75 is essentially an industry standard; there =
may be other<br>
&gt;=C2=A0 LM75 clones not listed here, with or without various enhancement=
s,<br>
&gt;=C2=A0 that are supported. The clones are not detected by the driver, u=
nless<br>
&gt;=C2=A0 they reproduce the exact register tricks of the original LM75, a=
nd must<br>
&gt; -therefore be instantiated explicitly. Higher resolution up to 12-bit<=
br>
&gt; +therefore be instantiated explicitly. Higher resolution up to 16-bit<=
br>
&gt;=C2=A0 is supported by this driver, other specific enhancements are not=
.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The LM77 is not supported, contrary to what we pretended for a l=
ong time.<br>
&gt; diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c<br>
&gt; index 49f4b33a5685..e6e5a1080f09 100644<br>
&gt; --- a/drivers/hwmon/lm75.c<br>
&gt; +++ b/drivers/hwmon/lm75.c<br>
&gt; @@ -47,6 +47,7 @@ enum lm75_type {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* keep sorted in alphabetical order */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lm75b,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0max6625,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0max6626,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0max31725,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mcp980x,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0stds75,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcn75,<br>
&gt; @@ -64,7 +65,6 @@ enum lm75_type {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* keep sorted in alphabetical order */<br>
&gt;=C2=A0 static const unsigned short normal_i2c[] =3D { 0x48, 0x49, 0x4a,=
 0x4b, 0x4c,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4d, =
0x4e, 0x4f, I2C_CLIENT_END };<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 /* The LM75 registers */<br>
&gt;=C2=A0 #define LM75_REG_TEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00<br>
&gt;=C2=A0 #define LM75_REG_CONF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x01<br>
&gt; @@ -76,7 +76,7 @@ struct lm75_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client=C2=A0 =C2=A0 =C2=A0 =C2=A0=
*client;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*regmap;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_conf;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolution;=C2=A0 =C2=A0 =C2=A0/* In bits, =
between 9 and 12 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolution;=C2=A0 =C2=A0 =C2=A0/* In bits, =
between 9 and 16 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolution_limits;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sample_time;=C2=A0 =C2=A0 /* In ms */<br>
&gt;=C2=A0 };<br>
&gt; @@ -339,6 +339,10 @@ lm75_probe(struct i2c_client *client, const struc=
t i2c_device_id *id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;resolut=
ion_limits =3D 9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;sample_=
time =3D MSEC_PER_SEC / 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case max31725:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;resolution =
=3D 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;sample_time =
=3D MSEC_PER_SEC / 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case tcn75:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;resolut=
ion =3D 9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;sample_=
time =3D MSEC_PER_SEC / 8;<br>
&gt; @@ -415,6 +419,8 @@ static const struct i2c_device_id lm75_ids[] =3D {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;lm75b&quot;, lm75b, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;max6625&quot;, max6625, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;max6626&quot;, max6626, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;max31725&quot;, max31725, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;max31726&quot;, max31725, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;mcp980x&quot;, mcp980x, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;stds75&quot;, stds75, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;tcn75&quot;, tcn75, },<br>
&gt; @@ -471,6 +477,14 @@ static const struct of_device_id lm75_of_match[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D =
&quot;maxim,max6626&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void =
*)max6626<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;maxim,max31725&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)max=
31725<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;maxim,max31726&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)max=
31725<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D =
&quot;maxim,mcp980x&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void =
*)mcp980x<br>
&gt; -- <br>
&gt; 2.19.0.rc2.392.g5ba43deb5a-goog<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--000000000000bb1b8d05759e725a--
