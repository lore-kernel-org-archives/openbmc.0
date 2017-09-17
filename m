Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ff2W4Qs4"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwM9J2jbZzDqG5
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 07:05:23 +1000 (AEST)
Received: by mail-vk0-x22d.google.com with SMTP id m140so2965466vka.10
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eADzyDcTd+mVoXWVtS1xqx7xYIIJeAFU6Sy2V/KeafI=;
 b=ff2W4Qs4a33TfThohOyYELnMqUYMMPHEpflm8U9O61QCZrXLj+Mdu2rSKMqScJsMtZ
 UK79cxcJ8T2HBS/mAptI19wIKYbzNkDlwuk4VMWUVaJx4FuloV9zLk4MVXWLiI3ZzyAt
 fHqKwz0YT5he/KH7xBLLuyhlWoiUbTuNK+PpgeyYFUJw0baYaBoLW2gIXwpNSxZe3D3G
 uMS2ueeeeHBxSvSG/k3XSvtDC8KcXHJkgWqYmkHXwofJc3nSmFtrP/vruiEbcFVLC3zI
 0oi+GY0Hb66dYtAvmCKMBxSQHK528i9i3pLrzew8z02GJJ+1TgFsAF3W+xqAUROzdRbV
 ja1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eADzyDcTd+mVoXWVtS1xqx7xYIIJeAFU6Sy2V/KeafI=;
 b=Mf/c4VqXyHaN0eJndGJ02U0LeaJqOgL6nv74z/Gz6ElHsSJzcDF+5UK2eOUqCXimyf
 lrmSuLZiNPVx/RuJW+Nz5G+2munQiQNXnPfzO2ScaUBIK6QxxYFLfl+zfVz9Fuuexui5
 s92hBQLfX59cLQ+yPfDo5n9W4lX0M2sSMSssJZRP4qwcWg/XSOiIZ3eJpiBWQm2yJQCK
 +D72TqJ2cabVPWOr9HN7iWxA7o5L/AAAGBc4cT9IeOn/s98ZEEaavHLVzA/iM6vUhg15
 URWO+pntf3VkY+AcNIujlSMR11U146vMCHy0kYVagCjRPqEBgoPqlo2vm+alop7wA4TC
 IGPQ==
X-Gm-Message-State: AHPjjUhopeqtEoFsVqsKAzX+wsB7cckGRml9sMrfHGvU0cicemLnDzEu
 NPIrywKBflZIQTM6cm11EJlsB5c6DZGvOlcZxMZrxA==
X-Google-Smtp-Source: AOwi7QD3UG5iugyzxAVRB0mo2UflPG3554Q+sad6SqZBiqZt7c1oYomqvaMHAJYRcK4akyLwEI1OuCZ4+l4rHsvpjCk=
X-Received: by 10.31.108.2 with SMTP id h2mr24845215vkc.129.1505682320121;
 Sun, 17 Sep 2017 14:05:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Sun, 17 Sep 2017 14:04:59 -0700 (PDT)
In-Reply-To: <1505669634.29751.4.camel@fuzziesquirrel.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 17 Sep 2017 14:04:59 -0700
Message-ID: <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114782c6d678cd055968fbfd"
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
X-List-Received-Date: Sun, 17 Sep 2017 21:05:25 -0000

--001a114782c6d678cd055968fbfd
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 17, 2017 at 10:33 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > >
> > > What do you think of this?
> > >
> > > 1 - You simply wiggle the gpio from a script or small application
> > > at
> > >       the appropriate time.
> >
> > My thought here is -- the appropriate time is, right before phosphor-
> > hwmon wants to read it.
>
> phosphor-hwmon shouldn't be providing an interface for something
> that isn't accessible.  And it shouldn't concern itself with
> making something accessible because there could be any number of
> ways to do that, based on the wiring of the board.
>
> What I meant was why is the sensor gated by a gpio?  For example, is it
> because the sensor is only available when some power domain is actually
> powered on?  In that example, the appropriate time would be when
> the power domain is turned on and off.
>
> Is it just stuck behind a gpio for no reason?  If that is the case, I
> would think you just wiggle the gpio when the bmc boots.
>

