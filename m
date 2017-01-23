Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6DYD4s6tzDqJg
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 12:41:04 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Chassis power on/off targets
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CALLMt=ojtcMuEp0yJA6z5RtoKmwugWdhM-LC3rhHFuxuTCZfJQ@mail.gmail.com>
Date: Sun, 22 Jan 2017 20:40:59 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E93EFA58-3883-4720-9BAA-C7BAC2125C3A@fuzziesquirrel.com>
References: <CALLMt=ojtcMuEp0yJA6z5RtoKmwugWdhM-LC3rhHFuxuTCZfJQ@mail.gmail.com>
To: Andrew Geissler <geissonator@yahoo.com>
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
X-List-Received-Date: Mon, 23 Jan 2017 01:41:05 -0000


> On Jan 18, 2017, at 5:17 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> For this sprints story, https://github.com/openbmc/openbmc/issues/951,
> I need to refactor our systemd targets a bit to ensure we=E2=80=99ve =
got all
> the required checkpoints the code requires.  For a bit of background
> on systemd and it=E2=80=99s units, targets, and services,
> https://www.freedesktop.org/software/systemd/man/systemd.unit.html# is
> a good launching point.
>=20
> Within openbmc we have the concept of targets that have associated
> services with them (see /lib/systemd/system/*.wants on a system for
> the full list) and we have targets that are used to control the
> ordering of execution of those services in the .wants targets.
>=20
> For example, to power on a system we ask systemd to run
> obmc-chassis-start.target.  When you look at the filesystem you see
> this (with my notes added):
>=20
> ls -al obmc-chassis-start\@0.target.wants
>=20
>    op-wait-power-on@0.service -> ../op-wait-power-on@.service
>        # Calls pgood_wait on /org/openbmc/control/power%i on
>        o Run before obmc-power-on, obmc-power-start,
>=20
>    op-power-start@0.service -> ../op-power-start@.service
>              # Calls org.openbmc.control.Power setPowerState 1
>        o Run after obmc-power-start-pre, obmc-fan-control before
> obmc-power-start
>=20
>    op-inventory-upload@0.service -> ../op-inventory-upload@.service
>       # Calls inventory_upload.py, writes a PNOR partition
>        o Run before obmc-host-starte-pre
>=20
>    pcie-slot-detect@0.service -> ../pcie-slot-detect@.service
>               # Run pcie_slot_present.exe
>        o Run after obmc-power-on
>=20
>    obmc-start-host@0.service -> ../op-start-host@.service
>               # Calls "org.openbmc.control.Host boot=E2=80=9D
>        o Run after obmc-power-on, obmc-host-start-pre, before
> obmc-host-start, obmc-host-started
>=20
>    obmc-start-watchdog@0.service -> ../obmc-start-watchdog@.service
>  # Calls org.openbmc.Watchdog to set then start the watchdog
>        o Run after obmc-host-started
>=20
> Within these services you have lots of Before/After references to
> other targets, like these to control the ordering of the service
> execution:
>=20
> obmc-power-start-pre
> obmc-fan-control
> obmc-power-start (this is a .wants, with 2 services associated with =
it)
> obmc-power-on
> obmc-host-start-pre
> obmc-host-start
> obmc-host-started
>=20
> For my state purposes, I need to be able to do this:
>=20
> Just power on and off the chassis (i.e. obmc-power-on/off) (for
> debug/cronus/fsi i2c vpd programming purposes)
> Know when the host has started, and when it has stopped (can use
> existing targets for this)
>=20
> Currently we have the chassis power and host power tied together in
> obmc-chassis-start, my proposal is to simply make the obmc-power-on
> and obmc-power-off targets that now have services associated with

I might not be reading this sentence correctly but I don=E2=80=99t think =
I agree with
this.  My intent with obmc-power-on.target was to serve the exact same =
role
as network-online.target (http://bit.ly/2jemzBO) but with waiting for =
power
to be on:

obmc-power-on.target -> network-online.target
op-wait-power-on.service -> NetworkManager-wait-online.service
obmc-power-start.target -> network.target
op-power-start.service -> NetworkManager.service
obmc-power-start-pre.target -> network-pre.target

When I initially setup the systemd stuff the _only_ usecase I concerned =
myself
with was booting the host.  So I only made a single target that does =
exactly
that.

As additional use-cases show up (like this one here), I think we should =
just be
making new targets that grab the required services.

Your use case has an additional characteristic in that its logic happens
to be a drop in replacement for a subset of the logic required for =
booting
the host.  In situations like that, we can reuse =E2=80=9Ccode=E2=80=9D =
(in this case systemd
unit files).

Think of it like this.  Pretend you are going to implement a target that =
only
powers on the chassis.  Ignore booting the host for a moment.  Go ahead =
and
implement it.

Now that you are done, you should have two targets:

obmc-power-chassis-on.target
obmc-power-chassis-off.target

Each with a number of services associated.

At this point bring booting the host back into consideration.  We =
already have
targets that do that.  Add your new targets as dependencies to those =
targets.

If you stop here, a number of dependencies will be listed twice.  In =
practice
this probably doesn=E2=80=99t even matter because systemd will see that =
they have
already been satisfied and ignore them.  Regardless we should remove
the duplicate dependencies for the same reason you would take two c++
functions that do the same thing and turn them into a single function.

> them.  Specifically the services required to power on and off (and
> verify they went on and off) the chassis.  So I=E2=80=99ll do this:
> - move op-wait-power-on@.service and op-power-start@.service into the
> obmc-power-on.wants target
> - move op-power-stop@.service and op-wait-power-off@.service into the
> obmc-power-off.wants target.
>=20
> Thoughts or comments?
> Andrew
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
