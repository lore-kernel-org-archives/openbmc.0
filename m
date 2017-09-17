Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TERfcsHa"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwN8B3QxVzDrLk
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 07:49:29 +1000 (AEST)
Received: by mail-ua0-x22c.google.com with SMTP id t5so3560853uad.13
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zoY2fVyyst/DWYVRPBh55sbTJyvdvHnXo3BpBRIXs7U=;
 b=TERfcsHaEBooZS/8RnafaU1tSvHAAWNwaGo7Pu2dMGtgo0I1SOXkhpBItOZjX2D1XP
 fMXyeYuM+tMFixDMz5xjc36+6F43o+5JCL7PeA6NhHFvtvQOrkqpozZFT+zfVDyZ9lDL
 SkEEZc6wceWZa8M7xCJosJr9QLQhJQ9H2MKg9bTCbIs508GzClLJhjg5X4EaS+LbmHsp
 NCjmg3G9BtkRQxNlxGH8Q7Jhku9OHwHRv4fA0HgGSr1MMSnPAZ0YMvJbU40V1W1ATyQg
 A9dhFSt8aNUMTsmO5NduXOGlWezOMat1D72TJx1auGvU8CR3WhRw2h6adLusG/1BAxtI
 7MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zoY2fVyyst/DWYVRPBh55sbTJyvdvHnXo3BpBRIXs7U=;
 b=RqQb582lZKPgC3M4LU4WtyTMZKSpRHpvycFO/hdH7JA6dgQua3CuW47U8HAT9YkAee
 R0bf4dAc4lfe4Yhw15f5PK8Ym3fiOV3hCJvcPdR9rHNEf6YW1VCf9CZ9am2vDGrqJbcv
 hgjujFybbuvu+g6c/7hPCnKY0VGqNLOUnseXZqcOPMXi14g4ZTqZwH3YbOEajJO7jSkp
 O5EirKpvXbTfdAcdd4n0gj5Awo3tqW8zbTBfAPNHPU0qLIbKiHKT/GM060xKURGwtly7
 Zi5RgejRAqps5i0ylUvuIzaQ0a2FDjTv8IXC5FD7FIdE2utLVaSmLauFUQ8S1OZwx5eW
 P36A==
X-Gm-Message-State: AHPjjUhmVLynyJjizmTJ65lssIj3XZrT5ve3hh2f4xl5+EWBJL83G0zq
 4lmwa7u/UWS+JYFhltJQWyLZq/co/r11mLEK1udy1g==
X-Google-Smtp-Source: AOwi7QByimmLcM0xhK5io0uR5jtt30pC3Fsr0B+vxaYlAWCcXX87cB7njVv1jBDcmq/85GZ4uwJ1jKlvzuu/d8/ETc8=
X-Received: by 10.176.23.107 with SMTP id k43mr28204453uaf.130.1505684966612; 
 Sun, 17 Sep 2017 14:49:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Sun, 17 Sep 2017 14:49:05 -0700 (PDT)
In-Reply-To: <1505684302.29751.6.camel@fuzziesquirrel.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
 <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
 <1505684302.29751.6.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 17 Sep 2017 14:49:05 -0700
Message-ID: <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f4030436048c949a8d05596999c4"
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
X-List-Received-Date: Sun, 17 Sep 2017 21:49:31 -0000

--f4030436048c949a8d05596999c4
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 17, 2017 at 2:38 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > > Is it just stuck behind a gpio for no reason?  If that is the case,
> > > I
> > > would think you just wiggle the gpio when the bmc boots.
> >
> > In this particular case, it's behind a GPIO so it doesn't drain the
> > battery -- or at least that's my understanding of the design.
> >
> > The appropriate time would be -- when someone tries to read it from
> > the host.  What you're suggesting is that, the ipmi daemon, when it
> > receives a request for this sensor - that is then launches something
> > that sets the gpio, and then waits for the dbus objects to exist from
> > the launched phosphor-hwmon, before then requesting the sensor value
> > in its normal course of action.  Because it's my understanding it's a
> > gated sensor so that it doesn't drain the battery, which means
> > leaving it open effectively permanently isn't an option.  If I'm
> > misunderstanding the goal of the design, then obviously just
> > unlocking the GPIO effectively permanently is a solution.
>
> Aha!  Now I understand the motivation.  And yes the approach I've
> outlined is quite painful.  In my defense I would not have suggested
> that had I known :-)
>