In this particular case, it's behind a GPIO so it doesn't drain the battery
-- or at least that's my understanding of the design.

The appropriate time would be -- when someone tries to read it from the
host.  What you're suggesting is that, the ipmi daemon, when it receives a
request for this sensor - that is then launches something that sets the
gpio, and then waits for the dbus objects to exist from the launched
phosphor-hwmon, before then requesting the sensor value in its normal
course of action.  Because it's my understanding it's a gated sensor so
that it doesn't drain the battery, which means leaving it open effectively
permanently isn't an option.  If I'm misunderstanding the goal of the
design, then obviously just unlocking the GPIO effectively permanently is a
solution.


>
> >
> > > 2 - An application other than phosphor-hwmon monitors this gpio and
> > >       binds the driver to it (or unbinds).
> >
> > In this case, won't the device be removed/added to the hwmon sysfs on
> > demand?  I don't believe phosphor-hwmon picks up new devices
> > automatically.
>
> Yes, on demand, but he phosphor-layer has a udev rule that launches
> (and terminates) a phosphor-hwmon instance along with it.
>
> >
> > > 3 - phosphor-hwmon works without modification.
> > >
> > > In fact, #2 is already done - Matt Spinler recently added code to
> > > phosphor-gpio-monitor to do exactly this.
> >
> > I haven't looked at gpio-monitor.
> >
> > > I prefer something like this for two reasons:
> > >
> > > 1 - Consistency in how we handle things.  It becomes easier to
> > > write
> > > howtos or cookbooks to provide guidance in the future.
> >
> >
> > > 2 - We avoid one-offs in phosphor-hwmon.
> >
> > I wouldn't necessarily consider it a one-off, as I can immediately
> > think of at least one other motherboard that would benefit from such
> > an opportunity.  Also, in this case it would all fit into one nice
> > package -- one thing to configure by adding the corresponding line to
> > a configuration file.
>
> I'm not arguing that there aren't several board setups where this is
> the case.  Rather, board designers are free to do whatever they want,
> and if we start putting the board specific logic in phosphor-hwmon you
> won't have "one nice package" for very long....
>

True-ish.  This is quite similar to dealing with GAIN and OFFSET.  Those
are particulars of a board that now get factored into the value.  I'm not
suggesting something beyond the norms of hwmon.  It would be convenient
however, if the ADC driver could be programmed to know that some sensor is
gated by a GPIO and handled flipping, waiting, reading, and flipping-back
for someone -- quasi-similarly to i2c muxes that use gpios.  Except,
obviously, the waiting and setting it back part are ... a bad plan to build
into a driver, in that it could delay returning a value.  Although -- one
could argue the fan speed controller driver does that -- takes time to
respond.  It's just, one would then also want to configure the wait time,
because some configurations will take longer for a sensor value to
stabilize.

Patrick

--001a114782c6d678cd055968fbfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Sep 17, 2017 at 10:33 AM, Brad Bishop <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirr=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
&gt; &gt;<br>
&gt; &gt; What do you think of this?<br>
&gt; &gt;<br>
&gt; &gt; 1 - You simply wiggle the gpio from a script or small application=
<br>
&gt; &gt; at<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 the appropriate time.<br>
&gt;<br>
&gt; My thought here is -- the appropriate time is, right before phosphor-<=
br>
&gt; hwmon wants to read it.<br>
<br>
</span>phosphor-hwmon shouldn&#39;t be providing an interface for something=
<br>
that isn&#39;t accessible.=C2=A0 And it shouldn&#39;t concern itself with<b=
r>
making something accessible because there could be any number of<br>
ways to do that, based on the wiring of the board.<br>
<br>
What I meant was why is the sensor gated by a gpio?=C2=A0 For example, is i=
t<br>
because the sensor is only available when some power domain is actually<br>
powered on?=C2=A0 In that example, the appropriate time would be when<br>
the power domain is turned on and off.<br>
<br>
Is it just stuck behind a gpio for no reason?=C2=A0 If that is the case, I<=
br>
would think you just wiggle the gpio when the bmc boots.<br></blockquote><d=
iv><br></div><div>In this particular case, it&#39;s behind a GPIO so it doe=
sn&#39;t drain the battery -- or at least that&#39;s my understanding of th=
e design.</div><div><br></div><div>The appropriate time would be -- when so=
meone tries to read it from the host.=C2=A0 What you&#39;re suggesting is t=
hat, the ipmi daemon, when it receives a request for this sensor - that is =
then launches something that sets the gpio, and then waits for the dbus obj=
ects to exist from the launched phosphor-hwmon, before then requesting the =
sensor value in its normal course of action.=C2=A0 Because it&#39;s my unde=
rstanding it&#39;s a gated sensor so that it doesn&#39;t drain the battery,=
 which means leaving it open effectively permanently isn&#39;t an option.=
