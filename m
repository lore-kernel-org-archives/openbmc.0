Return-Path: <venture@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMzcf02PwzDqKr
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DuDGM1MN"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id v14so8317601pfd.2
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 18:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=z0L4nN759LWWoE98oOtffiUuN8Dj+/az0/a7q5Cux00=;
 b=DuDGM1MN1aXMVeix+xAFHfuaTJ8fGfKbs39xXB1nRmUKzNbVykFM0eiobCMaQOcv/O
 L+5NjQEqlOyKGEMLNZCJ9CSBzMTL6xb27d59prJeHhWG/nR7SbTgcVDR4ZDhP4YFQjn4
 f7KR5dj+eYxzx4yeXp800m3Ciab7lNYuKX3oSfTMGxvFks1+ZTHmHFAcxSz7DJg6s7ZI
 ioGX3twUif/RAhQkeV9lxE9KaqE3CaHKoP31Btipu/UuZYzM8aLsNYr5kjabIidj5hDr
 +VjrzRoDYnFuMjTcQKu0Ku2wqc+p6Kcoq0Ce/6w+TXumEycvndN7U7DEqQR7tDY4Uyx4
 mupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=z0L4nN759LWWoE98oOtffiUuN8Dj+/az0/a7q5Cux00=;
 b=ZW4cfvXVJTGo+bKTWWMuJg+iWBYnpPwOgiyu3XsMSvxPLxWOsWKEVU5XQm8Ok9Mf2+
 Hjuz8iIQZa0wNZcto9J7gW8tfiQL13bLo5K+6RuzGXfpyUpGAsdqs6JfRzRgrMblsMF5
 kmoQR4IghRU79kAM2QVr+BRNlsPZUSKisGqc8fE8ZhlpnOtDOHowijofU3f7CnhHeRFU
 AVPUKH9VivO9RPRbmHwesDDQlf7qFKtbgRpBemxkjPUmeFUBc0gPV8yRQhZx0ePH7/FH
 OdQtHV6dGHcW4Gns+rS90Lk8ItmZ5JpqUhAJD9CXGUQ0Yjna97dYqE88AI3Tz/DU34U8
 vh5Q==
X-Gm-Message-State: AODbwcAobq9uiXjVkNCHbpd9MZtk9J2Sk6hvRxdcEV1G/243FXuhlFQD
 /l7l3NuVJADJfbPGuLKIfQEJNCh0Vd61
X-Received: by 10.99.99.134 with SMTP id x128mr608151pgb.46.1494380814011;
 Tue, 09 May 2017 18:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Tue, 9 May 2017 18:46:33 -0700 (PDT)
In-Reply-To: <20170505203538.GL25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
 <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
 <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
 <20170505203538.GL25937@heinlein.lan>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 May 2017 18:46:33 -0700
Message-ID: <CAO=notwiefvTD361C8kj97GGX3NZXCfvdX8pAT6svPnVGM+=cg@mail.gmail.com>
Subject: Re: phosphor-hwmon bottleneck potential
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Nancy Yuen <yuenn@google.com>, Rick Altherr <raltherr@google.com>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary=94eb2c11ddda9489fb054f21a58a
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
X-List-Received-Date: Wed, 10 May 2017 01:46:58 -0000

--94eb2c11ddda9489fb054f21a58a
Content-Type: text/plain; charset=UTF-8

Just FYI, I've been working on the fan driver to improve its speed.  The
driver can be sped up a bit to provide an answer sooner.  Interestingly,
and this may need some level of accounting even in your systems, I'm seeing
erroneous values periodically.  So, 10 readings of fan A in a row and
1/10th will be something super low.  So any controller you implement should
consider that the data may be invalid,.., while the fan is still present
and functioning.  I plan to check and have a super tight loop if necessary
if I'm seeing bad numbers, and if two in a row, maybe flag the fan as bad
or something along those lines.

To avoid read conflicts or issues, i'll be using phosphor-hwmon to read,
however, to avoid "waiting" I'll be listening for the property updates in a
background thread.  -- and having phosphor-hwmon not wait 1 second.  The
algorithm I'm using wasn't written by me but rather by someone who
understands thermal stuff, and it's written to be a very tight loop on
controlling the fans.

i haven't tried to make the wait time in phosphor-hwmon configurable yet.
It's just not been a priority.  But I'd rather not maintain a hacked
version.  So, hopefully sometime in a couple weeks I can submit it for
review.

Since phosphor-hwmon doesn't allow writing non-fan speeds and I don't want
to write a conversion calibration thing, I'll be writing directly to sysfs
as pwm.  The algorithm I"m using outputs in pwm, so it's a bit of a
shortest-path.  However, I could include as a configuration option in the
fan control itself whether to update over dbus or sysfs and so on, such
that it could be handled either way.  I don't want the configuration to be
too cumbersome though.

