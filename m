Return-Path: <venture@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJg5m27FyzDqCL
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 02:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cToqcSKn"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id q4so3213321pga.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 May 2017 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5f1rxjglcH5PGqoehMKBHCVyyzAmVcZrnMprxY18fvw=;
 b=cToqcSKnTLSmdtDG7y8v0ff2o9ghH/MBpetwqgiN1xjYPMFJrcK3tXPxWE3250JTjW
 ezhUJa6v8UvFjFJj4vBJUjKxPdKykSOsm8FqKm+730u4pSj1ys4IToAkj0Zcr9gfFM/v
 5TKFSK+VM0lM77iL77tW0RtDqwV5vgkYBUtdfJW5kOXf7PMhpzVENZ2mSdk6fODbqYTs
 W47nHpE34TtCkElZqWgh/xY+/IqNsaLecwiLQt5LTl+ATBCjuwCx+KrbuRv4bmRq9RZQ
 7rYZvukQ/K/rDfgwISFxkD/GBRq2g2tQiUmsrs8omp//Q/wJyEZzul/VwmRhL/157OGn
 LKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5f1rxjglcH5PGqoehMKBHCVyyzAmVcZrnMprxY18fvw=;
 b=HKnM+dBZt7VQxTZIYsYe9iUfDMTpLfhVT4XSdAeN7VppE2b8p7agnESvMhRtNCaz50
 9tgfVzvstonPvBEy43hB1n/aY6uPcgqo0o9NlLpwyfrSYybT5LprD6CInM0cH9n8aKR6
 V2t2U+DTm0pDOaQaYCXW1h+DBk3nt+B/lxew2TRqqA07w7md+meMZXoacMcjwcETybOU
 bSdUKxsU48Fu4j6WNIysu1c2HDeNT617iW5OcEfn1ooDY5aGgyiwT7G0OcVaeBhnnO3R
 R6aQhi5mEIk4RyvdGBDfhr136/gHJ6HlAIuJ5Q1rDUFS+X52a88n8sVAxK1ah+V46cjv
 Mrnw==
X-Gm-Message-State: AN3rC/79zOr2EKchEZikrW6PgHdpKMrcvoZYlEWpr4Z/1A6ejYXaeRdY
 D4xH0UQk2R3fdmxW06WpYbL06iWAVYdl
X-Received: by 10.99.127.26 with SMTP id a26mr45588616pgd.196.1493914330140;
 Thu, 04 May 2017 09:12:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Thu, 4 May 2017 09:11:49 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Thu, 4 May 2017 09:11:49 -0700
Message-ID: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
Subject: phosphor-hwmon bottleneck potential
To: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, 
 Nancy Yuen <yuenn@google.com>, Matthew Barth <msbarth@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary=94eb2c1b4c34f9a04d054eb5080f
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
X-List-Received-Date: Thu, 04 May 2017 16:12:12 -0000

--94eb2c1b4c34f9a04d054eb5080f
Content-Type: text/plain; charset=UTF-8

The system upon which I'm presently running openbmc uses phosphor-hwmon to
expose reading of fans and thermal sensors.  And its works great for
precisely this function, however, when another program attempts to get the
sensor values over dbus from phosphor-hwmon I run into timing issues that
can likely be addressed.

The driver we're using for the fans requires a time period to measure its
RPMs.  I don't know if this is the only driver on earth that does so, but
if it is --then this is only a problem I'll run into.  The time period is
about 1 second.

As it stands now, there is one expected problem and one bizarre one that I
haven't traced down.

Firstly, if I try to read a specific fan speed it takes 8s to get a
response from phosphor-hwmon over dbus.  This may be that it's reading all
the fan speeds before returning; but I haven't verified it.  There are
eight fans on the system being handled by that instance of phosphor-hwmon,
but the 8 seconds could be a coincidence.  I'd need to really look at how
it handles dbus requests to determine that that's the issue.

To avoid this, I registered for listen for Sensor.Value updates over dbus,
however, from looking at the round robin sensor update loop, my hypothesis
is that I would receive an update from each fan once every 8 seconds or so
given its first time to run.  This was effectively what I saw, except of
course it was an update to the sensor every 9 seconds, because my
hypothesis forgot to account for the one second pause between each loop
iteration.

The solution that comes to mind would be to simply parallelize sensor
updates, such that phosphor-hwmon uses threads to update the sensor values
independently of each other.  There are certainly downsides to this
implementation and it won't be 100% optimized because there are switching
overheads with threads, but since my driver read appears to be a
bottleneck, each thread will take their 1 second reading different files
and update the information more rapidly.  This also prevents other sensors
under the same configuration from interfering with general updates to the
dbus sensor namespace.  My system runs four instances of phosphor-hwmon
because of the layout, but others may run different variations and
experience other problems that could be alleviated by multi-threading.

