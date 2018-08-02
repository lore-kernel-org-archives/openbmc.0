Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ATY2QAK0"; 
 dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gtY85tlzzF14j
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 11:55:23 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id g6-v6so500077wrp.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fkJnXfzKJExkjZdb4S1nwCPUPVU887SMsNR71Zu/tFA=;
 b=ATY2QAK0sPTESGgEy1gVUNmJzcDdk5SNmkuSQu0igEyndJN92EWd9t859y9qhBONod
 p4Qjr68QnUVI/4xGYrhY2cDyHLFMctSHsskZi9LOMNzQY+qMI00EXwKSUtWvXpp0C3lg
 M9WfD/bSkT3jJhXVck2aeQhIqGO3+a6VJoe9eydYPeDZ7ALl2PeyYDXA0CK2ygiC635Z
 wvD+uQQbLtErBsJvxq5po26n9u2NcQTuL7QrqRNS2i9wdUmcokiMFo2G6m/lqXvpHS2C
 pjTSDPTaQXliAomuRl+19JIhdtAOHKYCqAGueoxM4C1ZUtqvi47x7JVV5PM/ysJ/NWGL
 09AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkJnXfzKJExkjZdb4S1nwCPUPVU887SMsNR71Zu/tFA=;
 b=gCoh+TanaE3JkdGubClHI9xI5KqL1o8Nesqfv1M3qzeoSdwfMSG4Wr7Jy1GhAF8i9M
 AsFp9Z38mYO5ODLvs0BG35lUY+NT62x7OUnCdeCavhiQ0lwTfyrUS7hOaHwKkF+yjQME
 jmF80bT50jFWmhH/mgDd1ZKhDnd3djXS2uoLZ2XBGvxid2LFnNrbivbmfMPX/zxJtnom
 n27thvEDY86YNT87LEW4ZPbv736LRQuksMAAzj5svLYpYDHbg5l3HBd/aPPng2oVeMhI
 GdAtg4/7LUQzexOgNRg82vbCsYqXWe1me8Ks/Ii5xYPdxAdEWyXYyyv9/fN47PjfWLbB
 2NMg==
X-Gm-Message-State: AOUpUlGld62d0ZT16l5ix32oSomGWywzHcWaoYUUPXCfuxo4T1RAbQQT
 ROOFBWgiC9sCXQ2M/T8MPfvUuqJtzHdkV4QRV/09Bg==
X-Google-Smtp-Source: AAOMgpcGt0hBLZiJjLTlQuxEiCMhdWYlFGY9A4fLNyO7M3Z+ubwFXx5sgZkmVx9I1q9N3+NU6p6tTgqMjPHCwfkT3Zc=
X-Received: by 2002:adf:f485:: with SMTP id l5-v6mr455699wro.259.1533174920760; 
 Wed, 01 Aug 2018 18:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
In-Reply-To: <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 1 Aug 2018 21:55:08 -0400
Message-ID: <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
Subject: Re: UART Route setting
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Henbin Chang <henbinchang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008849eb05726a1a1e"
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
X-List-Received-Date: Thu, 02 Aug 2018 01:55:26 -0000

--0000000000008849eb05726a1a1e
Content-Type: text/plain; charset="UTF-8"

Hi Andrew

Thanks for the suggestion. I see that the register would map quite nicely
to pinmux. However, the ability to change the configuration from user space
is critical. How could that be done via pinmux?

Thanks
Oskar.


On Wed, Aug 1, 2018, 9:18 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Oskar, Henbin,
>
> On Thu, 2 Aug 2018, at 10:32, Oskar Senft wrote:
> > Hi Henbin
> >
> > I think we should be able to configure default settings for the routing
> > with the driver that I'm working on. I guess that could be done via DTS
> or
> > by just applying settings via /sys during boot.
>
> Have you explored writing a pinmux driver for it? It's effectively what
> these
> registers represent.
>
> It was something that wound up down the bottom of my todo list.
>
> This enables configuring the routing via DTS, though doing it dynamically
> from userspace might be a bit harder.
>
> Cheers,
>
> Andrew
>

--0000000000008849eb05726a1a1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Andrew<div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks for the suggestion. I see that the register would map quite nicel=
y to pinmux. However, the ability to change the configuration from user spa=
ce is critical. How could that be done via pinmux?</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">Oskar.</div><br><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 1, 2018, 9:18 PM =
Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Oskar, Henbin,<br>
<br>
On Thu, 2 Aug 2018, at 10:32, Oskar Senft wrote:<br>
&gt; Hi Henbin<br>
&gt; <br>
&gt; I think we should be able to configure default settings for the routin=
g<br>
&gt; with the driver that I&#39;m working on. I guess that could be done vi=
a DTS or<br>
&gt; by just applying settings via /sys during boot.<br>
<br>
Have you explored writing a pinmux driver for it? It&#39;s effectively what=
 these<br>
registers represent.<br>
<br>
It was something that wound up down the bottom of my todo list.<br>
<br>
This enables configuring the routing via DTS, though doing it dynamically<b=
r>
from userspace might be a bit harder.<br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div></div></div>

--0000000000008849eb05726a1a1e--
