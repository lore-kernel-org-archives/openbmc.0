Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QuE72Anv"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442rcW52vSzDqKP
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 15:34:35 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id z19so26217324otm.2
 for <openbmc@lists.ozlabs.org>; Sun, 17 Feb 2019 20:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BcI+29IV7qCqvKr5ttdBTYYEv2fmJPZ/pL9MwoONkQ=;
 b=QuE72Anvne0C1fdfO4R/a9uKbY8M29bC3dTpvuU6mChrxBmbw6wq04zG2SxW0EISad
 i8cZfKu9M02GleVoyt63poDFk8AYw4ylIqIVl5tqms7AMqVjwFh1gZLnE0SFme83tyYU
 CQ4Ys9EwYA4mV8up2JlY2Hbr1TzAgxvCFO9oTicB1ozvoxj140tsxMkdNiWVqb/j584D
 g8celr+SQW7ebIeXtPnrvYl65hTZfqamsbAzpDhfu3U3mZ4FPa88X3bI6STZgGsay7Uv
 Q/GTa9YQL7/ztsl23p3tRb7XpuSXQGcBEqWsH81t7wP4rSmoKDJs25Se3Stur1ckgEoj
 ZGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BcI+29IV7qCqvKr5ttdBTYYEv2fmJPZ/pL9MwoONkQ=;
 b=UQd7BOqb7MczNa0h2tU9SCjV1JEK5+PqHzpPFAo8bNXQ1omT0eG3Z3pkBT9y1EM0y9
 cP6rsyrH7vVwV+4FKqABws2N+8cMaYjTaqPFR4U8tuuo+GNoA8Ra4QvCFarQ4mBGJhQP
 kzkKVmJdo7Hf6Ll7vjikm/QHCZiBY/leM/xy+VPIoeGCHUGvDMjLh12HaViJ2xpch8EA
 W2MzICbSrHe/bEEkTkiZYsMUl+LzzY6Pv7s+LgikM2akVFAS+Ghpr4eAlS2e/BRqDgki
 v3ySXpplva6PRATNlU6mo4SanQbClZmVx08DEsk//1n0wTpRKTu6Y1BXrpvnP5L/mLsa
 q3Hw==
X-Gm-Message-State: AHQUAuZFSJ/TxfulORmOF2CXAo5oWn6detuVwHzt1pux4eXC98wxBdHI
 wAI4tIc//pAPh/yc+mI9lmLcSsTM/SQZKlk2s++lmaCA
X-Google-Smtp-Source: AHgI3IZyO6S0y3bbZMnai5M/nADQVqWKuxKmz5nLaaXBkeeww4+jWUb9ogffwS1vyPODb7JpAqy8g8w/PhrIoVUdWbQ=
X-Received: by 2002:aca:c7c2:: with SMTP id x185mr13182639oif.25.1550464473345; 
 Sun, 17 Feb 2019 20:34:33 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
In-Reply-To: <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 18 Feb 2019 10:03:46 +0530
Message-ID: <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002bb41d058223a4b9"
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
X-List-Received-Date: Mon, 18 Feb 2019 04:34:36 -0000

--0000000000002bb41d058223a4b9
Content-Type: text/plain; charset="UTF-8"

I wrote a bootable version of OpenBMC Linux image in system SPI flash.

I tried to boot it before power-off, it was successfully booted. Then I
tried to boot the same, that time it was unsuccessful.

Do I need to make any change in the Linux device tree for resolving this
issue?

On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> > I just powered off the entire board. After that the data is not present
> in
> > the SPI1 flash. But before power-off it was there.
>
> How were you verifying the data was there before the poweroff?
>
> >
> > We are using OpenBMC Linux version 4.18.7 and pflash v6.1
>
> Thanks for the versions. Should be handy as we dig deeper.
>

--0000000000002bb41d058223a4b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wrote a bootable version of OpenBMC Linux image in =
system SPI flash. <br></div><div><br></div><div>I tried to boot it before p=
ower-off, it was successfully booted. Then I tried to boot the same, that t=
ime it was unsuccessful.</div><div><br></div><div>Do I need to make any cha=
nge in the Linux device tree for resolving this issue?</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 18,=
 2019 at 8:15 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andr=
ew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:<br>
&gt; I just powered off the entire board. After that the data is not presen=
t in<br>
&gt; the SPI1 flash. But before power-off it was there.<br>
<br>
How were you verifying the data was there before the poweroff?<br>
<br>
&gt; <br>
&gt; We are using OpenBMC Linux version 4.18.7 and pflash v6.1<br>
<br>
Thanks for the versions. Should be handy as we dig deeper.<br>
</blockquote></div>

--0000000000002bb41d058223a4b9--
