Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwMvT16J3zDr5S
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 07:38:28 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1505684302.29751.6.camel@fuzziesquirrel.com>
Subject: Re: GPIO Centralized Control Daemon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Sun, 17 Sep 2017 17:38:22 -0400
In-Reply-To: <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
 <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sun, 17 Sep 2017 21:38:29 -0000


> > Is it just stuck behind a gpio for no reason?=C2=A0 If that is the ca=
se,
> > I
> > would think you just wiggle the gpio when the bmc boots.
>=20
> In this particular case, it's behind a GPIO so it doesn't drain the
> battery -- or at least that's my understanding of the design.
>=20
> The appropriate time would be -- when someone tries to read it from
> the host.=C2=A0 What you're suggesting is that, the ipmi daemon, when i=
t
> receives a request for this sensor - that is then launches something
> that sets the gpio, and then waits for the dbus objects to exist from
> the launched phosphor-hwmon, before then requesting the sensor value
> in its normal course of action.=C2=A0 Because it's my understanding it'=
s a
> gated sensor so that it doesn't drain the battery, which means
> leaving it open effectively permanently isn't an option.=C2=A0 If I'm
> misunderstanding the goal of the design, then obviously just
> unlocking the GPIO effectively permanently is a solution.

Aha!  Now I understand the motivation.  And yes the approach I've
outlined is quite painful.  In my defense I would not have suggested
that had I known :-)

> >=20
> > I'm not arguing that there aren't several board setups where this
> > is
> > the case.=C2=A0 Rather, board designers are free to do whatever they
> > want,
> > and if we start putting the board specific logic in phosphor-hwmon
> > you
> > won't have "one nice package" for very long....
>=20
> True-ish.=C2=A0 This is quite similar to dealing with GAIN and OFFSET.=C2=
=A0=20

Those feel different to me.  They are needed for thermistor type
sensors regardless of board wiring.

> Those are particulars of a board that now get factored into the
> value.=C2=A0 I'm not suggesting something beyond the norms of hwmon.=C2=
=A0 It
> would be convenient however, if the ADC driver could be programmed to
> know that some sensor is gated by a GPIO and handled flipping,=20

Can you reach out to Guenter or the relevant maintainer (is this an IIO
device?) for ideas here?  I hadn't mentioned it but in the back of my
head this whole time I've been wondering about a completely in-kernel
solution.

> waiting, reading, and flipping-back for someone -- quasi-similarly to
> i2c muxes that use gpios.=C2=A0 Except, obviously, the waiting and sett=
ing
> it back part are ... a bad plan to build into a driver, in that it=20

It has to be done in one place or the other, does it not?  You mention
i2c muxes - managing those isn't delegated to userspace (there are
drivers for i2c muxes) so maybe this situation need not be any
different?

> could delay returning a value.=C2=A0 Although -- one could argue the fa=
n
> speed controller driver does that -- takes time to respond.=C2=A0 It's
> just, one would then also want to configure the wait time, because=20

In the very near future I intend to make all the wait/delay/retry
intervals runtime configurable to handle exactly these kinds of nuances
between devices and their drivers.

> some configurations will take longer for a sensor value to stabilize.
>=20
> Patrick
>=20