=C2=A0 If I&#39;m misunderstanding the goal of the design, then obviously j=
ust unlocking the GPIO effectively permanently is a solution.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; =C2=A0<br>
&gt; &gt; 2 - An application other than phosphor-hwmon monitors this gpio a=
nd<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 binds the driver to it (or unbinds).<br>
&gt;<br>
&gt; In this case, won&#39;t the device be removed/added to the hwmon sysfs=
 on<br>
&gt; demand?=C2=A0 I don&#39;t believe phosphor-hwmon picks up new devices<=
br>
&gt; automatically.<br>
<br>
</span>Yes, on demand, but he phosphor-layer has a udev rule that launches<=
br>
(and terminates) a phosphor-hwmon instance along with it.<br>
<span class=3D""><br>
&gt; =C2=A0<br>
&gt; &gt; 3 - phosphor-hwmon works without modification.<br>
&gt; &gt;<br>
&gt; &gt; In fact, #2 is already done - Matt Spinler recently added code to=
<br>
&gt; &gt; phosphor-gpio-monitor to do exactly this.<br>
&gt;<br>
&gt; I haven&#39;t looked at gpio-monitor.<br>
&gt; =C2=A0<br>
&gt; &gt; I prefer something like this for two reasons:<br>
&gt; &gt;<br>
&gt; &gt; 1 - Consistency in how we handle things.=C2=A0 It becomes easier =
to<br>
&gt; &gt; write<br>
&gt; &gt; howtos or cookbooks to provide guidance in the future.=C2=A0<br>
&gt;<br>
&gt; =C2=A0<br>
&gt; &gt; 2 - We avoid one-offs in phosphor-hwmon.<br>
&gt;<br>
&gt; I wouldn&#39;t necessarily consider it a one-off, as I can immediately=
<br>
&gt; think of at least one other motherboard that would benefit from such<b=
r>
&gt; an opportunity.=C2=A0 Also, in this case it would all fit into one nic=
e<br>
&gt; package -- one thing to configure by adding the corresponding line to<=
br>
&gt; a configuration file.<br>
<br>
</span>I&#39;m not arguing that there aren&#39;t several board setups where=
 this is<br>
the case.=C2=A0 Rather, board designers are free to do whatever they want,<=
br>
and if we start putting the board specific logic in phosphor-hwmon you<br>
won&#39;t have &quot;one nice package&quot; for very long....<br></blockquo=
te><div><br></div><div>True-ish.=C2=A0 This is quite similar to dealing wit=
h GAIN and OFFSET.=C2=A0 Those are particulars of a board that now get fact=
ored into the value.=C2=A0 I&#39;m not suggesting something beyond the norm=
s of hwmon.=C2=A0 It would be convenient however, if the ADC driver could b=
e programmed to know that some sensor is gated by a GPIO and handled flippi=
ng, waiting, reading, and flipping-back for someone -- quasi-similarly to i=
2c muxes that use gpios.=C2=A0 Except, obviously, the waiting and setting i=
t back part are ... a bad plan to build into a driver, in that it could del=
ay returning a value.=C2=A0 Although -- one could argue the fan speed contr=
oller driver does that -- takes time to respond.=C2=A0 It&#39;s just, one w=
ould then also want to configure the wait time, because some configurations=
 will take longer for a sensor value to stabilize.</div><div><br></div><div=
>Patrick</div></div><br></div></div>

--001a114782c6d678cd055968fbfd--
