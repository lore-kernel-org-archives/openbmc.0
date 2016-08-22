Return-Path: <raltherr@google.com>
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJ8416cnqzDrJq
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 08:53:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bRfcaHfu; 
 dkim-atps=neutral
Received: by mail-yb0-x236.google.com with SMTP id d10so44854299ybi.1
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 15:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DR/nZqQXdCM+wa7DJ5dHbxM5fyqHRxDvZMIwZDT0trE=;
 b=bRfcaHfuOZzqgZFGIOH9FBEMjiBUuOG2uffltrYhDoYyqe3Sw3Lv3MoytCwsawfsiN
 SE5m/g3gZI/1+AgB8et9RbF8FfUDFFXwxvFYM21mT2/GUZTiNgS2gByeyiFPQo/593Ws
 W+WGMJNkiE9Z7EN6uYq4sap+PQ//WDwrkjghyI/HCGoSWle3AuGFNflRW8qdnLimbtv6
 TFd8NRkSSb/oLQew5oUt4V/VAR3/3EARTXnQjDs2ROQlivzov+8MmuYhEmr1/Iw4GIm8
 kWD+1V2BijPvJF5eQyVsQLmTfAjV8N3YPjUxCW3T1S85whgH6g0hHSykf0ILH/W91WSQ
 zgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DR/nZqQXdCM+wa7DJ5dHbxM5fyqHRxDvZMIwZDT0trE=;
 b=Ggvzb8w19JkRaYSlQPr7oloCqLtlIvb4+KY1iwO7YEDuZxwWYaAGDL3jDsLOvZpJUZ
 eZkasQXY0332rUUf/Mx/g0gQJSOeolq8cLr/16d736/nm7+pGyYuw5Za31/FdLpDRjMc
 LKabrwI4NqRtKOS7N2du40cCMdUbx6v15UKnfxbrTJz9b0du+wlHejsimqbzqz11dHdb
 sp29U1aRFAC4g1FoJIMfeUtPwnAif4DZHgcdJuCT18AKhP2eskLsTLhE33ujHXqZ9u6g
 4ABRy1oWIkcP7QFCyfLLiOG8FILsUQZgBxanG6OuqFLHV5n6AQw36+qF1Efj6cRukStC
 13Og==
X-Gm-Message-State: AEkoouvdJwA7WZlqV11HcsWYDXBMkdYbzj/fm/qbCT4aS8Y12fJg1TA3gbgaQtR+TsiyUPw8L7xw/wr+y0CJimCl
X-Received: by 10.37.66.72 with SMTP id p69mr8801377yba.124.1471906382364;
 Mon, 22 Aug 2016 15:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Mon, 22 Aug 2016 15:53:01 -0700 (PDT)
In-Reply-To: <CACPK8XfU86SALm0wndbak7c=_Ks05isSE0cJd6-eH1C+0GwT4A@mail.gmail.com>
References: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
 <CACPK8XeYAMWCZpQ+TrZuwxuxfCzzCCkoq5wCdk8HuPyhFVzBBw@mail.gmail.com>
 <AM5PR0501MB2097FD63488A7D938298B753A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CACPK8XfWdp=8tGE9UFJTR_6aWK=tUonpZtNtwVhBhH6L-FSgBw@mail.gmail.com>
 <AM5PR0501MB209735B93C5DDB37EAD5FB43A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CACPK8XfU86SALm0wndbak7c=_Ks05isSE0cJd6-eH1C+0GwT4A@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 22 Aug 2016 15:53:01 -0700
Message-ID: <CAPLgG==vwhZjH04HrJ7xN2e3nOOEN2T4ArAdzCDoNMt35kiLAw@mail.gmail.com>
Subject: Re: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
To: Joel Stanley <joel@jms.id.au>
Cc: Vadim Pasternak <vadimp@mellanox.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Michael Shych <michaelsh@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
Content-Type: multipart/alternative; boundary=001a11c0106c10d33d053ab0e935
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
X-List-Received-Date: Mon, 22 Aug 2016 22:53:06 -0000

--001a11c0106c10d33d053ab0e935
Content-Type: text/plain; charset=UTF-8

I believe Xo is working on lpc as well.