i think one of the biggest steps away from something we can easily share
will be the OEM commands I need. -- more or less.  I could put them in a
separate daemon and maybe I will later (once it's all working) and then it
is more shareable.  The host needs to be able to send down thermal data
that the BMC can't read as well as take over control from the algorithm.  I
mentioned the manual control, and y'all indicated it was something you
might require.  But being it's outside the scope of IPMI's preset of
commands, can OEM commands be shared?

I'm still designing my controller to use multiple threads, although no
longer to read, because yeah, it has one status register ... but, one
background thread can maintain the latest fan speed updates received over
dbus.  Because phosphor-hwmon only responds to dbus messages once per loop,
I need to make my information retrieval asynchronous -- hence the
background thread listening for updates.  My loop(s) will just assume the
information they are reading is fresh.

One thing I'm still working on designing is how to cleanly handle chassis
temperature differences.  We have requirements about the difference in
temperature between incoming and exiting air.  All the PID loops will run
and compute their goal PWM and basically maximize that and then check
against the specially listed thermal margin, and then try to drive the fans
there...  ...  I'm not convinced I like it yet.

I hope to have something mostly done these next two weeks.  It isn't built
from the fan-presence, but I'd like to show you guys what it looks like if
it's at that stage and see if I can save you guys time even though maybe it
can't all be used -- or maybe we can come up with ways of splitting it
apart cleanly such that it's a matter of configuration or providing X, Y,
or Z.

Regards,
Patrick

On Fri, May 5, 2017 at 1:35 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, May 05, 2017 at 11:37:06AM -0700, Nancy Yuen wrote:
> > 1. General design issue if time between reads of a sensor is dependent on
> > the number of sensors in the system.
>
> I don't see any general design issue with phosphor-hwmon or dbus being
> talked about here.  There is one specific driver that has a pretty large
> scaling factor no matter how you read sensor values out of it.  We've
> talked elsewhere in the thread about a potential driver change to
> improve it.  Most hwmon drivers do not have any issue.
>
> > And drivers can fail, due to miss behaving code or hardware.
>
> hwmon drivers should never block userspace forever.  If they do that is
> a serious driver bug.  We could be defensive against it by enhancing
> phosphor-hwmon to use non-blocking IO, assuming the kernel supports it,
> but that seems like a lot of code for a non-existent problem.
>
> Hardware failures are already handled by the hwmon drivers, reported
> back to phosphor-hwmon as errnos on read, and dealt with.
>
> > In this design, sensor report could be
> > significantly delayed if one sensor/driver were bad or misbehaving.
>
> You have no difference in the problem of one sensor reading not working
> in any of these three potential designs:
>     1. One big loop that reads each hwmon sysfs entry for the whole
>        system in sequence.
>     2. One big program with N threads that, with a stampeding herd,
>        attempt to read all hwmon sysfs at the same instant.
>     3. M processes with N hwmon sysfs reads in sequence.
>
> In any of these designs, if the driver delays your read for 8 seconds
> your data is delayed and stale.  I think our expectation is that a
> fan-control algorithm is using dbus signals to keep track of the most
> recent value and if it doesn't have up-to-date data by the time it wants
> to make a decision it would deal with it in whatever way it sees fit.
> Likely, either using old data or treating that sensor as in-error.
>
> If you chose design #2 and then expanded on it by adding a thermal
> control loop in yet another thread, you'd still have the exact same
> problems to deal with.  It just is now all in one process using shm to
> communicate the cached sensor values instead of using dbus between
> processes.
>
> --
> Patrick Williams
>

--94eb2c11ddda9489fb054f21a58a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just FYI, I&#39;ve been working on the fan driver to =
improve its speed.=C2=A0 The driver can be sped up a bit to provide an answ=
er sooner.=C2=A0 Interestingly, and this may need some level of accounting =
even in your systems, I&#39;m seeing erroneous values periodically.=C2=A0 S=
o, 10 readings of fan A in a row and 1/10th will be something super low.=C2=
=A0 So any controller you implement should consider that the data may be in=
valid,.., while the fan is still present and functioning.=C2=A0 I plan to c=
heck and have a super tight loop if necessary if I&#39;m seeing bad numbers=
, and if two in a row, maybe flag the fan as bad or something along those l=
ines.<br></div><div><br></div><div>To avoid read conflicts or issues, i&#39=
;ll be using phosphor-hwmon to read, however, to avoid &quot;waiting&quot; =
I&#39;ll be listening for the property updates in a background thread. =C2=
=A0-- and having phosphor-hwmon not wait 1 second.=C2=A0 The algorithm I&#3=
9;m using wasn&#39;t written by me but rather by someone who understands th=
ermal stuff, and it&#39;s written to be a very tight loop on controlling th=
e fans.</div><div><br></div><div>i haven&#39;t tried to make the wait time =
in phosphor-hwmon configurable yet.=C2=A0 It&#39;s just not been a priority=
.=C2=A0 But I&#39;d rather not maintain a hacked version.=C2=A0 So, hopeful=
ly sometime in a couple weeks I can submit it for review.</div><div><br></d=
iv><div>Since phosphor-hwmon doesn&#39;t allow writing non-fan speeds and I=
 don&#39;t want to write a conversion calibration thing, I&#39;ll be writin=
g directly to sysfs as pwm.=C2=A0 The algorithm I&quot;m using outputs in p=
wm, so it&#39;s a bit of a shortest-path.=C2=A0 However, I could include as=
 a configuration option in the fan control itself whether to update over db=
us or sysfs and so on, such that it could be handled either way.=C2=A0 I do=
n&#39;t want the configuration to be too cumbersome though.</div><div><br><=
/div><div>i think one of the biggest steps away from something we can easil=
y share will be the OEM commands I need. -- more or less.=C2=A0 I could put=
 them in a separate daemon and maybe I will later (once it&#39;s all workin=
g) and then it is more shareable.=C2=A0 The host needs to be able to send d=
own thermal data that the BMC can&#39;t read as well as take over control f=
rom the algorithm.=C2=A0 I mentioned the manual control, and y&#39;all indi=
cated it was something you might require.=C2=A0 But being it&#39;s outside =
the scope of IPMI&#39;s preset of commands, can OEM commands be shared?</di=
v><div><br></div><div>I&#39;m still designing my controller to use multiple=
 threads, although no longer to read, because yeah, it has one status regis=
ter ... but, one background thread can maintain the latest fan speed update=
s received over dbus.=C2=A0 Because phosphor-hwmon only responds to dbus me=
ssages once per loop, I need to make my information retrieval asynchronous =
-- hence the background thread listening for updates.=C2=A0 My loop(s) will=
 just assume the information they are reading is fresh.</div><div><br></div=
><div>One thing I&#39;m still working on designing is how to cleanly handle=
 chassis temperature differences.=C2=A0 We have requirements about the diff=
erence in temperature between incoming and exiting air.=C2=A0 All the PID l=
oops will run and compute their goal PWM and basically maximize that and th=
en check against the specially listed thermal margin, and then try to drive=
 the fans there... =C2=A0...=C2=A0 I&#39;m not convinced I like it yet.</di=
v><div><br></div><div>I hope to have something mostly done these next two w=
eeks.=C2=A0 It isn&#39;t built from the fan-presence, but I&#39;d like to s=
how you guys what it looks like if it&#39;s at that stage and see if I can =
save you guys time even though maybe it can&#39;t all be used -- or maybe w=
e can come up with ways of splitting it apart cleanly such that it&#39;s a =
matter of configuration or providing X, Y, or Z.</div><div><br></div><div>R=
egards,</div><div>Patrick</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Fri, May 5, 2017 at 1:35 PM, Patrick Williams <span =
dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patr=
ick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Fri, May 05, 2017 at 11:37:06AM -0700, Nancy Yuen wrote:<br>
&gt; 1. General design issue if time between reads of a sensor is dependent=
 on<br>
&gt; the number of sensors in the system.<br>
<br>
</span>I don&#39;t see any general design issue with phosphor-hwmon or dbus=
 being<br>
talked about here.=C2=A0 There is one specific driver that has a pretty lar=
ge<br>
scaling factor no matter how you read sensor values out of it.=C2=A0 We&#39=
;ve<br>
talked elsewhere in the thread about a potential driver change to<br>
improve it.=C2=A0 Most hwmon drivers do not have any issue.<br>
<span class=3D""><br>
&gt; And drivers can fail, due to miss behaving code or hardware.<br>
<br>
</span>hwmon drivers should never block userspace forever.=C2=A0 If they do=
 that is<br>
a serious driver bug.=C2=A0 We could be defensive against it by enhancing<b=
r>
phosphor-hwmon to use non-blocking IO, assuming the kernel supports it,<br>
but that seems like a lot of code for a non-existent problem.<br>
<br>
Hardware failures are already handled by the hwmon drivers, reported<br>
back to phosphor-hwmon as errnos on read, and dealt with.<br>
<span class=3D""><br>
&gt; In this design, sensor report could be<br>
&gt; significantly delayed if one sensor/driver were bad or misbehaving.<br=
>
<br>
</span>You have no difference in the problem of one sensor reading not work=
ing<br>
in any of these three potential designs:<br>
=C2=A0 =C2=A0 1. One big loop that reads each hwmon sysfs entry for the who=
le<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0system in sequence.<br>
=C2=A0 =C2=A0 2. One big program with N threads that, with a stampeding her=
d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0attempt to read all hwmon sysfs at the same inst=
ant.<br>
=C2=A0 =C2=A0 3. M processes with N hwmon sysfs reads in sequence.<br>
<br>
In any of these designs, if the driver delays your read for 8 seconds<br>
your data is delayed and stale.=C2=A0 I think our expectation is that a<br>
fan-control algorithm is using dbus signals to keep track of the most<br>
recent value and if it doesn&#39;t have up-to-date data by the time it want=
s<br>
to make a decision it would deal with it in whatever way it sees fit.<br>
Likely, either using old data or treating that sensor as in-error.<br>
<br>
If you chose design #2 and then expanded on it by adding a thermal<br>
control loop in yet another thread, you&#39;d still have the exact same<br>
problems to deal with.=C2=A0 It just is now all in one process using shm to=
<br>
communicate the cached sensor values instead of using dbus between<br>
processes.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--94eb2c11ddda9489fb054f21a58a--
