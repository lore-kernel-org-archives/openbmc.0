Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22b; helo=mail-ua0-x22b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vie7Z5dG"; 
 dkim-atps=neutral
Received: from mail-ua0-x22b.google.com (mail-ua0-x22b.google.com
 [IPv6:2607:f8b0:400c:c08::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xvwwz6x6pzDqYd
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 14:23:15 +1000 (AEST)
Received: by mail-ua0-x22b.google.com with SMTP id l24so2980860uaa.5
 for <openbmc@lists.ozlabs.org>; Sat, 16 Sep 2017 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=F3/JCZmO/ODndmnP3AP4/KC/+FfWndNHFwKO7JYH9Kw=;
 b=vie7Z5dGcey5tDE4LetfQWOWRnVbgkOJ/NuBSiXHgLEyAcRpCmHdHk5BVi+Qf7/yvH
 PGJQdaCLuhq8j1thWxTwMzrRi3HbQO4+sgWsUTgHExzGV0ASArWmWZEZdlBBmlFAA1+5
 39PXFdURKy1kUgGeSg/prIfET7nP1CdnIVzQffs41xGsF3XMY0fL0iuuuQClXdUO6K87
 eiwSD81OuGSnDHy0bvYiMzS1KsuyOxKAS3Ld5GPoqgjqXc/wJ24GNm3vqepUGXV+I7Ge
 a2qVHZOrDIIpKPChcGRD/F/Nhab2ANsOKVJt5bWsD8mn6kIiZYqo1lfI7GLr/+cO1Hp1
 7FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=F3/JCZmO/ODndmnP3AP4/KC/+FfWndNHFwKO7JYH9Kw=;
 b=hiPsPy1EUO6FE72H0TMlkrjTt3A6i9dEYK9Rw/NFJmMr7/dv1V83IHkXlf4VsYrX6K
 H/sc56u1QY0YUoniLL1dsiV6UnBUCdU9uA0UcOKmLPf+b2EaYdG1uQnk4GPHNt659xre
 z69p4MAXyw/Kj338zf9LnbaFftn28AR7f5Ml3ZduB8+615Mb2QoiJgEcyEyeVXXIIlg3
 CGk1yDChK1iKJQXNWKr1z8dGwEGjGVoItvIgOYc5ZYHbn2pipqNhj2vfQU/WWNTP3L1p
 oSezzsvjs5C3gvEe52S1WGQ0n6+YCjCRxDPoySAzQFaU410GFmxIBlDr686GwS44/NZ5
 MY3w==
X-Gm-Message-State: AHPjjUj5QDdyWrqTQkqnS65L1AS9DwBTwoqzv6Sr+y6AEedmYaItweR1
 xssQ9J7eBg3y4S+zUvkxoenvAKlhl+pvzP+J9wpEVQ==
X-Google-Smtp-Source: ADKCNb5goEFJG1LrCG459w6Zcy31QgCVT6iLDC3MiwF2exUcUndryjn8GbuMoH2IR1ejLAoKsjsYMl+tkEDLQyc5TWo=
X-Received: by 10.176.24.99 with SMTP id j35mr25745972uag.155.1505622192545;
 Sat, 16 Sep 2017 21:23:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Sat, 16 Sep 2017 21:22:51 -0700 (PDT)
In-Reply-To: <1505599960.32310.1.camel@fuzziesquirrel.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Sat, 16 Sep 2017 21:22:51 -0700
Message-ID: <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f403043c56a0f443aa05595afb05"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Sep 2017 04:23:17 -0000

--f403043c56a0f443aa05595afb05
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 16, 2017 at 3:12 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi Patrick
>
> On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:
> > I apologize if this already exists or is in the works.
> >
> > I propose we create a daemon that centralizes userspace GPIO access.
> >
> > From a high level, the daemon will implement interfaces to export or
> > unexport GPIOs.  Each GPIO exported will exist on the dbus:
> >
> > /xyz/openbmc_project/gpio/53 and implement an interface with the
> > following properties:
> > value, direction, active_low, etc.
>
> Just thinking out loud...are we sure a gpio is a useful abstraction?
> If applications all just use the chardev API what is the benefit of
> having a dbus object, at the cost of API complexity.
>

As an alternative, perhaps a library would suffice.  My goal is to avoid
multiple in-application implementations.  However, I felt it might be
helpful to have some centralized daemon serving this information -- a
simple dbus property access may be simpler than either implementing the
ioctl in each application.  However, a library may also provide the
necessary abstraction.


>
> >
> > Some doubts, should the gpio name on the dbus be the relative name
> > (53), should it be the system specific name (G5) or the absolute
> > name?  I'm thinking the relative name and let the daemon handle
> > internalizing the adjustment from relative to absolute.
> >
> > I'm working on adding GPIO support within phosphor-hwmon so that I
> > can access a voltage sensor that's gated by a GPIO, and I know there
>
> Can you elaborate on what gated means?  Is it you have to wiggle a GPIO
> before the hwmon driver for this voltage sensor can actually access the
> sensor hardware?
>
> There is a GPIO that controls whether the battery sensor on the quanta
board (and I've heard of similar configurations on others) that needs to be
set high for the sensor to work.  I implemented a bit of a hack in
phosphor-hwmon to allow one to specify a GPIO that needs to be flipped in
this type of configuration.  I'd consider submitting the patch, however it
uses the sysfs interface -- as this saved a little implementation time.

I'd be willing to fix it up to use the proper interface and submit it
upstream if that's something helpful -- or seek out a good library for us
to use -- I'm also open to suggestions on this.

>
> > have been conversations and implementations of this for IPMI OEM --
> > and I think it could easily be centralized.
> >
> > Thoughts?
> >
> > Patrick
>

--f403043c56a0f443aa05595afb05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Sep 16, 2017 at 3:12 PM, Brad Bishop <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirre=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Patrick<br=
>
<span class=3D""><br>
On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:<br>
&gt; I apologize if this already exists or is in the works.<br>
&gt;<br>
&gt; I propose we create a daemon that centralizes userspace GPIO access.<b=
r>
&gt;<br>
&gt; From a high level, the daemon will implement interfaces to export or<b=
r>
&gt; unexport GPIOs.=C2=A0 Each GPIO exported will exist on the dbus:<br>
&gt;<br>
&gt; /xyz/openbmc_project/gpio/53 and implement an interface with the<br>
&gt; following properties:<br>
&gt; value, direction, active_low, etc.<br>
<br>
</span>Just thinking out loud...are we sure a gpio is a useful abstraction?=
<br>
If applications all just use the chardev API what is the benefit of<br>
having a dbus object, at the cost of API complexity.<br></blockquote><div><=
br></div><div>As an alternative, perhaps a library would suffice.=C2=A0 My =
goal is to avoid multiple in-application implementations.=C2=A0 However, I =
felt it might be helpful to have some centralized daemon serving this infor=
mation -- a simple dbus property access may be simpler than either implemen=
ting the ioctl in each application.=C2=A0 However, a library may also provi=
de the necessary abstraction.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<span class=3D""><br>
&gt;<br>
&gt; Some doubts, should the gpio name on the dbus be the relative name<br>
&gt; (53), should it be the system specific name (G5) or the absolute<br>
&gt; name?=C2=A0 I&#39;m thinking the relative name and let the daemon hand=
le<br>
&gt; internalizing the adjustment from relative to absolute.<br>
&gt;<br>
&gt; I&#39;m working on adding GPIO support within phosphor-hwmon so that I=
<br>
&gt; can access a voltage sensor that&#39;s gated by a GPIO, and I know the=
re<br>
<br>
</span>Can you elaborate on what gated means?=C2=A0 Is it you have to wiggl=
e a GPIO<br>
before the hwmon driver for this voltage sensor can actually access the<br>
sensor hardware?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>T=
here is a GPIO that controls whether the battery sensor on the quanta board=
 (and I&#39;ve heard of similar configurations on others) that needs to be =
set high for the sensor to work.=C2=A0 I implemented a bit of a hack in pho=
sphor-hwmon to allow one to specify a GPIO that needs to be flipped in this=
 type of configuration.=C2=A0 I&#39;d consider submitting the patch, howeve=
r it uses the sysfs interface -- as this saved a little implementation time=
.</div><div><br></div><div>I&#39;d be willing to fix it up to use the prope=
r interface and submit it upstream if that&#39;s something helpful -- or se=
ek out a good library for us to use -- I&#39;m also open to suggestions on =
this.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">
<br>
&gt; have been conversations and implementations of this for IPMI OEM --<br=
>
&gt; and I think it could easily be centralized.<br>
&gt;<br>
&gt; Thoughts?<br>
&gt;<br>
&gt; Patrick<br>
</div></div></blockquote></div><br></div></div>

--f403043c56a0f443aa05595afb05--