On Tue, Aug 16, 2016 at 11:22 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Aug 17, 2016 at 3:36 PM, Vadim Pasternak <vadimp@mellanox.com>
> wrote:
> >> > By the way, I see that in 4.7 upstream you already added some minimal
> stuff
> >> for Aspeed SoC.
> >> > Do you have some plan regarding upstream other stuff to kernel?
> >>
> >> Yes. I intend to merge all of the drivers upstream.
> >>
> >> > When you think it could happen?
> >>
> >> We have watchdog and irq controller in 4.8.
> >>
> >> 4.9 will have clocksource, gpio and pinmux.
> >>
> >> Brendan is working on i2c which I hope will be ready in time for
> inclusion in 4.9.
> >>
> >> We also have bt, clock, mtd and vuart drivers that need review and
> submission. I
> >> hope to get as many as possible into 4.9.
> >>
> >> > And are you going to submit upstream all Aspeed files together or you
> are
> >> planning to do it in some particular order?
> >>
> >> As each of the drivers are going to different maintainers, they do not
> have any
> >> dependency on each other. They can go up when they are ready.
> >>
> >
> > Great,
> > Thank you very much for your detailed answers.
> > I'll re-work the patches according to your comment and re-submit them.
> >
> > As I understand you don't need peci, jtag, pwm, usb at the moment.
> > Could we submit these module for upstream review after your approval by
> ourselves?
>
> Yeah, I think that would work best.
>
> > What about RTC and SPI stuff?
>
> The SPI driver (I called it a MTD driver, another name is a spi-nor
> driver) is being worked on by Milton. I hope he is able to send it
> upstream for 4.9.
>
> I forgot about the rtc driver. I wrote that over a year ago; it can go
> upstream in 4.9 as well.
>
> Cheers,
>
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a11c0106c10d33d053ab0e935
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I believe Xo is working on lpc as well.</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 16, 2016 at 11:22 =
PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" ta=
rget=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Wed, Aug 17, 2016 at 3:36 PM, Vadim Paste=
rnak &lt;<a href=3D"mailto:vadimp@mellanox.com">vadimp@mellanox.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt; By the way, I see that in 4.7 upstream you already added some=
 minimal stuff<br>
&gt;&gt; for Aspeed SoC.<br>
&gt;&gt; &gt; Do you have some plan regarding upstream other stuff to kerne=
l?<br>
&gt;&gt;<br>
&gt;&gt; Yes. I intend to merge all of the drivers upstream.<br>
&gt;&gt;<br>
&gt;&gt; &gt; When you think it could happen?<br>
&gt;&gt;<br>
&gt;&gt; We have watchdog and irq controller in 4.8.<br>
&gt;&gt;<br>
&gt;&gt; 4.9 will have clocksource, gpio and pinmux.<br>
&gt;&gt;<br>
&gt;&gt; Brendan is working on i2c which I hope will be ready in time for i=
nclusion in 4.9.<br>
&gt;&gt;<br>
&gt;&gt; We also have bt, clock, mtd and vuart drivers that need review and=
 submission. I<br>
&gt;&gt; hope to get as many as possible into 4.9.<br>
&gt;&gt;<br>
&gt;&gt; &gt; And are you going to submit upstream all Aspeed files togethe=
r or you are<br>
&gt;&gt; planning to do it in some particular order?<br>
&gt;&gt;<br>
&gt;&gt; As each of the drivers are going to different maintainers, they do=
 not have any<br>
&gt;&gt; dependency on each other. They can go up when they are ready.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Great,<br>
&gt; Thank you very much for your detailed answers.<br>
&gt; I&#39;ll re-work the patches according to your comment and re-submit t=
hem.<br>
&gt;<br>
&gt; As I understand you don&#39;t need peci, jtag, pwm, usb at the moment.=
<br>
&gt; Could we submit these module for upstream review after your approval b=
y ourselves?<br>
<br>
</span>Yeah, I think that would work best.<br>
<span class=3D""><br>
&gt; What about RTC and SPI stuff?<br>
<br>
</span>The SPI driver (I called it a MTD driver, another name is a spi-nor<=
br>
driver) is being worked on by Milton. I hope he is able to send it<br>
upstream for 4.9.<br>
<br>
I forgot about the rtc driver. I wrote that over a year ago; it can go<br>
upstream in 4.9 as well.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<div class=3D"HOEnZb"><div class=3D"h5">______________________________<wbr>=
_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div>

--001a11c0106c10d33d053ab0e935--
