Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.50; helo=mail-oi0-f50.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VNA8ilL0"; 
 dkim-atps=neutral
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424N0P5T91zF3Lq
 for <openbmc@lists.ozlabs.org>; Tue,  4 Sep 2018 20:11:32 +1000 (AEST)
Received: by mail-oi0-f50.google.com with SMTP id r69-v6so5652615oie.3
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqTKJkuwxKGcJlJcwE3sWs6Sk7ztcVQ1TPTCpxGo7JI=;
 b=VNA8ilL0I8Awd2izz1KXKg8+XyRYboDTqUjuLqaT/J+7uSqBU2CEb9LBgJpwTnS08H
 rz5pcCwaUNF6HPfznTO76l0MHrOntJ0vJuJ4HN15jMUkmXmnLkzzGxJQlN0T7g4TQPFU
 /ZfPQwoPJBsWYquKlqn7z9LwHR7SWY2Cl4cp+0QSJqJgAHJ7hWeXCLAlBpY9Qneefanr
 tdmgOh9lvYZViXIUdn+c40J2y9vLKGXZ/clfj5/YapU0wKnq889KLsxiaojQicesR20N
 oD20YF9xY87V+0YL0btOhn+W8nJDPFT8lCXlcu3X1Kmcux+yzKH8HygJWpQhnPcpIQbj
 po+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqTKJkuwxKGcJlJcwE3sWs6Sk7ztcVQ1TPTCpxGo7JI=;
 b=bncDuLJvGm9wZU2kaMdFFEjtby/KMhVGB5R7PkFtlBy2OFnMRkM2J0sRX4lR9P9ktW
 65FxQpW7248dIShhwy4Tp9j4f/KoPksaJG2yg2j2qFdnO3mne4sgeatAw1el/gS9YEMr
 HEHVtbgjlaNUNkSsE0b+AYVqXICeJAAN81L+B+VFw9Ny8E4WsKiO2RlGDbxCQC4PDwql
 BGVllOqAzaOW6A78MW41PNNwK+md6J7LGWxeCrFXUJ4JA1xmuKG7k9b/mAqEt5EQsqAd
 fTVFkoogH09Ogzj0OPEkWgDPtjHqhXRyjiHDN7sUQ0GTx3ajbHsRQi0G7Rvs74UnYYtn
 /aqA==
X-Gm-Message-State: APzg51CSznv5wv38WB+d6AFNO+yFSeYRPmlpG7dG5l9DoOWQt99RYIp7
 gLE89C3YTbKtji9X1O34lTZJ93U7DXJiMGl+jh3WU5nU
X-Google-Smtp-Source: ANB0VdYMBdyO22mNCPI9wS4oKBdtD6dgio7Om/fJ3TwvnK7Dz1zvsc7UcOyHwrqkSQv/Ti6/VKYvW1RC35WVT8EB8LM=
X-Received: by 2002:aca:586:: with SMTP id
 128-v6mr22198481oif.185.1536053804863; 
 Tue, 04 Sep 2018 02:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLG+MZOg8-O76kXruUYeC=c=pLUEU4UuV8+bO4sqhegTJA@mail.gmail.com>
 <CAARXrtk9YPLQJ9NUwjaFYLhaz9K4+hU44HwBtt4WuUTxhtksCw@mail.gmail.com>
In-Reply-To: <CAARXrtk9YPLQJ9NUwjaFYLhaz9K4+hU44HwBtt4WuUTxhtksCw@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 4 Sep 2018 15:07:05 +0530
Message-ID: <CAE33tLEe9PsP9XKcEusxB3gRxhxNUz-YznZsxE6U00kDWFktKw@mail.gmail.com>
Subject: Re: Temperature Sensor not showing up.
To: mine260309@gmail.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000651645057508658a"
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
X-List-Received-Date: Tue, 04 Sep 2018 10:11:35 -0000

--000000000000651645057508658a
Content-Type: text/plain; charset="UTF-8"

Hi Lei,

