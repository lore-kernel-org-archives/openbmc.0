Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x22b.google.com (mail-ua0-x22b.google.com
 [IPv6:2607:f8b0:400c:c08::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNSdZ33X6zDrcX
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 09:33:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=W5hAHa/P; 
 dkim-atps=neutral
Received: by mail-ua0-x22b.google.com with SMTP id i32so4923909uai.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bVVw6FQS0poAI10zJ14z+Be4k9MzOcQZKsDYQes+ILE=;
 b=W5hAHa/PP3FCqDVwVwpyuiIaMXuM2ZT+mJjwmD5nKGuUZ5Ed6KStOXWReG7JgJPn2b
 gzWjo21CC3OG8II9xAYlhV+IqgOvra0FB3+QaZAi3RweqHPYFA/xo2ReGPnlBiz8Ui1m
 R7Fu5MzDYWvKPMJfidiZFjYZxm/nV25SGdmwe9/Mms8Tr3JeaLzfBFGetK3jmRShkkVf
 9oDpnM5x4b9IQ+D2GhME4ZdrlSgFjh6bjUd4l0Wu3WrWQ3w+viQftOyxZZ61wxRBGNaz
 rJTK1J9NkbY6GYxNzeXKHqN32OeQ+zq8Sgzids6rXr/WdkQQSrixxhwgHdXUJW7Ba06f
 P/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bVVw6FQS0poAI10zJ14z+Be4k9MzOcQZKsDYQes+ILE=;
 b=SpPZiV0GV571qwUV0lnj2SQM2bC9IC23hif9HAwr8t/NIDvCioHwtBt9wVyHmDn1yT
 k2Lhh/KwFtD9f1+7CtKH1O0dtW/gqPIgIdDYtXIBwS4MVigZOrukJzCHoNq8h0YROKXO
 smeHRec7Xj77yWIgVhIrbm+XUBTr3cS469OJHEOZep2Iz/zTOD4d03N4KTI9tLdYCkq9
 FDN0UCz2aL2DTLSkyDqaIBjY9gF+6yAEL96YG4sxz29hl3sM4GW5ChGhp3gOyMUlQert
 LBCXcS1OAtYR0MFB4Jfeb24hFQbhJwHYISdJWifSFLj218pQpf2Bzgrl8uwbW1txGFeh
 4Pkw==
X-Gm-Message-State: AE9vXwNWvDkfkcZhv5PHRyXpCyvqeuABVIjl3FYcfwXz8oM1jtO/ZwoOKqUhlyTU1T3kH7T8gE0wAPdXw/rwVm51
X-Received: by 10.31.95.137 with SMTP id t131mr354602vkb.67.1472513614755;
 Mon, 29 Aug 2016 16:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
 <CAPH-5w6ZZPY4Gpx7VpgR2hNcmUTN218Vd3XEt1j+Mdgc5UzJ9w@mail.gmail.com>
In-Reply-To: <CAPH-5w6ZZPY4Gpx7VpgR2hNcmUTN218Vd3XEt1j+Mdgc5UzJ9w@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 29 Aug 2016 23:33:24 +0000
Message-ID: <CAFd5g45czzZx-AagiL-UGYidDva=qo+RLz08p31e5sKuB=62Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: added quirk for 24c08 devices
To: Xo Wang <xow@google.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a114e3caeef80ed053b3e4ab1
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
X-List-Received-Date: Mon, 29 Aug 2016 23:33:39 -0000

--001a114e3caeef80ed053b3e4ab1
Content-Type: text/plain; charset=UTF-8

Good call,

I guess this is probably something we do not want to apply to all 24C04
since the real ones probably work properly.

On Mon, Aug 29, 2016 at 4:24 PM Xo Wang <xow@google.com> wrote:

> On Sat, Aug 20, 2016 at 6:34 PM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
> > Some 24c08 devices exhibits a quirk where they will not NACK durring an
>
> BTW, the I2C EEPROM on our AST2500 EVBs are actually generic clones of
> the 24C04, with 4K of storage. This isn't mentioned on the schematic,
> which is why the DTS for dev-4.7 shows a 24C08-compatible device.
>
> > acknowledge poll. Added a STOP after the dummy write to address problem.
> > ---
> >  drivers/misc/eeprom/at24.c         | 12 +++++++++++-
> >  include/linux/platform_data/at24.h |  1 +
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 9ceb63b..c647efb 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -120,7 +120,11 @@ static const struct i2c_device_id at24_ids[] = {
> >                 AT24_FLAG_READONLY | AT24_FLAG_IRUGO) },
> >         { "24c04", AT24_DEVICE_MAGIC(4096 / 8, 0) },
> >         /* 24rf08 quirk is handled at i2c-core */
> > -       { "24c08", AT24_DEVICE_MAGIC(8192 / 8, 0) },
> > +       /* 24c08 exhibits a quirk where it will not NACK durring an
> > +        * acknowledge poll so we have to send a stop after the dummy
> write in
> > +        * a read.
> > +        */
> > +       { "24c08", AT24_DEVICE_MAGIC(8192 / 8, AT24_FLAG_STOPPOLL) },
> >         { "24c16", AT24_DEVICE_MAGIC(16384 / 8, 0) },
> >         { "24c32", AT24_DEVICE_MAGIC(32768 / 8, AT24_FLAG_ADDR16) },
> >         { "24c64", AT24_DEVICE_MAGIC(65536 / 8, AT24_FLAG_ADDR16) },
> > @@ -212,6 +216,12 @@ static ssize_t at24_eeprom_read(struct at24_data
> *at24, char *buf,
> >                 msgbuf[i++] = offset;
> >
> >                 msg[0].addr = client->addr;
> > +               /*
> > +                * Some EEPROMs do not perform the acknowledge poll
> correctly
> > +                * and have to send a STOP after the dummy write.
> > +                */
> > +               if (at24->chip.flags & AT24_FLAG_STOPPOLL)
> > +                       msg[0].flags = I2C_M_STOP;
> >                 msg[0].buf = msgbuf;
> >                 msg[0].len = i;
> >
> > diff --git a/include/linux/platform_data/at24.h
> b/include/linux/platform_data/at24.h
> > index be830b1..1773822 100644
> > --- a/include/linux/platform_data/at24.h
> > +++ b/include/linux/platform_data/at24.h
> > @@ -47,6 +47,7 @@ struct at24_platform_data {
> >  #define AT24_FLAG_READONLY     0x40    /* sysfs-entry will be read-only
> */
> >  #define AT24_FLAG_IRUGO                0x20    /* sysfs-entry will be
> world-readable */
> >  #define AT24_FLAG_TAKE8ADDR    0x10    /* take always 8 addresses
> (24c00) */
> > +#define AT24_FLAG_STOPPOLL     0x08    /* Send stop before ACK poll */
> >
> >         void            (*setup)(struct nvmem_device *nvmem, void
> *context);
> >         void            *context;
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
> cheers
> xo
>

--001a114e3caeef80ed053b3e4ab1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good call,<div><br></div><div>I guess this is probably som=
ething we do not want to apply to all=C2=A0<span style=3D"color:rgb(33,33,3=
3);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line-h=
eight:1.5">24C04 since the real ones probably work properly.</span></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 29, 2016 at=
 4:24 PM Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, Aug 20, 2016 at 6=
:34 PM, Brendan Higgins<br>
&lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanh=
iggins@google.com</a>&gt; wrote:<br>
&gt; Some 24c08 devices exhibits a quirk where they will not NACK durring a=
n<br>
<br>
BTW, the I2C EEPROM on our AST2500 EVBs are actually generic clones of<br>
the 24C04, with 4K of storage. This isn&#39;t mentioned on the schematic,<b=
r>
which is why the DTS for dev-4.7 shows a 24C08-compatible device.<br>
<br>
&gt; acknowledge poll. Added a STOP after the dummy write to address proble=
m.<br>
&gt; ---<br>
&gt;=C2=A0 drivers/misc/eeprom/at24.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12=
 +++++++++++-<br>
&gt;=C2=A0 include/linux/platform_data/at24.h |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c<b=
r>
&gt; index 9ceb63b..c647efb 100644<br>
&gt; --- a/drivers/misc/eeprom/at24.c<br>
&gt; +++ b/drivers/misc/eeprom/at24.c<br>
&gt; @@ -120,7 +120,11 @@ static const struct i2c_device_id at24_ids[] =3D =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AT24_FLAG=
_READONLY | AT24_FLAG_IRUGO) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c04&quot;, AT24_DEVICE_MAGI=
C(4096 / 8, 0) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 24rf08 quirk is handled at i2c-cor=
e */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c08&quot;, AT24_DEVICE_MAGIC(819=
2 / 8, 0) },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 24c08 exhibits a quirk where it will no=
t NACK durring an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * acknowledge poll so we have to send a s=
top after the dummy write in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * a read.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c08&quot;, AT24_DEVICE_MAGIC(819=
2 / 8, AT24_FLAG_STOPPOLL) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c16&quot;, AT24_DEVICE_MAGI=
C(16384 / 8, 0) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c32&quot;, AT24_DEVICE_MAGI=
C(32768 / 8, AT24_FLAG_ADDR16) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;24c64&quot;, AT24_DEVICE_MAGI=
C(65536 / 8, AT24_FLAG_ADDR16) },<br>
&gt; @@ -212,6 +216,12 @@ static ssize_t at24_eeprom_read(struct at24_data =
*at24, char *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgbuf[i+=
+] =3D offset;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg[0].ad=
dr =3D client-&gt;addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Some EEPROM=
s do not perform the acknowledge poll correctly<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and have to=
 send a STOP after the dummy write.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (at24-&gt;c=
hip.flags &amp; AT24_FLAG_STOPPOLL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0msg[0].flags =3D I2C_M_STOP;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg[0].bu=
f =3D msgbuf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg[0].le=
n =3D i;<br>
&gt;<br>
&gt; diff --git a/include/linux/platform_data/at24.h b/include/linux/platfo=
rm_data/at24.h<br>
&gt; index be830b1..1773822 100644<br>
&gt; --- a/include/linux/platform_data/at24.h<br>
&gt; +++ b/include/linux/platform_data/at24.h<br>
&gt; @@ -47,6 +47,7 @@ struct at24_platform_data {<br>
&gt;=C2=A0 #define AT24_FLAG_READONLY=C2=A0 =C2=A0 =C2=A00x40=C2=A0 =C2=A0 =
/* sysfs-entry will be read-only */<br>
&gt;=C2=A0 #define AT24_FLAG_IRUGO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x20=C2=A0 =C2=A0 /* sysfs-entry will be world-readable */<b=
r>
&gt;=C2=A0 #define AT24_FLAG_TAKE8ADDR=C2=A0 =C2=A0 0x10=C2=A0 =C2=A0 /* ta=
ke always 8 addresses (24c00) */<br>
&gt; +#define AT24_FLAG_STOPPOLL=C2=A0 =C2=A0 =C2=A00x08=C2=A0 =C2=A0 /* Se=
nd stop before ACK poll */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (*setup)(struct nvmem_device *nvmem, void *context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *context;<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@=
lists.ozlabs.org</a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br>
cheers<br>
xo<br>
</blockquote></div>

--001a114e3caeef80ed053b3e4ab1--
