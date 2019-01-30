Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L8bvvHmv"; 
 dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qcS84ZZhzDqD1
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 08:48:24 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id t33so1330224qtt.4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 13:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQSmKyLw2oIObkZmzDPKA5gE3M/NR7/tlTr71ezVt6k=;
 b=L8bvvHmvinGXJHtpMQGKc8RBcU5RvUveC6RPtRJNLyFbxBqk323+oMoqNV8G/nFPax
 N88M1snSQzcyCTpLqd3x3ujm7g0FeLOY9UqY4I1WnyxcNpdCynFpxMkeI2hZbDzXP7M4
 kf36hb7f6Z3myaeEiIpj7HT5Gx/OsTvcM8mJokbp8gamkZHEGkX0sQUpVSPi/jJZ+pa7
 RBWe8qfmHywK0Km+BqbImQ/G7HB5twMhK5bQwtWx++2dlXRIJGyeENRd/qcZkc/7G5fh
 A5KlcWmPSNhXv93VYo7act6sZhgepK3vxeicAnIVvpAFFgTWM+4exq5pJsP0r6IR4/D2
 rfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQSmKyLw2oIObkZmzDPKA5gE3M/NR7/tlTr71ezVt6k=;
 b=DDf5pig60sRqD6okD7m1ESmOBLLSMoFHbGBOZ6nMojKv7PLgG7DPg5crw6iWNY99GB
 7LXz3SzVSmsk9U9evhPhNN8q4fQAHsCeXmnINBe6leZrKkXSK4PBIaYewohp2HhjTEHA
 Ssc0QqVry0qscol1TOMzbmmZ1hUcAR8beDP4+7HvXpxw2nN7MyMaCQW0VEWkmOGTLGkk
 mdqc5NXBmIFR1w1mNg5iJ5v86jHT9KgZKnUYfVSTC6gYmxM2JprQ5PE9M1l1n97+zwtO
 /O7IyE68m52wCxd5c1o8kTrhKiAq4t8jg1FJisZ0vJh01zaGsF4hn+3yWfQgy3yKtx1m
 nQ1w==
X-Gm-Message-State: AJcUukce7gnqchjmVqNNH1oDgUcaLgrZoXS5Ujv4UT4GoVvWzPlZRz8k
 eRJwHbf16h2E/zEZQ4VRfiqot4GOCPrB6MWJl39hkw==
X-Google-Smtp-Source: ALg8bN63SRMDkZOEk2aSG9uL+YQMtWvk8CmI+EUetEa8ep4wjLqZmToPTKsZk22bhu4uvMv+hYccLguHAaTB0jIO6kU=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr30591647qvj.228.1548884902035; 
 Wed, 30 Jan 2019 13:48:22 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash> <32964718.XoMeP9TR8m@flash>
 <CAJoAoZk1XGosz=7Gg-o8RAU1OfftAVr8L7OmfsfwHqPAXVqORQ@mail.gmail.com>
 <2825900.tvUVfaqXQI@flash>
In-Reply-To: <2825900.tvUVfaqXQI@flash>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 30 Jan 2019 13:48:10 -0800
Message-ID: <CAJoAoZkOAgt7w5QAxkuO1595NUn7jbkYwh4WN4nAnEGMLxWeMg@mail.gmail.com>
Subject: Re: [EXT] Re: OpenBMC Sensors
To: Aaron Williams <awilliams@marvell.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000062da0a0580b3dee7"
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
X-List-Received-Date: Wed, 30 Jan 2019 21:48:26 -0000

--00000000000062da0a0580b3dee7
Content-Type: text/plain; charset="UTF-8"

Great, best luck Aaron. Thanks!

On Wed, Jan 30, 2019, 1:47 PM Aaron Williams <awilliams@marvell.com> wrote:

> Hi Emily,
>
> Thank you, I will look into it. I don't think losing the sensors when we
> cut
> power to the host CPU will be much of an issue. I was just notified of a
> change to our CPLD that will allow the BMC to keep the sensors powered. At
> the
> moment, cutting power shuts of the power from the ATX power supply but now
> I
> will have more fine-grained power control. Now I just have to figure out
> how
> to update the Lattice CPLD from the BMC... I found some code in the
> Facebook
> OpenBMC which hopefully I can port over.
>
> -Aaron
>
> On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
> > Aaron, we use this daemon for local (to BMC) thermal control:
> > https://github.com/openbmc/phosphor-pid-control
> > Maybe you'll find it helpful.
> >
> > Although I'm not sure how to help you with losing sensors when the host
> > powers down but the BMC is expected to continue to cool the tray.  Sounds
> > like an issue with the board design, unless I'm not understanding what
> > you're saying.
> >
> > On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams <awilliams@marvell.com>
> >
> > wrote:
> > > Hi Emily,
> > >
> > > That's what I need the temperature for. We have two controllers, one
> that
> > > monitors the core temperature (a TI TMP421) and one that controls the
> fans
> > > (ADT7462). In order to maintain the thermal envelope the TMP421 needs
> to
> > > be
> > > monitored to adjust the fan speed through the ADT7462.
> > >
> > > Further complicating things is the fact that these sensors disappear
> when
> > > the
> > > host is powered down.
> > >
> > > -Aaron
> > >
> > > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote:
> > > > External Email
> > > >
> > > >
> ----------------------------------------------------------------------
> > > > Hi Aaron,
> > > >
> > > > Note that you only really need to worry about sending the temperature
> > > > via
> > > > IPMI if you want to send it somewhere besides the BMC.  If you plan
> to
> > > > do
> > > > internal thermal control (BMC reads temperature, BMC adjusts fans
> > > > accordingly) you probably don't need IPMI config and can get away
> with
> > > > setting it up as far as DBus in the sensor architecture doc Lei sent.
> > > >
> > > > Emily
> > > >
> > > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:
> > > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <
> awilliams@marvell.com>
> > > > >
> > > > > wrote:
> > > > > > I see how to set up the hwmon portion defining the devices based
> on
> > >
> > > the
> > >
> > > > > device
> > > > >
> > > > > > tree, but I am unsure how to go about configuring the YAML and
> other
> > > > >
> > > > > files for
> > > > >
> > > > > > this.
> > > > >
> > > > > For sensors' config, please refer to
> > > > > https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> > >
> > > > > And it looks you are looking for fan controls, then you could
> refer
> to:
> > >
> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f
> > >
> > > > > ans
> > > > >
> > > > > (I really need to submit my porting guide to openbmc/docs)
>
>
>
>
>

