Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCkFz00z9zDr9F
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 08:17:37 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2017 14:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,368,1503385200"; d="scan'208";a="1024623191"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2017 14:17:31 -0700
Date: Thu, 12 Oct 2017 14:17:31 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
Message-ID: <20171012211731.GA17014@mauery>
References: <20171011220548.GA61269@mauery>
 <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 12 Oct 2017 21:17:43 -0000

On 12-Oct-2017 12:03 PM, Brad Bishop wrote:
>=20
> > On Oct 11, 2017, at 6:05 PM, Vernon Mauery <vernon.mauery@linux.intel.c=
om> wrote:
> >=20
> > I am working on an ipmi provider library and had a few questions and=20
> > observations.
> >=20
> > 1) Why are there separate ipmi message queues for the host and network?=
=20
>=20
> iirc it was so that you could have a different set of providers
> registered for each channel or even different, channel specific
> implementations for the same command.

Okay, that makes sense. This is just a mindset change for me. :) In my=20
head I was separating the providers by command group. I just need to=20
make sure that we are also separating them by interface if that matters=20
so they can only get registered in a single queue.

> >   It seems awkward that for the host, the ipmi request comes from a=20
> >   different process (btbridge, or in our case kcsbridge), while for the=
=20
> >   network (RMCP+), the messages are handled directly in the same=20
> >   process.
>=20
> Is it still awkward if you accept the two queue approach?  The=20
> additional layer is needed for the bt/kcs -> host-ipmid
> abstraction.  No such abstraction is needed for network.

I guess it is weird to me that the network commands don't seem to get=20
packaged up and sent across dbus, while they do for bt/kcs. Why don't=20
the bt/kcs commands get processed in the same process instead of getting=20
sent to ipmid. From the perspective of the command handlers in ipmid,=20
they cannot tell if the channel is internal (on-bmc ipmitool) or the=20
bt/kcs interface.

Having multiple queues only makes sense to me if there is one for every=20
channel. Alternately, one queue that passes the channel information in=20
with each command.

> >   It seems that the network handler could just as easily package the=20
> >   command up and send it to ipmid the same way that btbridge does.
> >=20
> > 2) Can we modify the signature of the handlers so that they can behave=
=20
> >   in a more intelligent manner? It would be nice if they were handed a=
=20
> >   gsl::span<uint8_t> instead of a void* and a length. This allows for =
=20
> >   a no-copy, bounds-checked way of passing buffers.
>=20
> sounds good to me!
>=20
> >=20
> >   It would be nice to know what channel something came in on. We might=
=20
> >   want to be able to change behavior based on the incoming channel (as=
=20
> >   some channels are more secure than others).
>=20
> I think the separate message queues solves this need; however, doing
> this need not be mutually exclusive of having separate queues if that
> enables another use case we don=E2=80=99t support today.
>=20
> I=E2=80=99m not totally stuck on two queues.  Especially if some alternat=
ive
> maintains the same level of flexibility.  The motivation for a single
> queue isn=E2=80=99t clear yet to me though - without more discussion it s=
ounds
> like we=E2=80=99d end up with the same capability we already have=E2=80=
=A6so why bother?

If any of the ipmi commands have any state involved, then that state=20
needs to either be duplicated between two queues or somehow=20
synchronized. Neither situation is ideal if the size of the shared data=20
is large. A single queue would not have this problem.

But now that you mention the advantages of the multiple queues, it seems=20
that neither situation is ideal. So maybe I will have to think some more=20
on this one.

> >   It would be nice to know what IPMI privilege the command came in=20
> >   with (ADMIN for session-less commands) so that the command handler=20
> >   can behave appropriately based on the user.
>=20
> Makes sense.
>=20
> >=20
> > 3) When registering commands, it would be nice of the list also=20
> >   maintained a priority so that commands could be easily overridden.=20
> >   Currently the only way to override a command is to make sure that=20
> >   your library gets loaded first (and this is done via the library=20
> >   name). If we had default ipmi commands loaded at DEFAULT_PRIO and=20
> >   then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or=20
> >   something like that, we could have integrators further on down the=20
> >   line able to easily add a new provider library and piecemeal override=
=20
> >   individual command. An alternate (or addition) might be the addition=
=20
> >   of a unregister command method to remove an existing command so it=20
> >   could be replaced with a new one (or just straight up removed).
>=20
> The intent is that everything in OpenBMC is overridable by an integrator.
> We provide a reasonable =E2=80=98reference=E2=80=99 implementation but ca=
n be replaced
> with something else via a bitbake layer.  At image construction time.
>=20
> I think you are proposing a setup where an image has multiple providers
> for the same command, and the =E2=80=98reference=E2=80=99 has a low prior=
ity.  In their
> bitbake layer, an integrator could _add_ another provider with higher
> priority, which would be selected to handle the command since it has
> the higher priority.
>=20
> That makes sense, but why wouldn=E2=80=99t an integrator just _replace_ t=
he
> reference in an image with the custom integrator provider?  This type
> of thing is exactly why we are a bitbake distro.
>=20
> I hope you don=E2=80=99t have a good answer to this :-) as one of my goal=
s is
> to try move runtime complexity into the build process as much as we can.

The only thing I can think of is if an integrator likes 75% of the=20
commands in one of the base provider libraries but still wants to=20
override 25% of the commands (or even just one).

Pushing the configuration to the build is good. Maybe adding some way to=20
enable/disable each command in the base providers at build time.=20
Otherwise integrators would need to maintain a patch that disables the=20
command the hard way.

That said, this may not really be a huge deal since it is more likely=20
that any commands integrators will be adding would be OEM commands that=20
don't collide anyway.

--Vernon
