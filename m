Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lwcb4+og"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qcKq4X0rzDqNn
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 08:42:55 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id l12so1282787qtf.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h++YxLeBwuDwLgI/sOK2+iYkUpb+lObJCyiSvPIetNo=;
 b=lwcb4+ognQncJK1BbNGIsP65Jl6BHsOUs6CTMOp2kOlZQWsgDZpz0DWtthet3XqcsL
 7xjbkk+jBhpQ4kftW6WnCrir1Cgt2XY9NGPy9JGhuLK9UZN4LKn7Mk3kPHBCTlonMIMg
 05+gYdPPVqQy1eqO+FQvhWKwvcxGvJsI701CvStP1ab9PJnylHZj8i+4hTxJyLbgzLdY
 qBgVrGN81O2Nb6awgHPzakUWMPiOZi+0MSsro6Jo1LQufQrgvkCilpd8I0E6Aa9CUGT6
 qZLaKr32tVCbEaWap8RzQCn51556NV0uU6l+8R4AhQ/0Liu7/B6IgtasEZ02z8nTjMG1
 Sk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h++YxLeBwuDwLgI/sOK2+iYkUpb+lObJCyiSvPIetNo=;
 b=J8Ikbud9cgn6pEIf521RYy3P4WQgfVHv/6f73TmVTegIrvnMu4akd23nkj1Af+3j89
 P0V4VSgRDPiGfl+rLS0PstElPDafu7dQYLsX8e54N49NyLHYMfK2pb4bqL9YQFmwGLse
 k2PRpdxueYb+6DWFBXPjDMBIVXE73KHNqNvkaghj92jzbL+iqDYpo9V8LNIPvgW6JwRP
 E4QfKNGjP0szjEK3X8xVlfyv+laF+uWRRdUKV/MxN5HDi0lcDeVaY5oo31nNo9FlIb+7
 NEtNYvRLv+mL304HA9jQTDac+XXECC7B4g3P2ccyTPCk95sNUoI33MkK6rf4eu09gi9/
 yjew==
X-Gm-Message-State: AJcUukcczu9o3oiRqjo9yKfVQXQ8R+MYdoQTUhYy6oystcSm8UWmr8N2
 VFbW6OMzWIIsQ9sB3QO6Q00dG6FJy1hu/ksPPcTnKg==
X-Google-Smtp-Source: ALg8bN50ahEQ6R/nWi6lsVQOttyUyPoIMgV1jyz2jBHQtkVYNgPQgIhdW4sRiOp2tIbjokw75W+M52Xb+IPXmE6UHCQ=
X-Received: by 2002:a0c:a8e3:: with SMTP id h35mr29581495qvc.92.1548884572631; 
 Wed, 30 Jan 2019 13:42:52 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash>
 <CAARXrtkg0uoJ7L8cwme8mkckmNj5bwb1hk15iWgqVYXbJ5pOCw@mail.gmail.com>
 <CAJoAoZmZhxFNuvRYKQ04iTYZVrHgoukbM4HdTaPP6kCZppMhDA@mail.gmail.com>
 <32964718.XoMeP9TR8m@flash>
In-Reply-To: <32964718.XoMeP9TR8m@flash>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 30 Jan 2019 13:42:40 -0800
Message-ID: <CAJoAoZk1XGosz=7Gg-o8RAU1OfftAVr8L7OmfsfwHqPAXVqORQ@mail.gmail.com>
Subject: Re: [EXT] Re: OpenBMC Sensors
To: Aaron Williams <awilliams@marvell.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c08de90580b3ca1a"
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
X-List-Received-Date: Wed, 30 Jan 2019 21:42:56 -0000

--000000000000c08de90580b3ca1a
Content-Type: text/plain; charset="UTF-8"

Aaron, we use this daemon for local (to BMC) thermal control:
https://github.com/openbmc/phosphor-pid-control
Maybe you'll find it helpful.

Although I'm not sure how to help you with losing sensors when the host
powers down but the BMC is expected to continue to cool the tray.  Sounds
like an issue with the board design, unless I'm not understanding what
you're saying.

On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams <awilliams@marvell.com>
wrote:

> Hi Emily,
>
> That's what I need the temperature for. We have two controllers, one that
> monitors the core temperature (a TI TMP421) and one that controls the fans
> (ADT7462). In order to maintain the thermal envelope the TMP421 needs to
> be
> monitored to adjust the fan speed through the ADT7462.
>
> Further complicating things is the fact that these sensors disappear when
> the
> host is powered down.
>
> -Aaron
>
> On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:
> > External Email
> >
> > ----------------------------------------------------------------------
> > Hi Aaron,
> >
> > Note that you only really need to worry about sending the temperature via
> > IPMI if you want to send it somewhere besides the BMC.  If you plan to do
> > internal thermal control (BMC reads temperature, BMC adjusts fans
> > accordingly) you probably don't need IPMI config and can get away with
> > setting it up as far as DBus in the sensor architecture doc Lei sent.
> >
> > Emily
> >
> > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:
> > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <awilliams@marvell.com>
> > >
> > > wrote:
> > > > I see how to set up the hwmon portion defining the devices based on
> the
> > >
> > > device
> > >
> > > > tree, but I am unsure how to go about configuring the YAML and other
> > >
> > > files for
> > >
> > > > this.
> > >
> > > For sensors' config, please refer to
> > > https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> > > And it looks you are looking for fan controls, then you could refer to:
> > >
> > >
> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f
> > > ans
> > >
> > > (I really need to submit my porting guide to openbmc/docs)
>
>
>
>
>

--000000000000c08de90580b3ca1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Aaron, we use this daemon for local (to BMC) thermal contr=
ol:<br><a href=3D"https://github.com/openbmc/phosphor-pid-control">https://=
github.com/openbmc/phosphor-pid-control</a><div>Maybe you&#39;ll find it he=
lpful.</div><div><br>Although I&#39;m not sure how to help you with losing =
sensors when the host powers down but the BMC is expected to continue to co=
ol the tray.=C2=A0 Sounds like an issue with the board design, unless I&#39=
;m not understanding what you&#39;re saying.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 30, 2019 at 1=
:28 PM Aaron Williams &lt;<a href=3D"mailto:awilliams@marvell.com">awilliam=
s@marvell.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Emi=
ly,<br>
<br>
That&#39;s what I need the temperature for. We have two controllers, one th=
at <br>
monitors the core temperature (a TI TMP421) and one that controls the fans =
<br>
(ADT7462). In order to maintain the thermal envelope the TMP421 needs to be=
 <br>
monitored to adjust the fan speed through the ADT7462.<br>
<br>
Further complicating things is the fact that these sensors disappear when t=
he <br>
host is powered down.<br>
<br>
-Aaron<br>
<br>
On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:<br>
&gt; External Email<br>
&gt; <br>
&gt; ----------------------------------------------------------------------=
<br>
&gt; Hi Aaron,<br>
&gt; <br>
&gt; Note that you only really need to worry about sending the temperature =
via<br>
&gt; IPMI if you want to send it somewhere besides the BMC.=C2=A0 If you pl=
an to do<br>
&gt; internal thermal control (BMC reads temperature, BMC adjusts fans<br>
&gt; accordingly) you probably don&#39;t need IPMI config and can get away =
with<br>
&gt; setting it up as far as DBus in the sensor architecture doc Lei sent.<=
br>
&gt; <br>
&gt; Emily<br>
&gt; <br>
&gt; On Thu, Jan 24, 2019 at 1:27 AM Lei YU &lt;<a href=3D"mailto:mine26030=
9@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams &lt;<a href=3D"mai=
lto:awilliams@marvell.com" target=3D"_blank">awilliams@marvell.com</a>&gt;<=
br>
&gt; &gt; <br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; I see how to set up the hwmon portion defining the devices b=
ased on the<br>
&gt; &gt; <br>
&gt; &gt; device<br>
&gt; &gt; <br>
&gt; &gt; &gt; tree, but I am unsure how to go about configuring the YAML a=
nd other<br>
&gt; &gt; <br>
&gt; &gt; files for<br>
&gt; &gt; <br>
&gt; &gt; &gt; this.<br>
&gt; &gt; <br>
&gt; &gt; For sensors&#39; config, please refer to<br>
&gt; &gt; <a href=3D"https://github.com/openbmc/docs/blob/master/sensor-arc=
hitecture.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openb=
mc/docs/blob/master/sensor-architecture.md</a><br>
&gt; &gt; And it looks you are looking for fan controls, then you could ref=
er to:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://github.com/mine260309/openbmc-intro/blob/maste=
r/Porting_Guide.md#f" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f</a><br>
&gt; &gt; ans<br>
&gt; &gt; <br>
&gt; &gt; (I really need to submit my porting guide to openbmc/docs)<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c08de90580b3ca1a--
