Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eOzfcFlj"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwpsL3GjqzDqjB
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 00:53:09 +1000 (AEST)
Received: by mail-ua0-x234.google.com with SMTP id s15so453977uag.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PLDV0Qjzm+RnzJip0qqGoLoRaF2vN8Fulk3pphxyaGw=;
 b=eOzfcFlj9ULxArXpoyzJFA4RoW1YqdqV8xID1m8z1GFDSBK/+vIqjBVC2k/Q3C+8GK
 TwV+W/2EfrIao4QtBn1vZ0lKYP/j/gB5w/0G2ATd2l07M+5+1cja7R0Y6zpEC7MClex8
 Wd7HB6wQEHPpljM3HYo08oJi+EO4h9cA10KSO5poWar4H7KCnBU/lPgWx9f0JCJ7xu21
 2JtezWqIht8wi2k/g26ZNSeIuGwQHdv/Kz6i0YJP1fgoVUAlTTt4lGPmLcEp06MJ0MRQ
 GKpbqhrAjrho4KXrHnYzVrZej051a2PGoqyWWBF4HrmpDKViLBcCCfmJeoWOisBBemt2
 KBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PLDV0Qjzm+RnzJip0qqGoLoRaF2vN8Fulk3pphxyaGw=;
 b=LAkMMcJq5aOsR1wzuQ4n1Xr4PGSz41oaECWi1ASOcLA29NJo+HNO1T7MPKDI1LqMVQ
 kbspVivo0+2YHhR2cLH6Bf5ioxL6L/LkSem1Oo3YogiMCu3cA+cFCbcxlESXYrEN0UVi
 ozaz/XjiEJG0iqXJMK6posTsOjodnm/co7D6FdwXVaRdu3+DJZNrIGzu6evVwkL6k0lJ
 zDcjWI5j7uHFAYwBuKVPx96kSBEygFImWlFYtJRrLrYBG0/EyBWkNW52Ailc9vujEZUI
 AQDAKwOiQHFmWXry2m5zHK8vV2ExNVRRqMf9QuNbAAFMci/az1Ha0ZRS7vzoD7rpTGF7
 KWuA==
X-Gm-Message-State: AHPjjUjkCwOstKMo+cz+g3QqAfxyiK0NTirhi+YCHSBYMjTQAy8nVoRs
 XJMXpTGe8Fx8v/yL6XutMVT/SI5AUKsaJ4D0X8+MvQ==
X-Google-Smtp-Source: ADKCNb5I5ENiOaBfPbgwdb1fuaPV36jpUQIB2MV/C9F+IYQ3dJBR49rIe71R3kKYr3NS5Qjb0NQM8Z6v21kCY08UFdc=
X-Received: by 10.176.6.8 with SMTP id f8mr27442684uaf.38.1505746387166; Mon,
 18 Sep 2017 07:53:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Mon, 18 Sep 2017 07:52:46 -0700 (PDT)
In-Reply-To: <1505719954.4080.20.camel@aj.id.au>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
 <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
 <1505684302.29751.6.camel@fuzziesquirrel.com>
 <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
 <1505719954.4080.20.camel@aj.id.au>
From: Patrick Venture <venture@google.com>
Date: Mon, 18 Sep 2017 07:52:46 -0700
Message-ID: <CAO=notw2BYmCknPqMzf5HXpfDtVjQ5wfZqS9YptG632QfKngzQ@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c123fe488836d055977e6ae"
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
X-List-Received-Date: Mon, 18 Sep 2017 14:53:11 -0000

--94eb2c123fe488836d055977e6ae
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 12:32 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Sun, 2017-09-17 at 14:49 -0700, Patrick Venture wrote:
> > > > Those are particulars of a board that now get factored into the
> > > > value.  I'm not suggesting something beyond the norms of hwmon.  It
> > > > would be convenient however, if the ADC driver could be programmed to
> > > > know that some sensor is gated by a GPIO and handled flipping,
> > >
> > > Can you reach out to Guenter or the relevant maintainer (is this an IIO
> > > device?) for ideas here?  I hadn't mentioned it but in the back of my
> > > head this whole time I've been wondering about a completely in-kernel
> > > solution.
> >
> > I'll reach out and see if this should go into the adc driver or the
> > iio-hwmon.  Since those are the paths that are involved.  The sensor
> > itself it plugged into the aspeed adc, and then controlled by a
> > gpio.  My initial thought is the adc should be configured to know if
> > such things are required for its sensors, so that iio-hwmon wouldn't
> > need to know.
>
> My gut feeling is the other way around. There should be some higher-
> level driver (i.e. still in the kernel, not in userspace) coordinating
> the GPIO and the ADC such that we sample values at the appropriate time
> after the GPIO has been set. The ADC driver should be well defined in
> terms of the function the ADC hardware provides - gluing in random
> GPIOs makes the ADC driver do things the ADC hardware itself does not
> do.
>