I created on configuration file *meta-zaius/recipes-phosphor/*
*sensors/phosphor-hwmon%/obmc/**hwmon/ahb/apb/i2c@1e78a000/*
*i2c-bus@90/tmp75aidgk.conf* with content* LABEL_temp1 = "ambient"*. Built
the system. Stiil temperature sensor and its reading is not showing up. Do
I need to change anything in the file *linux/arch/arm/boot/dts/*
*aspeed-bmc-opp-zaius.dts*


Thanks and Regards,

Akash G J

On Mon, Sep 3, 2018 at 11:49 AM Lei YU <mine260309@gmail.com> wrote:

> Hi Akash,
>
> The sensors need to be configured at build time.
> Please refer to:
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> or
>
> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#hwmon-sensors
>
> Thanks!
>
> On Mon, Sep 3, 2018 at 2:03 PM AKASH G J <akashgj91@gmail.com> wrote:
> >
> > Hi Team,
> >
> > I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed
> AST-2500. The board we are using have a temperature sensor in I2C interface.
> >
> > When I am executing the command curl -b jcar -k
> http://root:0penBmc@169.254.8.221:18080/xyz/openbmc_project/sensors/temperature
> it is giving reply as curl: (52) Empty reply from server
> >
> > Ipmitool command: ipmitool -I dbus sdr elist full also not showing the
> temperature sensor and its reading
> >
> > Please someone help to resolve the problem.
> >
> >
> > Thanks and Regards,
> >
> > Akash
>

--000000000000651645057508658a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 Lei,</div><div><br></div><div>I created on configuration file <b>meta-zaiu=
s/recipes-phosphor/</b><b>sensors/phosphor-hwmon%/obmc/</b><b>hwmon/ahb/apb=
/i2c@1e78a000/</b><b>i2c-bus@90/tmp75aidgk.conf</b> with content<b> LABEL_t=
emp1 =3D &quot;ambient&quot;</b>. Built the system. Stiil temperature senso=
r and its reading is not showing up. Do I need to change anything in the fi=
le<b> </b><b><span class=3D"gmail-repo-root gmail-js-repo-root"><span class=
=3D"gmail-js-path-segment"><span>linux</span></span></span><span class=3D"g=
mail-separator">/</span><span class=3D"gmail-js-path-segment"><span>arch</s=
pan></span><span class=3D"gmail-separator">/</span><span class=3D"gmail-js-=
path-segment"><span>arm</span></span><span class=3D"gmail-separator">/</spa=
n><span class=3D"gmail-js-path-segment"><span>boot</span></span><span class=
=3D"gmail-separator">/</span><span class=3D"gmail-js-path-segment"><span>dt=
s</span></span><span class=3D"gmail-separator"><strong>/</strong></span></b=
><strong class=3D"gmail-final-path">aspeed-bmc-opp-zaius.dts</strong></div>=
<div><strong class=3D"gmail-final-path"></strong><b><strong class=3D"gmail-=
final-path"></strong></b><br></div><div><br></div><div>Thanks and Regards,<=
/div><div><br></div><div>Akash G J<br></div><div>
   =20
   <b><span class=3D"gmail-separator"><strong></strong></span></b></div></d=
iv></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Sep 3, 2018 at 11:49 AM Lei YU &lt;<a href=3D"mailto:mine260309@gmail.com=
" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi Akash,<br>
<br>
The sensors need to be configured at build time.<br>
Please refer to:<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/sensor-architecture.=
md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/bl=
ob/master/sensor-architecture.md</a><br>
or<br>
<a href=3D"https://github.com/mine260309/openbmc-intro/blob/master/Porting_=
Guide.md#hwmon-sensors" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#hwmon-sensors</a=
><br>
<br>
Thanks!<br>
<br>
On Mon, Sep 3, 2018 at 2:03 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gm=
ail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; I built OpenBMC Linux using Zaius configuration and booted on BMC Aspe=
ed AST-2500. The board we are using have a temperature sensor in I2C interf=
ace.<br>
&gt;<br>
&gt; When I am executing the command curl -b jcar -k <a href=3D"http://root=
:0penBmc@169.254.8.221:18080/xyz/openbmc_project/sensors/temperature" rel=
=3D"noreferrer" target=3D"_blank">http://root:0penBmc@169.254.8.221:18080/x=
yz/openbmc_project/sensors/temperature</a> it is giving reply as curl: (52)=
 Empty reply from server<br>
&gt;<br>
&gt; Ipmitool command: ipmitool -I dbus sdr elist full also not showing the=
 temperature sensor and its reading<br>
&gt;<br>
&gt; Please someone help to resolve the problem.<br>
&gt;<br>
&gt;<br>
&gt; Thanks and Regards,<br>
&gt;<br>
&gt; Akash<br>
</blockquote></div>

--000000000000651645057508658a--