Ahh - yeah, sorry, I didn't explain the entire use-case path initially.  I
assumed gpio-gated sensors were just a normal thing.

>
> > >
> > > I'm not arguing that there aren't several board setups where this
> > > is
> > > the case.  Rather, board designers are free to do whatever they
> > > want,
> > > and if we start putting the board specific logic in phosphor-hwmon
> > > you
> > > won't have "one nice package" for very long....
> >
> > True-ish.  This is quite similar to dealing with GAIN and OFFSET.
>
> Those feel different to me.  They are needed for thermistor type
> sensors regardless of board wiring.
>
> > Those are particulars of a board that now get factored into the
> > value.  I'm not suggesting something beyond the norms of hwmon.  It
> > would be convenient however, if the ADC driver could be programmed to
> > know that some sensor is gated by a GPIO and handled flipping,
>
> Can you reach out to Guenter or the relevant maintainer (is this an IIO
> device?) for ideas here?  I hadn't mentioned it but in the back of my
> head this whole time I've been wondering about a completely in-kernel
> solution.
>

I'll reach out and see if this should go into the adc driver or the
iio-hwmon.  Since those are the paths that are involved.  The sensor itself
it plugged into the aspeed adc, and then controlled by a gpio.  My initial
thought is the adc should be configured to know if such things are required
for its sensors, so that iio-hwmon wouldn't need to know.

>
> > waiting, reading, and flipping-back for someone -- quasi-similarly to
> > i2c muxes that use gpios.  Except, obviously, the waiting and setting
> > it back part are ... a bad plan to build into a driver, in that it
>
> It has to be done in one place or the other, does it not?  You mention
> i2c muxes - managing those isn't delegated to userspace (there are
> drivers for i2c muxes) so maybe this situation need not be any
> different?
>

That's what I'm thinking, if I can put it in the driver as something that
can be configured - then perhaps that'll be a neater solution.  Although,
depending on how it gets added, it might be too platform specific.  I'm
using an Aspeed part, but I know there are other manufacturers, and if this
type of arrangement exists elsewhere, more drivers will need modification
in-lieu of a solution at the highest level.  I see the value in both
approaches.

Downstream I have a gpio addition to phosphor-hwmon -- that I'll hold off
on submitting.  I'm going to pursue the modifications to the ADC, I think
they might be appropriate at that level, and if I recall I known the author
and may be able to rapidly implement the necessary modification myself.

>
> > could delay returning a value.  Although -- one could argue the fan
> > speed controller driver does that -- takes time to respond.  It's
> > just, one would then also want to configure the wait time, because
>
> In the very near future I intend to make all the wait/delay/retry
> intervals runtime configurable to handle exactly these kinds of nuances
> between devices and their drivers.
>
> > some configurations will take longer for a sensor value to stabilize.
> >
> > Patrick
> >
>

--f4030436048c949a8d05596999c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Sep 17, 2017 at 2:38 PM, Brad Bishop <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirre=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
&gt; &gt; Is it just stuck behind a gpio for no reason?=C2=A0 If that is th=
e case,<br>
&gt; &gt; I<br>
&gt; &gt; would think you just wiggle the gpio when the bmc boots.<br>
&gt;<br>
&gt; In this particular case, it&#39;s behind a GPIO so it doesn&#39;t drai=
n the<br>
&gt; battery -- or at least that&#39;s my understanding of the design.<br>
&gt;<br>
&gt; The appropriate time would be -- when someone tries to read it from<br=
>
&gt; the host.=C2=A0 What you&#39;re suggesting is that, the ipmi daemon, w=
hen it<br>
&gt; receives a request for this sensor - that is then launches something<b=
r>
&gt; that sets the gpio, and then waits for the dbus objects to exist from<=
br>
&gt; the launched phosphor-hwmon, before then requesting the sensor value<b=
r>
&gt; in its normal course of action.=C2=A0 Because it&#39;s my understandin=
g it&#39;s a<br>
&gt; gated sensor so that it doesn&#39;t drain the battery, which means<br>
&gt; leaving it open effectively permanently isn&#39;t an option.=C2=A0 If =
I&#39;m<br>
&gt; misunderstanding the goal of the design, then obviously just<br>
&gt; unlocking the GPIO effectively permanently is a solution.<br>
<br>
</span>Aha!=C2=A0 Now I understand the motivation.=C2=A0 And yes the approa=
ch I&#39;ve<br>
outlined is quite painful.=C2=A0 In my defense I would not have suggested<b=
r>
that had I known :-)<br></blockquote><div><br></div><div>Ahh - yeah, sorry,=
 I didn&#39;t explain the entire use-case path initially.=C2=A0 I assumed g=
