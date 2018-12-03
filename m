Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gFzXXgqv"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437msp5HcNzDqS0
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 01:02:54 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id n9so10526644ioh.7
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UITRX2nfKTKw7kHIQqHpyDoisFH7xZRhh1tpGh2JrE=;
 b=gFzXXgqvXuLXhbiZKTXcy37Z8sCNwMMmbEj6uW3zX1xC3FjdbDIhpKslGHMA38NStf
 UpyElTsH0FkclIP4QXk+l3SliEJ6Jw0H9Cz01HxuZMu9WzqGpouHEhr7lnP4YzOHAwl0
 7hbas7Rih1fuWkpw+uUisxWPc2TmpNzZ1cM4hcuR0I7RzY8XtGd1tODR69YYcthM0gwJ
 /u57iYZl5S7oYDhcHQnBOoREEo9yh+XhMc0HpWqwcgVK20JdybOMP3lO90k7bsvQLJx4
 CXetYVxM21B25nfxz/5n8H00USnBOF/oCbsr+brEzd2sJcycx5/CeU0rblZQW0eBAyGV
 84VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UITRX2nfKTKw7kHIQqHpyDoisFH7xZRhh1tpGh2JrE=;
 b=DO3jmasNIdd97MOnWHg8y6+JUDNWyc+Yi6R3ZKPhSyU2XPmrUfikS3i9p/eD7KPJLQ
 GJlL07eOPdlUHiokj7dt3tiAUyd2B/4dYQ6BIUXH1gn54xKzySFVGEAKoThgIdsBD3hV
 Dv/JlSZUindbQ0vJy/vsc7LxEDYw93XtMlanrb9uq9+xq3Ra/cDrJ8C8qtzVnPDZJ3wg
 XHaicV0+jVT2eLjHSQ1uquemnvnNv+V+Vm+Tisxsb3wRES8J8jbEkSvtR8StcG+SZrjO
 c/DRj07NuSf0mZkGjAbUXkJFW5hv8JhTePJvf4hxZMKWfIe0iQyrKnpGBz0p/2g3aq7N
 urDg==
X-Gm-Message-State: AA+aEWZNjWURJXvPUYRHQNK2JIvMVa3cduNAWN3R7MzWjoXV0/EX1dLx
 B983gDCwxtDLKM4sRaqOFHZIWdEkoXUiE3rVsh0=
X-Google-Smtp-Source: AFSGD/UffOUZg7+LSvm+GeSjqpI+vVkJd77Z+sT/jBhRxlcDVmoUdZ/0N8R+N/Jg7fxqJ7m/By6Xono8sHpUZBViteA=
X-Received: by 2002:a6b:720d:: with SMTP id n13mr14795275ioc.90.1543845771761; 
 Mon, 03 Dec 2018 06:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20181203091456.454030-1-tmaimon77@gmail.com>
 <20181203102240.79a86a26@bbrezillon>
In-Reply-To: <20181203102240.79a86a26@bbrezillon>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 3 Dec 2018 16:09:19 +0200
Message-ID: <CAP6Zq1ib3p=UVC8ct_gvB801_XjTwknXMKPfFCq7=d1Jxv0Dfg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
To: boris.brezillon@bootlin.com
Cc: David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, linux-mtd@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000d05df9057c1e9a57"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2018 14:02:55 -0000

--000000000000d05df9057c1e9a57
Content-Type: text/plain; charset="UTF-8"

Hi Boris,



Thanks for getting back to me on this driver.


A few comments/input:


   1. We have been working on this driver for quite a long time to port it
   to the latest Linux conventions, polish the code, run tests and reach high
   quality.
   Our partners and customers are waiting to get this driver upstream so
   they can freely use it.
   Since this driver is already in final stages and is in very good shape
   we will appreciate if you can review this specific driver/interface and
   help us to upstream it.
   2.  As for the new interface, we are open for any discussion and for
   porting the driver as required.
   We are unsure what is this specific interface and weather it really fits
   a driver for a Flash Interface Controller module (rather than a SPI flash
   device).
   Is it possible to get a sample driver from another Flash Interface
   Controller module that was ported to this new interface ?
   Based on this we can evaluate the required effort and assign it
   accordingly.

Regards,

Tomer


On Mon, 3 Dec 2018 at 11:22, Boris Brezillon <boris.brezillon@bootlin.com>
wrote:

