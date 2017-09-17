Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwDzX6bgqzDr5Q
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 02:26:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1505665582.29751.1.camel@fuzziesquirrel.com>
Subject: Re: GPIO Centralized Control Daemon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Sun, 17 Sep 2017 12:26:22 -0400
In-Reply-To: <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
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
X-List-Received-Date: Sun, 17 Sep 2017 16:26:33 -0000

On Sat, 2017-09-16 at 21:22 -0700, Patrick Venture wrote:
> On Sat, Sep 16, 2017 at 3:12 PM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> > Hi Patrick
> >=20
> > On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:
> > > I apologize if this already exists or is in the works.
> > >
> > > I propose we create a daemon that centralizes userspace GPIO
> > access.
> > >
> > > From a high level, the daemon will implement interfaces to export
> > or
> > > unexport GPIOs.=C2=A0 Each GPIO exported will exist on the dbus:
> > >
> > > /xyz/openbmc_project/gpio/53 and implement an interface with the
> > > following properties:
> > > value, direction, active_low, etc.
> >=20
> > Just thinking out loud...are we sure a gpio is a useful
> > abstraction?
> > If applications all just use the chardev API what is the benefit of
> > having a dbus object, at the cost of API complexity.
>=20
> As an alternative, perhaps a library would suffice.=C2=A0 My goal is to
> avoid multiple in-application implementations.=C2=A0 However, I felt it=
=20

A good goal.

> might be helpful to have some centralized daemon serving this
> information -- a simple dbus property access may be simpler than
> either implementing the ioctl in each application.=C2=A0 However, a
> library may also provide the necessary abstraction.

I think if you implement a library with API it becomes a wash.  There
is also polling to consider - we have a number of applications using
gpio-keys + libevdev.

> =C2=A0
> > >
> > > Some doubts, should the gpio name on the dbus be the relative
> > name
> > > (53), should it be the system specific name (G5) or the absolute
> > > name?=C2=A0 I'm thinking the relative name and let the daemon handl=
e
> > > internalizing the adjustment from relative to absolute.
> > >
> > > I'm working on adding GPIO support within phosphor-hwmon so that
> > I
> > > can access a voltage sensor that's gated by a GPIO, and I know
> > there
> >=20
> > Can you elaborate on what gated means?=C2=A0 Is it you have to wiggle=
 a
> > GPIO
> > before the hwmon driver for this voltage sensor can actually access
> > the
> > sensor hardware?
> >=20
> >=20
>=20
> There is a GPIO that controls whether the battery sensor on the
> quanta board (and I've heard of similar configurations on others)
> that needs to be set high for the sensor to work.=C2=A0 I implemented a
> bit of a hack in phosphor-hwmon to allow one to specify a GPIO that
> needs to be flipped in this type of configuration.=C2=A0 I'd consider
> submitting the patch, however it uses the sysfs interface -- as this
> saved a little implementation time.

We have run into situations like this multiple times.  What we did was
bind/unbind the driver in question when the hardware behind it becomes
available.

What do you think of this?

1 - You simply wiggle the gpio from a script or small application at
      the appropriate time.
2 - An application other than phosphor-hwmon monitors this gpio and
      binds the driver to it (or unbinds).
3 - phosphor-hwmon works without modification.

In fact, #2 is already done - Matt Spinler recently added code to
phosphor-gpio-monitor to do exactly this.

I prefer something like this for two reasons:

1 - Consistency in how we handle things.  It becomes easier to write
howtos or cookbooks to provide guidance in the future.

2 - We avoid one-offs in phosphor-hwmon.


>=20
> I'd be willing to fix it up to use the proper interface and submit it
> upstream if that's something helpful -- or seek out a good library
> for us to use -- I'm also open to suggestions on this.
> > > have been conversations and implementations of this for IPMI OEM
> > --
> > > and I think it could easily be centralized.
> > >
> > > Thoughts?
> > >
> > > Patrick
> >=20
>=20
>=20