The other suggestion I have to improve involves adding a timestamp to
phosphos-dbus-interfaces for Sensor.Value to let the recipient of the
information know when it was last updated.  Certainly if someone listens
for property updates, they can produce this information themselves, but it
doesn't hurt to provide it to any reader regardless of mechanism and as it
stands now, it feels missing.  It's true that some drivers cache the
information, and phosphor-hwmon itself waits one second before looping
around to update, but a way to reduce some amount of ambiguity would be to
provide a timestamp on the information.  By adding a timestamp the
information would also come across to the reader as more of a time series,
which is more or less is.

Without multi-threading to remove the timing bottleneck on my platform, and
the inability to provide other more direct interfaces for controlling fans,
I'll be unable to use phosphor-hwmon as a primary source for
reading/writing sensor data and will be unable to upstream any effort i
make to write a pluggable thermal controller.

I felt it was important to thoroughly explain my reasoning as other
engineering teams attempting to use openbmc for their platforms could run
into similar problems and that the decision to develop independently was
data-driven and not arbitrary.

Patrick

--94eb2c1b4c34f9a04d054eb5080f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The system upon which I&#39;m presently running openbmc us=
es phosphor-hwmon to expose reading of fans and thermal sensors.=C2=A0 And =
its works great for precisely this function, however, when another program =
attempts to get the sensor values over dbus from phosphor-hwmon I run into =
timing issues that can likely be addressed.<div><br></div><div>The driver w=
e&#39;re using for the fans requires a time period to measure its RPMs.=C2=
=A0 I don&#39;t know if this is the only driver on earth that does so, but =
if it is --then this is only a problem I&#39;ll run into.=C2=A0 The time pe=
riod is about 1 second.</div><div><br></div><div>As it stands now, there is=
 one expected problem and one bizarre one that I haven&#39;t traced down.</=
div><div><br></div><div>Firstly, if I try to read a specific fan speed it t=
akes 8s to get a response from phosphor-hwmon over dbus.=C2=A0 This may be =
that it&#39;s reading all the fan speeds before returning; but I haven&#39;=
t verified it.=C2=A0 There are eight fans on the system being handled by th=
at instance of phosphor-hwmon, but the 8 seconds could be a coincidence.=C2=
=A0 I&#39;d need to really look at how it handles dbus requests to determin=
e that that&#39;s the issue.</div><div><br></div><div>To avoid this, I regi=
stered for listen for Sensor.Value updates over dbus, however, from looking=
 at the round robin sensor update loop, my hypothesis is that I would recei=
ve an update from each fan once every 8 seconds or so given its first time =
to run.=C2=A0 This was effectively what I saw, except of course it was an u=
pdate to the sensor every 9 seconds, because my hypothesis forgot to accoun=
t for the one second pause between each loop iteration.</div><div><br></div=
><div>The solution that comes to mind would be to simply parallelize=C2=A0s=
ensor updates, such that phosphor-hwmon uses threads to update the sensor v=
alues independently of each other.=C2=A0 There are certainly downsides to t=
his implementation and it won&#39;t be 100% optimized because there are swi=
tching overheads with threads, but since my driver read appears to be a bot=
tleneck, each thread will take their 1 second reading different files and u=
pdate the information more rapidly.=C2=A0 This also prevents other sensors =
under the same configuration from interfering with general updates to the d=
bus sensor namespace.=C2=A0 My system runs four instances of phosphor-hwmon=
 because of the layout, but others may run different variations and experie=
nce other problems that could be alleviated by multi-threading.</div><div><=
br></div><div>The other suggestion I have to improve involves adding a time=
stamp to phosphos-dbus-interfaces for Sensor.Value to let the recipient of =
the information know when it was last updated.=C2=A0 Certainly if someone l=
istens for property updates, they can produce this information themselves, =
but it doesn&#39;t hurt to provide it to any reader regardless of mechanism=
 and as it stands now, it feels missing.=C2=A0 It&#39;s true that some driv=
ers cache the information, and phosphor-hwmon itself waits one second befor=
e looping around to update, but a way to reduce some amount of ambiguity wo=
uld be to provide a timestamp on the information.=C2=A0 By adding a timesta=
mp the information would also come across to the reader as more of a time s=
eries, which is more or less is.</div><div><br></div><div>Without multi-thr=
eading to remove the timing bottleneck on my platform, and the inability to=
 provide other more direct interfaces for controlling fans, I&#39;ll be una=
ble to use phosphor-hwmon as a primary source for reading/writing sensor da=
ta and will be unable to upstream any effort i make to write a pluggable th=
ermal controller.</div><div><br></div><div>I felt it was important to thoro=
ughly explain my reasoning as other engineering teams attempting to use ope=
nbmc for their platforms could run into similar problems and that the decis=
ion to develop independently was data-driven and not arbitrary.</div><div><=
br></div><div>Patrick</div></div>

--94eb2c1b4c34f9a04d054eb5080f--