> On Mon,  3 Dec 2018 11:14:54 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > This patch set adds Flash Interface Unit(FIU) SPI-NOR
> > support for the Nuvoton NPCM Baseboard Management
> > Controller (BMC).
> >
> > The FIU supports single, dual or quad communication interface.
> >
> > the FIU controller can operate in following modes:
> > - User Mode Access(UMA): provides flash access by using an
> >   indirect address/data mechanism.
> > - direct rd/wr mode: maps the flash memory into the core
> >   address space.
> > - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
> >
> > The NPCM750/730/715/710 supports up to three FIU devices:
> > - FIU0 supports two chip select.
> > - FIU3 supports four chip select.
> > - FIUX supports two chip select.
> >
> > The NPCM FIU driver tested on NPCM750 evaluation board.
> >
> > Tomer Maimon (2):
> >   dt-binding: mtd: add NPCM FIU controller
> >   mtd: spi-nor: add NPCM FIU controller driver
> >
> >  Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
> >  drivers/mtd/spi-nor/Kconfig                        |   8 +
> >  drivers/mtd/spi-nor/Makefile                       |   1 +
> >  drivers/mtd/spi-nor/npcm-fiu.c                     | 930
> +++++++++++++++++++++
>
> We are currently trying to move all SPI NOR controller drivers out of
> drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]
> and place your driver in drivers/spi/.
>
> [1]
> https://elixir.bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185
>

--000000000000d05df9057c1e9a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi Boris,</p><p class=3D"MsoNo=
rmal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,s=
ans-serif">=C2=A0</p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001p=
t;font-size:11pt;font-family:Calibri,sans-serif">Thanks for getting back to=
 me on this driver.</p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.000=
1pt;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoN=
ormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,=
sans-serif">A few comments/input:</p><p class=3D"MsoNormal" style=3D"margin=
:0cm 0cm 0.0001pt"></p><ol style=3D""><li style=3D""><font face=3D"Calibri,=
 sans-serif"><span style=3D"font-size:14.6667px">We have been working on th=
is driver for quite a long time to port it to the latest Linux conventions,=
 polish the code, run tests and reach high quality.<br>Our partners and cus=
tomers are waiting to get this driver upstream so they can freely use it.<b=
r>Since this driver is already in final stages and is in very good shape we=
 will appreciate if you can review this specific driver/interface and help =
us to upstream it.=C2=A0</span></font></li><li style=3D""><font face=3D"Cal=
ibri, sans-serif"><span style=3D"font-size:14.6667px">=C2=A0As for the new =
interface, we are open for any discussion and for porting the driver as req=
uired.<br>We are unsure what is this specific interface and weather it real=
ly fits a driver for a Flash Interface Controller module (rather than a SPI=
 flash device).<br>Is it possible to get a sample driver from another Flash=
 Interface Controller module that was ported to this new interface ?<br>Bas=
ed on this we can evaluate the required effort and assign it accordingly.=
=C2=A0</span></font></li></ol><div><font face=3D"Calibri, sans-serif"><span=
 style=3D"font-size:14.6667px">Regards,</span></font></div><div><font face=
=3D"Calibri, sans-serif"><span style=3D"font-size:14.6667px"><br></span></f=
ont></div><div><font face=3D"Calibri, sans-serif"><span style=3D"font-size:=
14.6667px">Tomer</span></font></div><p></p></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Mon, 3 Dec 2018 at 11:22, Boris Brezillon &lt;<a h=
ref=3D"mailto:boris.brezillon@bootlin.com">boris.brezillon@bootlin.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,=C2=A0 3 Dec 2018=
 11:14:54 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This patch set adds Flash Interface Unit(FIU) SPI-NOR<br>
&gt; support for the Nuvoton NPCM Baseboard Management <br>
&gt; Controller (BMC).<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; The FIU supports single, dual or quad communication interface.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; the FIU controller can operate in following modes:<br>
&gt; - User Mode Access(UMA): provides flash access by using an<br>
&gt;=C2=A0 =C2=A0indirect address/data mechanism.<br>
&gt; - direct rd/wr mode: maps the flash memory into the core<br>
&gt;=C2=A0 =C2=A0address space.<br>
&gt; - SPI-X mode: used for an expansion bus to an ASIC or CPLD.<br>
&gt; <br>
&gt; The NPCM750/730/715/710 supports up to three FIU devices:<br>
&gt; - FIU0 supports two chip select.<br>
&gt; - FIU3 supports four chip select.<br>
&gt; - FIUX supports two chip select.<br>
&gt; <br>
&gt; The NPCM FIU driver tested on NPCM750 evaluation board.<br>
&gt; <br>
&gt; Tomer Maimon (2):<br>
&gt;=C2=A0 =C2=A0dt-binding: mtd: add NPCM FIU controller<br>
&gt;=C2=A0 =C2=A0mtd: spi-nor: add NPCM FIU controller driver<br>
&gt; <br>
&gt;=C2=A0 Documentation/devicetree/bindings/mtd/npcm-fiu.txt |=C2=A0 64 ++=
<br>
&gt;=C2=A0 drivers/mtd/spi-nor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 drivers/mtd/spi-nor/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/mtd/spi-nor/npcm-fiu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 930 +++++++++++++++++++++<br>
<br>
We are currently trying to move all SPI NOR controller drivers out of<br>
drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]<br>
and place your driver in drivers/spi/. <br>
<br>
[1]<a href=3D"https://elixir.bootlin.com/linux/v4.20-rc5/source/include/lin=
ux/spi/spi-mem.h#L185" rel=3D"noreferrer" target=3D"_blank">https://elixir.=
bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185</a><br>
</blockquote></div>

--000000000000d05df9057c1e9a57--
