Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwGTP3k0TzDrbG
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 03:33:59 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1505669634.29751.4.camel@fuzziesquirrel.com>
Subject: Re: GPIO Centralized Control Daemon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Sun, 17 Sep 2017 13:33:54 -0400
In-Reply-To: <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
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
X-List-Received-Date: Sun, 17 Sep 2017 17:34:02 -0000


> >=20
> > What do you think of this?
> >=20
> > 1 - You simply wiggle the gpio from a script or small application
> > at
> > =C2=A0 =C2=A0 =C2=A0 the appropriate time.
>=20
> My thought here is -- the appropriate time is, right before phosphor-
> hwmon wants to read it.

phosphor-hwmon shouldn't be providing an interface for something
that isn't accessible.  And it shouldn't concern itself with
making something accessible because there could be any number of
ways to do that, based on the wiring of the board.

What I meant was why is the sensor gated by a gpio?  For example, is it
because the sensor is only available when some power domain is actually
powered on?  In that example, the appropriate time would be when
the power domain is turned on and off.

Is it just stuck behind a gpio for no reason?  If that is the case, I
would think you just wiggle the gpio when the bmc boots.

> =C2=A0
> > 2 - An application other than phosphor-hwmon monitors this gpio and
> > =C2=A0 =C2=A0 =C2=A0 binds the driver to it (or unbinds).
>=20
> In this case, won't the device be removed/added to the hwmon sysfs on
> demand?=C2=A0 I don't believe phosphor-hwmon picks up new devices
> automatically.

Yes, on demand, but he phosphor-layer has a udev rule that launches
(and terminates) a phosphor-hwmon instance along with it.

> =C2=A0
> > 3 - phosphor-hwmon works without modification.
> >=20
> > In fact, #2 is already done - Matt Spinler recently added code to
> > phosphor-gpio-monitor to do exactly this.
>=20
> I haven't looked at gpio-monitor.
> =C2=A0
> > I prefer something like this for two reasons:
> >=20
> > 1 - Consistency in how we handle things.=C2=A0 It becomes easier to
> > write
> > howtos or cookbooks to provide guidance in the future.=C2=A0
>=20
> =C2=A0
> > 2 - We avoid one-offs in phosphor-hwmon.
>=20
> I wouldn't necessarily consider it a one-off, as I can immediately
> think of at least one other motherboard that would benefit from such
> an opportunity.=C2=A0 Also, in this case it would all fit into one nice
> package -- one thing to configure by adding the corresponding line to
> a configuration file.

I'm not arguing that there aren't several board setups where this is
the case.  Rather, board designers are free to do whatever they want,
and if we start putting the board specific logic in phosphor-hwmon you
won't have "one nice package" for very long....
