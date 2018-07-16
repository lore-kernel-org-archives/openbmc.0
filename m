Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IzXOiXuW"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TjTP3t47zF35T
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 22:31:53 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id h2-v6so18757426itj.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PrNQmsZlD87T9nO9tp22jwmpNt3mTgJG10GWp68Ydv8=;
 b=IzXOiXuWP9N30G8ZQUvhEVHfcQsJOU/ILw/s2rHLo88sgrcoj5cYzOiq5ftFNOxHkp
 f3jbe4nQkYELH9wzxP10Rvw6tUQRCyLuxby8PyfW5G5TAB7xXljxeN+wISBl5Am1EBqS
 6V2jNdETegzoRAMnbMRFxyMcri2aWVy6U+80GqRNUUmBQX+AJSU6drwislA1BRViz+rD
 lUxDIbi060oTIjMEKEmifPF+oRF+XORxRImmGeVZs3M77uhZO6wYKbrY7btHs8I1mZYA
 zd8pCVxisKzZjZ3bbrwNXcJrDO46iOxPrBaALp5TnlXx3Vn92xmQ+sv4lJeyIMLGOmMP
 NwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PrNQmsZlD87T9nO9tp22jwmpNt3mTgJG10GWp68Ydv8=;
 b=Vyt3UlJBIsxFmWgTcMZ5yQHSE9KBQK4uyo84ynCQ6Tslv0aLSGX7pdBrF6fzEoTY48
 pR07uiSfW2MzQOFju/85p/sLvRKBPNjIt91Fzrnd5kGDPP4zOX7ySJhSPbqpvIN/KlpE
 2BQP5epMRqzInBu/wjb6aG4t0m8knKSl1h6PJ1nCRjCFaxv0YA+WNU9Nx/0QsMqriMOP
 U7fypdMJpkcn5sOzlsq7FGTM+qlwopfeDSz79fZ6cyb1BI4K1o0trOSqqny+Hhcys5hG
 U4Q73HsXYfZXsk1bPr0C7u7wk3tCXusKGR1H9ZPV7S8E4BmZBJPdsCEMUaM+nVxoqadY
 Wnaw==
X-Gm-Message-State: AOUpUlGmwcMXyi17u2uMyEBRYKQ+duaYN0BoT6BzR6l/UDqYlXeYd65n
 93Ibjisw1e8dk1bLpFaTApOg8QaycTTkIngKUaY=
X-Google-Smtp-Source: AAOMgpfns5eA+1J/BrevG+Ugla440C+Q3l6PAgLFp/PHMJ7kDFL58+Yx6/zpesDhBO1ajudbxyYBtAILNbj7qe/usgs=
X-Received: by 2002:a24:f801:: with SMTP id
 a1-v6mr12399922ith.60.1531744311238; 
 Mon, 16 Jul 2018 05:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:8506:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 05:31:50
 -0700 (PDT)
In-Reply-To: <20180716113357.GA30937@kroah.com>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-3-tmaimon77@gmail.com>
 <20180716113357.GA30937@kroah.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Jul 2018 15:31:50 +0300
Message-ID: <CAP6Zq1hUr_3X-B1wPZpk5o88hibusJ2w04VUeR8Tw+OqftQuZg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] misc: npcm7xx: add NPCM7xx LPC BPC driver
To: Greg KH <gregkh@linuxfoundation.org>, benjaminfair@google.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 arnd@arnd.de, 
 Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Patrick Venture <venture@google.com>, 
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008ee45705711d033c"
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
X-List-Received-Date: Mon, 16 Jul 2018 12:31:54 -0000

--0000000000008ee45705711d033c
Content-Type: text/plain; charset="UTF-8"

[+Benjamin Fair]

Hi Greg,

This hardware is working in the same manner that Aspeed lpc snooping driver
(/drivers/misc/aspeed-lpc-snoop.c)

On 16 July 2018 at 14:33, Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.
> >
> > The NPCM7xx BPC monitoring two I/O address written by
> > the host on the Low Pin Count (LPC) bus, the capure
> > data stored in 128-word FIFO.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> It would be great to get someone else who knows that this hardware is
> supposed to be doing to ack or sign-off on this patch, as I don't know
> if this really is providing the correct api for it or not.
>

Joel could you sign-off this patch please.

Right now it's just reading data from the hardware, what good is that?
> Who uses this?  What userspace tools connect up to it?
>

BMC is logging a configurable I/O port (for example 0x80 port which is BIOS
post code) and remote management can get.

about tools, the OpenBMC is using it.
https://github.com/openbmc/phosphor-host-postd


> thanks,
>
> greg k-h
>

thanks,

Tomer

--0000000000008ee45705711d033c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[+Benjamin Fair]=C2=A0<div><br></div><div>Hi Greg,</div><d=
iv><br></div><div>This hardware is working in the same manner that Aspeed l=
pc snooping driver (/drivers/misc/aspeed-lpc-snoop.c)</div><div><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote">On 16 July 2018 at 14:=
33, Greg KH <span dir=3D"ltr">&lt;<a href=3D"mailto:gregkh@linuxfoundation.=
org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On=
 Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:<br>
&gt; Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.<br>
&gt; <br>
&gt; The NPCM7xx BPC monitoring two I/O address written by<br>
&gt; the host on the Low Pin Count (LPC) bus, the capure<br>
&gt; data stored in 128-word FIFO.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
<br>
</span>It would be great to get someone else who knows that this hardware i=
s<br>
supposed to be doing to ack or sign-off on this patch, as I don&#39;t know<=
br>
if this really is providing the correct api for it or not.=C2=A0<br></block=
quote><div>=C2=A0</div><div>Joel could you sign-off this patch please.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Right now it&#39;s just reading data from the hardware, what good is that?<=
br>
Who uses this?=C2=A0 What userspace tools connect up to it?<br></blockquote=
><div><br></div><div>BMC is logging a configurable I/O port (for example 0x=
80 port which is BIOS post code) and remote management can get.=C2=A0</div>=
<div><br></div><div>about tools, the OpenBMC is using it.</div><div><a href=
=3D"https://github.com/openbmc/phosphor-host-postd">https://github.com/open=
bmc/phosphor-host-postd</a><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
thanks,<br>
<br>
greg k-h<br></blockquote><div><br></div><div>thanks,</div><div><br></div><d=
iv>Tomer=C2=A0</div></div><br></div></div>

--0000000000008ee45705711d033c--