pio-gated sensors were just a normal thing.=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<span class=3D""><br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not arguing that there aren&#39;t several board setups wh=
ere this<br>
&gt; &gt; is<br>
&gt; &gt; the case.=C2=A0 Rather, board designers are free to do whatever t=
hey<br>
&gt; &gt; want,<br>
&gt; &gt; and if we start putting the board specific logic in phosphor-hwmo=
n<br>
&gt; &gt; you<br>
&gt; &gt; won&#39;t have &quot;one nice package&quot; for very long....<br>
&gt;<br>
&gt; True-ish.=C2=A0 This is quite similar to dealing with GAIN and OFFSET.=
=C2=A0<br>
<br>
</span>Those feel different to me.=C2=A0 They are needed for thermistor typ=
e<br>
sensors regardless of board wiring.<br>
<span class=3D""><br>
&gt; Those are particulars of a board that now get factored into the<br>
&gt; value.=C2=A0 I&#39;m not suggesting something beyond the norms of hwmo=
n.=C2=A0 It<br>
&gt; would be convenient however, if the ADC driver could be programmed to<=
br>
&gt; know that some sensor is gated by a GPIO and handled flipping,<br>
<br>
</span>Can you reach out to Guenter or the relevant maintainer (is this an =
IIO<br>
device?) for ideas here?=C2=A0 I hadn&#39;t mentioned it but in the back of=
 my<br>
head this whole time I&#39;ve been wondering about a completely in-kernel<b=
r>
solution.<br></blockquote><div><br></div><div>I&#39;ll reach out and see if=
 this should go into the adc driver or the iio-hwmon.=C2=A0 Since those are=
 the paths that are involved.=C2=A0 The sensor itself it plugged into the a=
speed adc, and then controlled by a gpio.=C2=A0 My initial thought is the a=
dc should be configured to know if such things are required for its sensors=
, so that iio-hwmon wouldn&#39;t need to know.</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<span class=3D""><br>
&gt; waiting, reading, and flipping-back for someone -- quasi-similarly to<=
br>
&gt; i2c muxes that use gpios.=C2=A0 Except, obviously, the waiting and set=
ting<br>
&gt; it back part are ... a bad plan to build into a driver, in that it<br>
<br>
</span>It has to be done in one place or the other, does it not?=C2=A0 You =
mention<br>
i2c muxes - managing those isn&#39;t delegated to userspace (there are<br>
drivers for i2c muxes) so maybe this situation need not be any<br>
different?<br></blockquote><div><br></div><div>That&#39;s what I&#39;m thin=
king, if I can put it in the driver as something that can be configured - t=
hen perhaps that&#39;ll be a neater solution.=C2=A0 Although, depending on =
how it gets added, it might be too platform specific.=C2=A0 I&#39;m using a=
n Aspeed part, but I know there are other manufacturers, and if this type o=
f arrangement exists elsewhere, more drivers will need modification in-lieu=
 of a solution at the highest level.=C2=A0 I see the value in both approach=
es.</div><div><br></div><div>Downstream I have a gpio addition to phosphor-=
hwmon -- that I&#39;ll hold off on submitting.=C2=A0 I&#39;m going to pursu=
e the modifications to the ADC, I think they might be appropriate at that l=
evel, and if I recall I known the author and may be able to rapidly impleme=
nt the necessary modification myself.</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; could delay returning a value.=C2=A0 Although -- one could argue the f=
an<br>
&gt; speed controller driver does that -- takes time to respond.=C2=A0 It&#=
39;s<br>
&gt; just, one would then also want to configure the wait time, because<br>
<br>
</span>In the very near future I intend to make all the wait/delay/retry<br=
>
intervals runtime configurable to handle exactly these kinds of nuances<br>
between devices and their drivers.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; some configurations will take longer for a sensor value to stabilize.<=
br>
&gt;<br>
&gt; Patrick<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--f4030436048c949a8d05596999c4--
