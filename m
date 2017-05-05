Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKHrk09PQzDqCL
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 02:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dlXOZQBa"; 
 dkim-atps=neutral
Received: by mail-wm0-x22e.google.com with SMTP id m123so11687738wma.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fwyOjFWVkurI/vbtxn6OM4mT7swy8Saahe+cHejtRgw=;
 b=dlXOZQBaLb5C5cDNLB5VLmJ7edpFWrRyLMMyQMdk3hYMuxX92kKVFVUJHeWuw7xF/q
 dXCiKcK+FgqrCS7TeqCz6qmKE3/beul2fEf1aAMrpdLSHJ4ovX7znNt6n+4wjCurQXGk
 3HWbhGGYEOwOvh+XCQ7cvCl8ucOAYReSdllFEZB6J7zgnu4bfBWv3YAJaCqPKOCRRDQ2
 4bvt8yeplabeD1VgF6wEEjk9sF2nBmnK7Op5EK7ZhKB1lRID1W2Q1ULiViFbeKSRt6zM
 4GuWhMThWNTREqIghPjxUS5ToIya0j64yLvK7IvBoWAqfL1HBhIann0lWDWOGPwt79dS
 OI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fwyOjFWVkurI/vbtxn6OM4mT7swy8Saahe+cHejtRgw=;
 b=ehsusu3gcbBjd9X84mwmyMkzZ2mpQrNTC07qhZOoL8XcDuB42dr+dikT49lgPkubGr
 hF6SMogb0vsXW76WbAzTfmHGyNC1S/YMYjCLnJCtTFSiMAtoYpeuAfmLhQXtWyo2QgwH
 m59KjLbawg3Dt0EcQUbx/Jhv9oXJyVL+PXFEJAc7qBJLZVuZxydKCARApyQmc1SL3fJo
 E9zVlfn7q7tOZc/QiVm0Kifoa4e33Muzv4ylxGFMQYm1IopWNKkh/ReyabiKQa3l+3qq
 z92t57wIpq9PtqfizS4lW0rGTqKSF1x5v44lojhtiIeaZDWH27m0qVqvlerSlRDvlu4W
 hILg==
X-Gm-Message-State: AN3rC/6jVp5KsxjOKIQEUuACkw3zIFwWm6oZcO7mnVfPSbP5wbukEM92
 UR+IOGL4Qj3CgHXEC455Lohql2BqHeoM
X-Received: by 10.28.206.70 with SMTP id e67mr5588145wmg.37.1494002881922;
 Fri, 05 May 2017 09:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Fri, 5 May 2017 09:48:01 -0700 (PDT)
In-Reply-To: <20170505163406.GB25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 5 May 2017 09:48:01 -0700
Message-ID: <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
Subject: Re: phosphor-hwmon bottleneck potential
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1930b41274bb054ec9a756
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 May 2017 16:48:06 -0000

--94eb2c1930b41274bb054ec9a756
Content-Type: text/plain; charset=UTF-8

I've chatted with Patrick V. separately about the driver.  AST2400/2500 fan
tach hardware measures only one fan at a time.  I think we can adjust the
driver settings to reduce the measurement time but it will scale with # of
tachs being read.

On Fri, May 5, 2017 at 9:34 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, May 05, 2017 at 01:07:45AM -0400, Brad Bishop wrote:
> > > The solution that comes to mind would be to simply parallelize sensor
> > > updates, such that phosphor-hwmon uses threads to update the sensor
> >
> > I think this is a great idea.  But I would vote for some kind of
> > non-blocking or async io rather than threads.  I don't know what support
> > for that sort of thing is available in the hwmon subsystem so I'm not
> > sure if its even possible, but it seems worth a look anyway.
>
> If the IO operation within the hwmon kernel driver is taking 1 second, I
> don't think multi-threading does anything to improve this, except
> perhaps if you have two threads: 1 for dbus and 1 for hwmon polling.
> Going to N threads or N processes for the hwmon polling would not be
> beneficial since there would only be single driver queueing up the N
> threads anyhow.  Two threads just improves the dbus get-property
> response time for returning the cached value.
>
> Hopefully we can use sd-event with a non-blocking read on the hwmon
> sysfs entry to avoid having to resort to multi-threading.
>
> I don't know which device you are interacting with that is taking so
> long or how the driver was written, but a very common optimization in
> other hwmon drivers is to read all N hwmon registers from the device
> when the user touches any of the N sysfs entries and then cache them for
> a polling interval.  This would hopefully take your 8 seconds down to 1
> second for 8 devices.  Still pretty horrible if you are having to take 1
> second of kernel time for IO every <2 seconds.
>
> --
> Patrick Williams
>

--94eb2c1930b41274bb054ec9a756
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve chatted with Patrick V. separately about the driv=
er.=C2=A0 AST2400/2500 fan tach hardware measures only one fan at a time.=
=C2=A0 I think we can adjust the driver settings to reduce the measurement =
time but it will scale with # of tachs being read.</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Fri, May 5, 2017 at 9:34 AM, Patr=
ick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" tar=
get=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Fri, May 05, 2017 at 01:07:45AM -0400, Br=
ad Bishop wrote:<br>
&gt; &gt; The solution that comes to mind would be to simply parallelize se=
nsor<br>
&gt; &gt; updates, such that phosphor-hwmon uses threads to update the sens=
or<br>
&gt;<br>
&gt; I think this is a great idea.=C2=A0 But I would vote for some kind of<=
br>
&gt; non-blocking or async io rather than threads.=C2=A0 I don&#39;t know w=
hat support<br>
&gt; for that sort of thing is available in the hwmon subsystem so I&#39;m =
not<br>
&gt; sure if its even possible, but it seems worth a look anyway.<br>
<br>
</span>If the IO operation within the hwmon kernel driver is taking 1 secon=
d, I<br>
don&#39;t think multi-threading does anything to improve this, except<br>
perhaps if you have two threads: 1 for dbus and 1 for hwmon polling.<br>
Going to N threads or N processes for the hwmon polling would not be<br>
beneficial since there would only be single driver queueing up the N<br>
threads anyhow.=C2=A0 Two threads just improves the dbus get-property<br>
response time for returning the cached value.<br>
<br>
Hopefully we can use sd-event with a non-blocking read on the hwmon<br>
sysfs entry to avoid having to resort to multi-threading.<br>
<br>
I don&#39;t know which device you are interacting with that is taking so<br=
>
long or how the driver was written, but a very common optimization in<br>
other hwmon drivers is to read all N hwmon registers from the device<br>
when the user touches any of the N sysfs entries and then cache them for<br=
>
a polling interval.=C2=A0 This would hopefully take your 8 seconds down to =
1<br>
second for 8 devices.=C2=A0 Still pretty horrible if you are having to take=
 1<br>
second of kernel time for IO every &lt;2 seconds.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--94eb2c1930b41274bb054ec9a756--
