Return-Path: <jaghu@google.com>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td0D72KLlzDvkP
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 10:58:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ftIaAS0+"; 
 dkim-atps=neutral
Received: by mail-wm0-x236.google.com with SMTP id t79so94068553wmt.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Xr5MZTdHYg9fsRQjnIn3O2GNIpTx//w+n79SXXYAunM=;
 b=ftIaAS0+EgHX7OnnOywcaj5wn14y9QphRPKCGwnQQAw52Sxu76ssZDYIycPAo+8s1v
 UbA0GZOl3i8JO9JYgOMY0zAOtjUBrkHEDuDnxxeDkxSi0KoHoFLezKrswaeGFDfsPtVY
 UvYuuQHfq8qBok4Pg7ha577sf30v4S0I5g5XRmmo7DjooaEGQcHkXMl9zV+HxzmNzaA5
 sQyMKMZSesAntlTvTQWjK5ADQ8ChP8QeFA43mrVY4OxZVp7s9HtID1fEqFazZLrOchrf
 VAv+THeJgDTYqTv9gOi0bzBJ7uwtBRyKAN67UpAg+zW2NnlWNACQpg6QNVsEB7LQPe1t
 8KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Xr5MZTdHYg9fsRQjnIn3O2GNIpTx//w+n79SXXYAunM=;
 b=CaBpfNZAQPnzzk0AVo6/4vwZFqmZPkaw6C5QdGmjz9E+acl7F2PmKGfl6Cuh6sV7ZX
 ULtO68Pesf0o4COK8Wr2acL7coLWWxi/ofONYYVjOGVyxBR1ILFTQFMGaN6sGN5rWo2x
 q1A4SrCFGyFr/ethqLFtsu3jGkRd/6KUpB8QPmcPWy2ttHboXHNUheXa2ZqYKg4/GreP
 ULB1OGc/veLaGdXOIj2pnjTJM46V+p6iUOUqndKPmd2Sq3XpRqA2ilGhsEuz5BUtSkjj
 hduGzS7HAUvw1wiD+Y38REHq9cf/fyI0l+kwz8vJG+mgtms6QWoGoKP2VAtQaKQJYYyW
 V3FQ==
X-Gm-Message-State: AKaTC01sjIuN6B7NxXdwyDRK3GFhe0ZMjoeDVaUlhOHSJAefNwW5jo7hao0kgw03j/Hxu2NamGyjmb+MrcGUw4H5
X-Received: by 10.28.13.144 with SMTP id 138mr29670wmn.120.1481587123468; Mon,
 12 Dec 2016 15:58:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Mon, 12 Dec 2016 15:58:22 -0800 (PST)
In-Reply-To: <CACPK8XfHxnYWBho6-r7xkbRm2LETK6ZpKagc6mjWd6xmuXYd+Q@mail.gmail.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
 <CACPK8XfHxnYWBho6-r7xkbRm2LETK6ZpKagc6mjWd6xmuXYd+Q@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Mon, 12 Dec 2016 15:58:22 -0800
Message-ID: <CANsWYUUyzxoM6m8F6660AaRBZCytaexg=hPH2JRA7H95jZBRJQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/4] Seven segment display support
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1144361632fee805437ee207
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
X-List-Received-Date: Mon, 12 Dec 2016 23:58:48 -0000

--001a1144361632fee805437ee207
Content-Type: text/plain; charset=UTF-8

Hi Joel,
Could you please help review this patch series. Would like to have the
seven segment display driver for testing out on zaius machine.
(I am trying to get the fan tach driver to work and I hope to send that
along with pwm driver for review soon.)

Also you had mentioned about writing the LPC driver. Is that checked in?

Thanks,
Jagha

On Tue, Nov 22, 2016 at 6:45 PM, Joel Stanley <joel@jms.id.au> wrote:

