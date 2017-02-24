Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVCQM1sNszDqH1
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 00:59:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Target name refactoring
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
Date: Fri, 24 Feb 2017 08:59:18 -0500
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <45AAA114-D2B4-4B75-8485-B4B7F4AFD989@fuzziesquirrel.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 24 Feb 2017 13:59:23 -0000


> On Feb 21, 2017, at 10:00 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler =
<geissonator@gmail.com> wrote:
>> Some design decisions came out of my last set of changes in the
>> OpenBMC state area.  There was a proposal to rename our targets
>> responsible for booting and powering on/off the system.
>>=20
>> Currently we have this:
>> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
>> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.target
>>  obmc-stop-host.target
>>=20
>> The obmc-power-chassis-*.targets are responsible for doing whatever =
is
>> required to apply pgood to the chassis.
>> The obmc-chassis-*.targets are responsible for starting and stopping
>> all host related services
>> The obmc-stop-host.target is where we have the soft power off service
>> (notify host of shutdown, wait for host to shutdown gracefully)
>>=20
>> Refactoring Proposal:
>> - First the chassis-start and chassis-stop target names don=E2=80=99t =
make
>> sense anymore with the new bmc, chassis, and host state break =
down=E2=80=99s
>> so:
>>  - Rename obmc-chassis-start.target to obmc-start-host.target
>>  - Rename obmc-chassis-stop.target to obmc-stop-host.target
>>  - Rename the current obmc-stop-host.target to =
obmc-shutdown-host.target
>=20
> Can I suggest putting the host before the action?
>=20
> obmc-host-stop
> obmc-host-start
> obmc-host-shutdown

We have two types of targets, synchronization targets (for example =
network-pre.target),=20
and action targets(for example multi-user.target).  Sync targets are not =
directly=20
start/stoppable - they have to be started implicitly by systemd.  I =
would like a way=20
to be able to tell which one I am looking at from the name.  For =
example:

obmc-stop-host # Action - stop the host.
obmc-host-stop # Sync - the host has been stopped.

I had proposed this obmc-[verb]-[what] for actions and =
obmc-[what]-[state] to Andrew
privately..I=E2=80=99m fine with something else, again, as long as it is =
consistent.

I can think of two conventions:

obmc-[verb]-[what] for actions
obmc-[what]-[state] for sync points

or

obmc-[what]-[verb] for actions
obmc-[what]-[state] for sync points

Either one is fine with me.  The former seems slightly easier to =
distinguish between
the two.

>=20
>>=20
>> The target relationships are then the following:
>>=20
>> obmc-host-start.target requires obmc-power-chassis-on.target
>> obmc-shutdown-host.target requires obmc-stop-host.target requires
>> obmc-power-chassis-off.target
>=20
> obmc-host-start requires obmc-chassis-poweron
>=20
> obmc-host-shutdown requires obmc-host-stop requires =
obmc-chassis-poweroff
>=20
> I think the rest of your proposal sounds good, from what I understand.
>=20
> Cheers,
>=20
> Joel
>=20
>>=20
>> When a system goes to the quiesce target, the host state manager will
>> call the obmc-stop-host.target.  Otherwise, the host state service
>> will call the obmc-shutdown-host.target when power off is requested.
>>=20
>> Thoughts/Comments?
>> Andrew
