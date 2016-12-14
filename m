Return-Path: <jaghu@google.com>
Received: from mail-wj0-x22a.google.com (mail-wj0-x22a.google.com
 [IPv6:2a00:1450:400c:c01::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdnqv3vFlzDvjw
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 18:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ntZ87xVU"; 
 dkim-atps=neutral
Received: by mail-wj0-x22a.google.com with SMTP id tg4so17173828wjb.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 23:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zcUarRHC7MjwtNIOHNjfGpWscZwYBR2rEzTyeyMuWJs=;
 b=ntZ87xVUCIIjKWtX0pbkopAEPG/P2anZNLEGHWpSZJ2/YIPtKrDnuzeVEvoEMvNlbC
 9GAFDnFe2Uv90B9LGElcjBBkbIGwWz+EVijOo6S3Y1ZUFNMygNt8EpVB5zW9k0TQ8v0X
 kYEI70ftgV1UigC4yTxAtExalb/WKCA6iCp2i96d7ahEfrnrUAMUwD8H8hvi+RryQLbp
 08TOP7YZtIoc8AjigjYU5sE8sMeVn2yFr+nK9eLYVebGiBQqUYof1hswH9D+pLsL3R1H
 1C/sJGnwSgw5NE6SLN0KYqyZdp/LRH+LY4mGs8/WtjLZnVAgblggCQQv49SfpiH+jWAG
 XdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zcUarRHC7MjwtNIOHNjfGpWscZwYBR2rEzTyeyMuWJs=;
 b=kIk/R8O8FZ7xy/zhhanHeFXENdk36G9qbAzYOextGOXq3fbrhb/VpbtUdkk6vlw2dd
 65hVL9YTCnFbqic1AV0/G3+xKl2YFuTvIjVABeNsLVFWqBqQXoHz1hmR8PeTz5VmPlNF
 KtCPOzsn+sqXNnX4jZQWjbSxSYMSIuK3nrydg4SMQs4w1Pg4cMXZHOQ6w2jSzJ7FDIDL
 jUHl+VH8zysofy+J4Og/cjidF9wbcxORXn9GbDa9auOmQXQQYI2KXssfcoudpm56iIuj
 qmn3v72nt0pHSCNoDZfMQ/hvbvjJ+igzmVWqeAVC6D6fW9Qmp9eVHn4yDTEd1Gs09xao
 18mg==
X-Gm-Message-State: AKaTC00jK5MAsnWdpM3/uEoJFX5unI4zbLfAqfKij2YIpkUMgSyJYcUF/Hs9HMpL9m8WE+qIhk37ZgYHc/j5nHDJ
X-Received: by 10.194.146.228 with SMTP id tf4mr20605694wjb.183.1481699637998; 
 Tue, 13 Dec 2016 23:13:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Tue, 13 Dec 2016 23:13:37 -0800 (PST)
In-Reply-To: <CACPK8XcZTM1Ha9QGoVmO7-U9+Cbd1AKkB2LvxPR58e2F1YizCg@mail.gmail.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
 <CACPK8XfHxnYWBho6-r7xkbRm2LETK6ZpKagc6mjWd6xmuXYd+Q@mail.gmail.com>
 <CANsWYUUyzxoM6m8F6660AaRBZCytaexg=hPH2JRA7H95jZBRJQ@mail.gmail.com>
 <CACPK8XcZTM1Ha9QGoVmO7-U9+Cbd1AKkB2LvxPR58e2F1YizCg@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Tue, 13 Dec 2016 23:13:37 -0800
Message-ID: <CANsWYUUO6CJu7zcpyzJmk91KXyp0CfwKCRPxTWFvfzriq9-Lcg@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/4] Seven segment display support
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=089e01177bed96ae050543991471
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
X-List-Received-Date: Wed, 14 Dec 2016 07:14:04 -0000

--089e01177bed96ae050543991471
Content-Type: text/plain; charset=UTF-8

Ok. I will send this driver upstream. Thanks for the feedback.
I haven't looked into the proposed lpc driver. I will look at that.

On Mon, Dec 12, 2016 at 4:31 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hi Jagha,
>
> On Tue, Dec 13, 2016 at 10:58 AM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> > Hi Joel,
> > Could you please help review this patch series. Would like to have the
> seven
> > segment display driver for testing out on zaius machine.
>
> I have spent a fair amount of time reading your code. It would be nice
> to see other developers take a look as well. Have you asked for review
> from your peers?
>
> > (I am trying to get the fan tach driver to work and I hope to send that
> a> along with pwm driver for review soon.)
>
> If you think this driver is ready to go, I suggest you send it
> upstream for wider community review. Same for the pwm driver. Make
> sure you cc me so I can help out.
>
> > Also you had mentioned about writing the LPC driver. Is that checked in?
>
> Andrew sent a proposed driver some time ago. Did you have time to review
> it?
>
>  http://patchwork.ozlabs.org/patch/693032/
>
> I think we may prefer an ioctl based approach, but this is up for debate.
>
> Cheers,
>
> Joel
>
> >
> > Thanks,
> > Jagha
> >
> > On Tue, Nov 22, 2016 at 6:45 PM, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> We spoke on IRC about the clock changes. Lets wait until those issues
> >> are addressed before reviewing this series.
> >>
> >> Cheers,
> >>
> >> Joel
> >>
> >> On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder
> >> Natarajan <jaghu@google.com> wrote:
> >> > This patchset includes:
> >> >
> >> > Documentation for the binding which provides an interface for adding
> >> > clock,
> >> > data and clear signal GPIO lines to control seven segment display.
> >> >
> >> > The platform device driver provides an API for displaying on two
> >> > 7-segment
> >> > displays, and implements the required bit-banging. The hardware
> assumed
> >> > is
> >> > 74HC164 wired to two 7-segment displays.
> >> >
> >> > The character device driver implements the user-space API for letting
> a
> >> > user
> >> > write to two 7-segment displays including any conversion methods
> >> > necessary
> >> > to map the user input to two 7-segment displays.
> >> >
> >> > Adding clock, data and clear signal GPIO lines in the devicetree to
> >> > control
> >> > seven segment display on zaius platform.
> >> >
> >> > The platform driver matches on the device tree node; the platform
> driver
> >> > also
> >> > initializes the character device.
> >> >
> >> > Tested that the seven segment display works properly by writing to the
> >> > character device file on EVB AST2500 board and on Zaius board.
> >> >
> >> > A changelog between versions is included in the individual patches.
> >> > Please
> >> > provide feedback.
> >> >
> >> > Jaghathiswari Rankappagounder Natarajan (4):
> >> >   Documentation: dt-bindings: Document bindings for seven segment
> >> >     display support
> >> >   drivers: misc: Character device driver for seven segment display
> >> >   drivers: misc: Platform driver for seven segment display support
> >> >   arm: dts: Add dt-binding to support seven segment display on zaius
> >> >
> >> >  .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
> >> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
> >> >  drivers/misc/Kconfig                               |  16 ++
> >> >  drivers/misc/Makefile                              |   2 +
> >> >  drivers/misc/seven_seg_disp.c                      | 197
> >> > ++++++++++++++++++++
> >> >  drivers/misc/seven_seg_disp.h                      |  34 ++++
> >> >  drivers/misc/seven_seg_gpio.c                      | 206
> >> > +++++++++++++++++++++
> >> >  7 files changed, 490 insertions(+)
> >> >  create mode 100644
> >> > Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
> >> >  create mode 100644 drivers/misc/seven_seg_disp.c
> >> >  create mode 100644 drivers/misc/seven_seg_disp.h
> >> >  create mode 100644 drivers/misc/seven_seg_gpio.c
> >> >
> >> > --
> >> > 2.8.0.rc3.226.g39d4020
> >> >
> >
> >
>

--089e01177bed96ae050543991471
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok. I will send this driver upstream. Thanks for the feedb=
ack.<div>I haven&#39;t looked into the proposed lpc driver. I will look at =
that.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 12, 2016 at 4:31 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=
=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi Jagha,<br>
<span class=3D""><br>
On Tue, Dec 13, 2016 at 10:58 AM, Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
&gt; Hi Joel,<br>
&gt; Could you please help review this patch series. Would like to have the=
 seven<br>
&gt; segment display driver for testing out on zaius machine.<br>
<br>
</span>I have spent a fair amount of time reading your code. It would be ni=
ce<br>
to see other developers take a look as well. Have you asked for review<br>
from your peers?<br>
<br>
&gt; (I am trying to get the fan tach driver to work and I hope to send tha=
t a&gt; along with pwm driver for review soon.)<br>
<br>
If you think this driver is ready to go, I suggest you send it<br>
upstream for wider community review. Same for the pwm driver. Make<br>
sure you cc me so I can help out.<br>
<span class=3D""><br>
&gt; Also you had mentioned about writing the LPC driver. Is that checked i=
n?<br>
<br>
</span>Andrew sent a proposed driver some time ago. Did you have time to re=
view it?<br>
<br>
=C2=A0<a href=3D"http://patchwork.ozlabs.org/patch/693032/" rel=3D"noreferr=
er" target=3D"_blank">http://patchwork.ozlabs.org/<wbr>patch/693032/</a><br=
>
<br>
I think we may prefer an ioctl based approach, but this is up for debate.<b=
r>
<br>
Cheers,<br>
<br>
Joel<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Jagha<br>
&gt;<br>
&gt; On Tue, Nov 22, 2016 at 6:45 PM, Joel Stanley &lt;<a href=3D"mailto:jo=
el@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; We spoke on IRC about the clock changes. Lets wait until those iss=
ues<br>
&gt;&gt; are addressed before reviewing this series.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Joel<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder<br>
&gt;&gt; Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt; This patchset includes:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Documentation for the binding which provides an interface for=
 adding<br>
&gt;&gt; &gt; clock,<br>
&gt;&gt; &gt; data and clear signal GPIO lines to control seven segment dis=
play.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The platform device driver provides an API for displaying on =
two<br>
&gt;&gt; &gt; 7-segment<br>
&gt;&gt; &gt; displays, and implements the required bit-banging. The hardwa=
re assumed<br>
&gt;&gt; &gt; is<br>
&gt;&gt; &gt; 74HC164 wired to two 7-segment displays.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The character device driver implements the user-space API for=
 letting a<br>
&gt;&gt; &gt; user<br>
&gt;&gt; &gt; write to two 7-segment displays including any conversion meth=
ods<br>
&gt;&gt; &gt; necessary<br>
&gt;&gt; &gt; to map the user input to two 7-segment displays.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adding clock, data and clear signal GPIO lines in the devicet=
ree to<br>
&gt;&gt; &gt; control<br>
&gt;&gt; &gt; seven segment display on zaius platform.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The platform driver matches on the device tree node; the plat=
form driver<br>
&gt;&gt; &gt; also<br>
&gt;&gt; &gt; initializes the character device.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Tested that the seven segment display works properly by writi=
ng to the<br>
&gt;&gt; &gt; character device file on EVB AST2500 board and on Zaius board=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; A changelog between versions is included in the individual pa=
tches.<br>
&gt;&gt; &gt; Please<br>
&gt;&gt; &gt; provide feedback.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Jaghathiswari Rankappagounder Natarajan (4):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Documentation: dt-bindings: Document bindings for=
 seven segment<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0display support<br>
&gt;&gt; &gt;=C2=A0 =C2=A0drivers: misc: Character device driver for seven =
segment display<br>
&gt;&gt; &gt;=C2=A0 =C2=A0drivers: misc: Platform driver for seven segment =
display support<br>
&gt;&gt; &gt;=C2=A0 =C2=A0arm: dts: Add dt-binding to support seven segment=
 display on zaius<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 .../devicetree/bindings/misc/<wbr>seven-seg-gpio.txt=C2=
=A0 =C2=A0 |=C2=A0 27 +++<br>
&gt;&gt; &gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt;&gt; &gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 16 ++<br>
&gt;&gt; &gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 drivers/misc/seven_seg_disp.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 197<br>
&gt;&gt; &gt; ++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 drivers/misc/seven_seg_disp.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
&gt;&gt; &gt;=C2=A0 drivers/misc/seven_seg_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 206<br>
&gt;&gt; &gt; +++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 7 files changed, 490 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644<br>
&gt;&gt; &gt; Documentation/devicetree/<wbr>bindings/misc/seven-seg-gpio.<w=
br>txt<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_disp.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_disp.h<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_gpio.c<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.8.0.rc3.226.g39d4020<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--089e01177bed96ae050543991471--
