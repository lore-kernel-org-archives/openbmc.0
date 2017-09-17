Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::231; helo=mail-ua0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n2rRzNqN"; 
 dkim-atps=neutral
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwFHP6wNDzDrTl
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 02:40:16 +1000 (AEST)
Received: by mail-ua0-x231.google.com with SMTP id 97so3350910uai.6
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=urbMMdL36dutG81vDKV9om+p+1ps5++WXCRzWG7dxSo=;
 b=n2rRzNqNA4dEOZSoElIsN5tjIBZVOLsgIT8cj4TfkfvVClH9Mjs7DS++05I5Js2tiU
 I8NZUSo/xCSFeElChGmoZx4CgJjkrkA3kI1vtUxEtQbRO9ygkqcUy5YFbPwIpO67TZDH
 4CZ+jmxhjl9YFcuXb8kEpTurEC326L67QTIKSy6uf2ry/QR25fjYMfPsezfGQhGpDv5u
 bVoVCdn+v6L9hedZfupP4176b0s2HYYMoTPEzg/dSr3yo9E9rjmudv+EtcYS/Yx9FKvH
 Tt+4fEwm4ROtVRbUII3oHDE6naM7sDpaSBbK7CReSZO077Berm7JioaYVcdpQRY4rdnY
 v6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=urbMMdL36dutG81vDKV9om+p+1ps5++WXCRzWG7dxSo=;
 b=Yqqk6HunIgCb5K8UmmJOTegJ/yTyJF+wd8faiRIhLGE+oKW02LXoQGI7SrPoygEKyp
 8+UvgInCvWD+8XMIcjaeawDd+GnUb2LESNLCprC4xgo9i5CPifJntgs/UbdwNED0bVf+
 WCvln6DHgWPyVe2dB5qWOuDL7AzOnzM7wfiUB3T1XKzYjjaLCvAREl/xrlB9ubLlieY1
 dL5Q6UuuDOjT5Ed2emoiKNBG4cHjqsy8liQKDTXvLc3+QJwH5tmyUzoi3zs2f8pADMCU
 FzPmidhu+LJ8pRo6EjyMQPY/+Ckbe3ib28nN6fqnO6BX7ETmo23Ft+ECLKoX/DT+Qaic
 PBWQ==
X-Gm-Message-State: AHPjjUi7LtMOrgO0thPeuabgDRhfXy6novVyK3RyucxQQGn7sB3smo/R
 KSpg1F0Md0Mcc8JlvYfzGxtXxgWsfcHn9feB1vIR4A==
X-Google-Smtp-Source: ADKCNb6DBRKqV7dy/9YbXriM89+fmarhGbSEuFSg/akYMYDnmZW2jhRUQsgHZejgA9V+Gt/7+Nzf1Cmdujo24q+cW/Q=
X-Received: by 10.176.92.38 with SMTP id q38mr25619217uaf.110.1505666413014;
 Sun, 17 Sep 2017 09:40:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Sun, 17 Sep 2017 09:39:52 -0700 (PDT)
In-Reply-To: <1505665582.29751.1.camel@fuzziesquirrel.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 17 Sep 2017 09:39:52 -0700
Message-ID: <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f40304361fecb30a1a055965472e"
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
X-List-Received-Date: Sun, 17 Sep 2017 16:40:18 -0000