Interesting.  That does make sense, however, one often sees -- some level
of "oh and this" configuration with drivers.  Which I'm in general against,
but it does have a certain cleanness to putting the value update at the
lowest point possible. -- Although, that could easily mean the earliest
place it is read, which is in the hwmon interface -- it can know do flip a
gpio and wait, whereas the ADC just keeps on doing its thing.


>
> I'm not across how the iio-hwmon bridge works so I don't know how
> trivial it would be to re-export the sampled ADC values from this
> higher-level driver as another IIO channel, but that's probably the
> approach I would look at to glue it into hwmon.
>
> That's all just off-the-cuff opinion though, so take it with a grain of
> salt. Certainly talking to the IIO and hwmon maintainers is the right
> approach.
>

I'll be broaching this subject in the next few days and will report back
here.


>
> Cheers,
>
> Andrew

--94eb2c123fe488836d055977e6ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Sep 18, 2017 at 12:32 AM, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sun, 2017-09=
-17 at 14:49 -0700, Patrick Venture wrote:<br>
</span><span class=3D"">&gt; &gt; &gt; Those are particulars of a board tha=
t now get factored into the<br>
&gt; &gt; &gt; value.=C2=A0 I&#39;m not suggesting something beyond the nor=
ms of hwmon.=C2=A0 It<br>
&gt; &gt; &gt; would be convenient however, if the ADC driver could be prog=
rammed to<br>
&gt; &gt; &gt; know that some sensor is gated by a GPIO and handled flippin=
g,<br>
&gt; &gt;<br>
&gt; &gt; Can you reach out to Guenter or the relevant maintainer (is this =
an IIO<br>
&gt; &gt; device?) for ideas here?=C2=A0 I hadn&#39;t mentioned it but in t=
he back of my<br>
&gt; &gt; head this whole time I&#39;ve been wondering about a completely i=
n-kernel<br>
&gt; &gt; solution.<br>
&gt;<br>
&gt; I&#39;ll reach out and see if this should go into the adc driver or th=
e<br>
&gt; iio-hwmon.=C2=A0 Since those are the paths that are involved.=C2=A0 Th=
e sensor<br>
&gt; itself it plugged into the aspeed adc, and then controlled by a<br>
&gt; gpio.=C2=A0 My initial thought is the adc should be configured to know=
 if<br>
&gt; such things are required for its sensors, so that iio-hwmon wouldn&#39=
;t<br>
&gt; need to know.<br>
<br>
</span>My gut feeling is the other way around. There should be some higher-=
<br>
level driver (i.e. still in the kernel, not in userspace) coordinating<br>
the GPIO and the ADC such that we sample values at the appropriate time<br>
after the GPIO has been set. The ADC driver should be well defined in<br>
terms of the function the ADC hardware provides - gluing in random<br>
GPIOs makes the ADC driver do things the ADC hardware itself does not<br>
do.<br></blockquote><div><br></div><div>Interesting.=C2=A0 That does make s=
ense, however, one often sees -- some level of &quot;oh and this&quot; conf=
iguration with drivers.=C2=A0 Which I&#39;m in general against, but it does=
 have a certain cleanness to putting the value update at the lowest point p=
ossible. -- Although, that could easily mean the earliest place it is read,=
 which is in the hwmon interface -- it can know do flip a gpio and wait, wh=
ereas the ADC just keeps on doing its thing.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
I&#39;m not across how the iio-hwmon bridge works so I don&#39;t know how<b=
r>
trivial it would be to re-export the sampled ADC values from this<br>
higher-level driver as another IIO channel, but that&#39;s probably the<br>
approach I would look at to glue it into hwmon.<br>
<br>
That&#39;s all just off-the-cuff opinion though, so take it with a grain of=
<br>
salt. Certainly talking to the IIO and hwmon maintainers is the right<br>
approach.<br></blockquote><div><br></div><div>I&#39;ll be broaching this su=
bject in the next few days and will report back here.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Andrew</blockquote></div><br></div></div>

--94eb2c123fe488836d055977e6ae--