> We spoke on IRC about the clock changes. Lets wait until those issues
> are addressed before reviewing this series.
>
> Cheers,
>
> Joel
>
> On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> > This patchset includes:
> >
> > Documentation for the binding which provides an interface for adding
> clock,
> > data and clear signal GPIO lines to control seven segment display.
> >
> > The platform device driver provides an API for displaying on two
> 7-segment
> > displays, and implements the required bit-banging. The hardware assumed
> is
> > 74HC164 wired to two 7-segment displays.
> >
> > The character device driver implements the user-space API for letting a
> user
> > write to two 7-segment displays including any conversion methods
> necessary
> > to map the user input to two 7-segment displays.
> >
> > Adding clock, data and clear signal GPIO lines in the devicetree to
> control
> > seven segment display on zaius platform.
> >
> > The platform driver matches on the device tree node; the platform driver
> also
> > initializes the character device.
> >
> > Tested that the seven segment display works properly by writing to the
> > character device file on EVB AST2500 board and on Zaius board.
> >
> > A changelog between versions is included in the individual patches.
> Please
> > provide feedback.
> >
> > Jaghathiswari Rankappagounder Natarajan (4):
> >   Documentation: dt-bindings: Document bindings for seven segment
> >     display support
> >   drivers: misc: Character device driver for seven segment display
> >   drivers: misc: Platform driver for seven segment display support
> >   arm: dts: Add dt-binding to support seven segment display on zaius
> >
> >  .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
> >  drivers/misc/Kconfig                               |  16 ++
> >  drivers/misc/Makefile                              |   2 +
> >  drivers/misc/seven_seg_disp.c                      | 197
> ++++++++++++++++++++
> >  drivers/misc/seven_seg_disp.h                      |  34 ++++
> >  drivers/misc/seven_seg_gpio.c                      | 206
> +++++++++++++++++++++
> >  7 files changed, 490 insertions(+)
> >  create mode 100644 Documentation/devicetree/
> bindings/misc/seven-seg-gpio.txt
> >  create mode 100644 drivers/misc/seven_seg_disp.c
> >  create mode 100644 drivers/misc/seven_seg_disp.h
> >  create mode 100644 drivers/misc/seven_seg_gpio.c
> >
> > --
> > 2.8.0.rc3.226.g39d4020
> >
>

--001a1144361632fee805437ee207
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div>Could you please help review this patch serie=
s. Would like to have the seven segment display driver for testing out on z=
aius machine.</div><div>(I am trying to get the fan tach driver to work and=
 I hope to send that along with pwm driver for review soon.)<br></div><div>=
<br></div><div>Also you had mentioned about writing the LPC driver. Is that=
 checked in?</div><div><br></div><div>Thanks,</div><div>Jagha</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Nov 22, 201=
6 at 6:45 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms=
.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">We spoke on IRC about the clock changes. Lets wait un=
til those issues<br>
are addressed before reviewing this series.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
&gt; This patchset includes:<br>
&gt;<br>
&gt; Documentation for the binding which provides an interface for adding c=
lock,<br>
&gt; data and clear signal GPIO lines to control seven segment display.<br>
&gt;<br>
&gt; The platform device driver provides an API for displaying on two 7-seg=
ment<br>
&gt; displays, and implements the required bit-banging. The hardware assume=
d is<br>
&gt; 74HC164 wired to two 7-segment displays.<br>
&gt;<br>
&gt; The character device driver implements the user-space API for letting =
a user<br>
&gt; write to two 7-segment displays including any conversion methods neces=
sary<br>
&gt; to map the user input to two 7-segment displays.<br>
&gt;<br>
&gt; Adding clock, data and clear signal GPIO lines in the devicetree to co=
ntrol<br>
&gt; seven segment display on zaius platform.<br>
&gt;<br>
&gt; The platform driver matches on the device tree node; the platform driv=
er also<br>
&gt; initializes the character device.<br>
&gt;<br>
&gt; Tested that the seven segment display works properly by writing to the=
<br>
&gt; character device file on EVB AST2500 board and on Zaius board.<br>
&gt;<br>
&gt; A changelog between versions is included in the individual patches. Pl=
ease<br>
&gt; provide feedback.<br>
&gt;<br>
&gt; Jaghathiswari Rankappagounder Natarajan (4):<br>
&gt;=C2=A0 =C2=A0Documentation: dt-bindings: Document bindings for seven se=
gment<br>
&gt;=C2=A0 =C2=A0 =C2=A0display support<br>
&gt;=C2=A0 =C2=A0drivers: misc: Character device driver for seven segment d=
isplay<br>
&gt;=C2=A0 =C2=A0drivers: misc: Platform driver for seven segment display s=
upport<br>
&gt;=C2=A0 =C2=A0arm: dts: Add dt-binding to support seven segment display =
on zaius<br>
&gt;<br>
&gt;=C2=A0 .../devicetree/bindings/misc/<wbr>seven-seg-gpio.txt=C2=A0 =C2=
=A0 |=C2=A0 27 +++<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 16 ++<br>
&gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 drivers/misc/seven_seg_disp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 197 ++++++++++++++++++++<br>
&gt;=C2=A0 drivers/misc/seven_seg_disp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
&gt;=C2=A0 drivers/misc/seven_seg_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 206 +++++++++++++++++++++<br>
&gt;=C2=A0 7 files changed, 490 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/misc/s=
even-seg-gpio.<wbr>txt<br>
&gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_disp.c<br>
&gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_disp.h<br>
&gt;=C2=A0 create mode 100644 drivers/misc/seven_seg_gpio.c<br>
&gt;<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a1144361632fee805437ee207--