--f40304361fecb30a1a055965472e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 17, 2017 at 9:26 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Sat, 2017-09-16 at 21:22 -0700, Patrick Venture wrote:
> > On Sat, Sep 16, 2017 at 3:12 PM, Brad Bishop
> > <bradleyb@fuzziesquirrel.com> wrote:
> > > Hi Patrick
> > >
> > > On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:
> > > > I apologize if this already exists or is in the works.
> > > >
> > > > I propose we create a daemon that centralizes userspace GPIO
> > > access.
> > > >
> > > > From a high level, the daemon will implement interfaces to export
> > > or
> > > > unexport GPIOs.  Each GPIO exported will exist on the dbus:
> > > >
> > > > /xyz/openbmc_project/gpio/53 and implement an interface with the
> > > > following properties:
> > > > value, direction, active_low, etc.
> > >
> > > Just thinking out loud...are we sure a gpio is a useful
> > > abstraction?
> > > If applications all just use the chardev API what is the benefit of
> > > having a dbus object, at the cost of API complexity.
> >
> > As an alternative, perhaps a library would suffice.  My goal is to
> > avoid multiple in-application implementations.  However, I felt it
>
> A good goal.
>
> > might be helpful to have some centralized daemon serving this
> > information -- a simple dbus property access may be simpler than
> > either implementing the ioctl in each application.  However, a
> > library may also provide the necessary abstraction.
>
> I think if you implement a library with API it becomes a wash.  There
> is also polling to consider - we have a number of applications using
> gpio-keys + libevdev.
>
> >
> > > >
> > > > Some doubts, should the gpio name on the dbus be the relative
> > > name
> > > > (53), should it be the system specific name (G5) or the absolute
> > > > name?  I'm thinking the relative name and let the daemon handle
> > > > internalizing the adjustment from relative to absolute.
> > > >
> > > > I'm working on adding GPIO support within phosphor-hwmon so that
> > > I
> > > > can access a voltage sensor that's gated by a GPIO, and I know
> > > there
> > >
> > > Can you elaborate on what gated means?  Is it you have to wiggle a
> > > GPIO
> > > before the hwmon driver for this voltage sensor can actually access
> > > the
> > > sensor hardware?
> > >
> > >
> >
> > There is a GPIO that controls whether the battery sensor on the
> > quanta board (and I've heard of similar configurations on others)
> > that needs to be set high for the sensor to work.  I implemented a
> > bit of a hack in phosphor-hwmon to allow one to specify a GPIO that
> > needs to be flipped in this type of configuration.  I'd consider
> > submitting the patch, however it uses the sysfs interface -- as this
> > saved a little implementation time.
>
> We have run into situations like this multiple times.  What we did was
> bind/unbind the driver in question when the hardware behind it becomes
> available.
>
> What do you think of this?
>
> 1 - You simply wiggle the gpio from a script or small application at
>       the appropriate time.
>

My thought here is -- the appropriate time is, right before phosphor-hwmon
wants to read it.


> 2 - An application other than phosphor-hwmon monitors this gpio and
>       binds the driver to it (or unbinds).
>

In this case, won't the device be removed/added to the hwmon sysfs on
demand?  I don't believe phosphor-hwmon picks up new devices automatically.


> 3 - phosphor-hwmon works without modification.
>
> In fact, #2 is already done - Matt Spinler recently added code to
> phosphor-gpio-monitor to do exactly this.
>

I haven't looked at gpio-monitor.


>
> I prefer something like this for two reasons:
>
> 1 - Consistency in how we handle things.  It becomes easier to write
> howtos or cookbooks to provide guidance in the future.
>


> 2 - We avoid one-offs in phosphor-hwmon.
>

I wouldn't necessarily consider it a one-off, as I can immediately think of
at least one other motherboard that would benefit from such an
opportunity.  Also, in this case it would all fit into one nice package --
one thing to configure by adding the corresponding line to a configuration
file.


>
>
> >
> > I'd be willing to fix it up to use the proper interface and submit it
> > upstream if that's something helpful -- or seek out a good library
> > for us to use -- I'm also open to suggestions on this.
> > > > have been conversations and implementations of this for IPMI OEM
> > > --
> > > > and I think it could easily be centralized.
> > > >
> > > > Thoughts?
> > > >
> > > > Patrick
> > >
> >
> >
>

--f40304361fecb30a1a055965472e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Sep 17, 2017 at 9:26 AM, Brad Bishop <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirre=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Sat, 2017-09-16 at 21:22 -0700, Patrick Venture wrote:<br>
&gt; On Sat, Sep 16, 2017 at 3:12 PM, Brad Bishop<br>
&gt; &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesqui=
rrel.com</a>&gt; wrote:<br>
&gt; &gt; Hi Patrick<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:<br>
&gt; &gt; &gt; I apologize if this already exists or is in the works.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I propose we create a daemon that centralizes userspace GPIO=
<br>
&gt; &gt; access.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From a high level, the daemon will implement interfaces to e=
xport<br>
&gt; &gt; or<br>
&gt; &gt; &gt; unexport GPIOs.=C2=A0 Each GPIO exported will exist on the d=
bus:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /xyz/openbmc_project/gpio/53 and implement an interface with=
 the<br>
&gt; &gt; &gt; following properties:<br>
&gt; &gt; &gt; value, direction, active_low, etc.<br>
&gt; &gt;<br>
&gt; &gt; Just thinking out loud...are we sure a gpio is a useful<br>
&gt; &gt; abstraction?<br>
&gt; &gt; If applications all just use the chardev API what is the benefit =
of<br>
&gt; &gt; having a dbus object, at the cost of API complexity.<br>
&gt;<br>
&gt; As an alternative, perhaps a library would suffice.=C2=A0 My goal is t=
o<br>
&gt; avoid multiple in-application implementations.=C2=A0 However, I felt i=
t<br>
<br>
</span>A good goal.<br>
<span class=3D""><br>
&gt; might be helpful to have some centralized daemon serving this<br>
&gt; information -- a simple dbus property access may be simpler than<br>
&gt; either implementing the ioctl in each application.=C2=A0 However, a<br=
>
&gt; library may also provide the necessary abstraction.<br>
<br>
</span>I think if you implement a library with API it becomes a wash.=C2=A0=
 There<br>
is also polling to consider - we have a number of applications using<br>
gpio-keys + libevdev.<br>
<span class=3D""><br>
&gt; =C2=A0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Some doubts, should the gpio name on the dbus be the relativ=
e<br>
&gt; &gt; name<br>
&gt; &gt; &gt; (53), should it be the system specific name (G5) or the abso=
lute<br>
&gt; &gt; &gt; name?=C2=A0 I&#39;m thinking the relative name and let the d=
aemon handle<br>
&gt; &gt; &gt; internalizing the adjustment from relative to absolute.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m working on adding GPIO support within phosphor-hwmon=
 so that<br>
&gt; &gt; I<br>
&gt; &gt; &gt; can access a voltage sensor that&#39;s gated by a GPIO, and =
I know<br>
&gt; &gt; there<br>
&gt; &gt;<br>
&gt; &gt; Can you elaborate on what gated means?=C2=A0 Is it you have to wi=
ggle a<br>
&gt; &gt; GPIO<br>
&gt; &gt; before the hwmon driver for this voltage sensor can actually acce=
ss<br>
&gt; &gt; the<br>
&gt; &gt; sensor hardware?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; There is a GPIO that controls whether the battery sensor on the<br>
&gt; quanta board (and I&#39;ve heard of similar configurations on others)<=
br>
&gt; that needs to be set high for the sensor to work.=C2=A0 I implemented =
a<br>
&gt; bit of a hack in phosphor-hwmon to allow one to specify a GPIO that<br=
>
&gt; needs to be flipped in this type of configuration.=C2=A0 I&#39;d consi=
der<br>
&gt; submitting the patch, however it uses the sysfs interface -- as this<b=
r>
&gt; saved a little implementation time.<br>
<br>
</span>We have run into situations like this multiple times.=C2=A0 What we =
did was<br>
bind/unbind the driver in question when the hardware behind it becomes<br>
available.<br>
<br>
What do you think of this?<br>
<br>
1 - You simply wiggle the gpio from a script or small application at<br>
=C2=A0 =C2=A0 =C2=A0 the appropriate time.<br></blockquote><div><br></div><=
div>My thought here is -- the appropriate time is, right before phosphor-hw=
mon wants to read it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
2 - An application other than phosphor-hwmon monitors this gpio and<br>
=C2=A0 =C2=A0 =C2=A0 binds the driver to it (or unbinds).<br></blockquote><=
div><br></div><div>In this case, won&#39;t the device be removed/added to t=
he hwmon sysfs on demand?=C2=A0 I don&#39;t believe phosphor-hwmon picks up=
 new devices automatically.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
3 - phosphor-hwmon works without modification.<br>
<br>
In fact, #2 is already done - Matt Spinler recently added code to<br>
phosphor-gpio-monitor to do exactly this.<br></blockquote><div><br></div><d=
iv>I haven&#39;t looked at gpio-monitor.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
I prefer something like this for two reasons:<br>
<br>
1 - Consistency in how we handle things.=C2=A0 It becomes easier to write<b=
r>
howtos or cookbooks to provide guidance in the future.=C2=A0<br></blockquot=
e><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
2 - We avoid one-offs in phosphor-hwmon.<br></blockquote><div><br></div><di=
v>I wouldn&#39;t necessarily consider it a one-off, as I can immediately th=
ink of at least one other motherboard that would benefit from such an oppor=
tunity.=C2=A0 Also, in this case it would all fit into one nice package -- =
one thing to configure by adding the corresponding line to a configuration =
file.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; I&#39;d be willing to fix it up to use the proper interface and submit=
 it<br>
&gt; upstream if that&#39;s something helpful -- or seek out a good library=
<br>
&gt; for us to use -- I&#39;m also open to suggestions on this.<br>
&gt; &gt; &gt; have been conversations and implementations of this for IPMI=
 OEM<br>
&gt; &gt; --<br>
&gt; &gt; &gt; and I think it could easily be centralized.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thoughts?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Patrick<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--f40304361fecb30a1a055965472e--