--00000000000062da0a0580b3dee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, best luck Aaron. Thanks!<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Wed, Jan 30, 2019, 1:47 PM Aaron Williams &lt;<a href=3D"mailto=
:awilliams@marvell.com">awilliams@marvell.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Emily,<br>
<br>
Thank you, I will look into it. I don&#39;t think losing the sensors when w=
e cut <br>
power to the host CPU will be much of an issue. I was just notified of a <b=
r>
change to our CPLD that will allow the BMC to keep the sensors powered. At =
the <br>
moment, cutting power shuts of the power from the ATX power supply but now =
I <br>
will have more fine-grained power control. Now I just have to figure out ho=
w <br>
to update the Lattice CPLD from the BMC... I found some code in the Faceboo=
k <br>
OpenBMC which hopefully I can port over.<br>
<br>
-Aaron<br>
<br>
On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:<br>
&gt; Aaron, we use this daemon for local (to BMC) thermal control:<br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-pid-control" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-control<=
/a><br>
&gt; Maybe you&#39;ll find it helpful.<br>
&gt; <br>
&gt; Although I&#39;m not sure how to help you with losing sensors when the=
 host<br>
&gt; powers down but the BMC is expected to continue to cool the tray.=C2=
=A0 Sounds<br>
&gt; like an issue with the board design, unless I&#39;m not understanding =
what<br>
&gt; you&#39;re saying.<br>
&gt; <br>
&gt; On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams &lt;<a href=3D"mailto:a=
williams@marvell.com" target=3D"_blank">awilliams@marvell.com</a>&gt;<br>
&gt; <br>
&gt; wrote:<br>
&gt; &gt; Hi Emily,<br>
&gt; &gt; <br>
&gt; &gt; That&#39;s what I need the temperature for. We have two controlle=
rs, one that<br>
&gt; &gt; monitors the core temperature (a TI TMP421) and one that controls=
 the fans<br>
&gt; &gt; (ADT7462). In order to maintain the thermal envelope the TMP421 n=
eeds to<br>
&gt; &gt; be<br>
&gt; &gt; monitored to adjust the fan speed through the ADT7462.<br>
&gt; &gt; <br>
&gt; &gt; Further complicating things is the fact that these sensors disapp=
ear when<br>
&gt; &gt; the<br>
&gt; &gt; host is powered down.<br>
&gt; &gt; <br>
&gt; &gt; -Aaron<br>
&gt; &gt; <br>
&gt; &gt; On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer wrote=
:<br>
&gt; &gt; &gt; External Email<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ------------------------------------------------------------=
----------<br>
&gt; &gt; &gt; Hi Aaron,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Note that you only really need to worry about sending the te=
mperature<br>
&gt; &gt; &gt; via<br>
&gt; &gt; &gt; IPMI if you want to send it somewhere besides the BMC.=C2=A0=
 If you plan to<br>
&gt; &gt; &gt; do<br>
&gt; &gt; &gt; internal thermal control (BMC reads temperature, BMC adjusts=
 fans<br>
&gt; &gt; &gt; accordingly) you probably don&#39;t need IPMI config and can=
 get away with<br>
&gt; &gt; &gt; setting it up as far as DBus in the sensor architecture doc =
Lei sent.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Emily<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Thu, Jan 24, 2019 at 1:27 AM Lei YU &lt;<a href=3D"mailto=
:mine260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt; &gt; On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams &lt;<a h=
ref=3D"mailto:awilliams@marvell.com" target=3D"_blank">awilliams@marvell.co=
m</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; I see how to set up the hwmon portion defining the=
 devices based on<br>
&gt; &gt; <br>
&gt; &gt; the<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; device<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; tree, but I am unsure how to go about configuring =
the YAML and other<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; files for<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; this.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; For sensors&#39; config, please refer to<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/openbmc/docs/blob/master/=
sensor-architecture.md" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/docs/blob/master/sensor-architecture.md</a><br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; And it looks you are looking for fan controls, then you=
 could refer <br>
to:<br>
&gt; &gt; <a href=3D"https://github.com/mine260309/openbmc-intro/blob/maste=
r/Porting_Guide.md#f" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mine260309/openbmc-intro/blob/master/Porting_Guide.md#f</a><br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; ans<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; (I really need to submit my porting guide to openbmc/do=
cs)<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000062da0a0580b3dee7--
