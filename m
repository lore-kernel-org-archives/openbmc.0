Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCbHF0psjzDr4T
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 03:03:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6E6B8161EBE;
 Thu, 12 Oct 2017 12:03:13 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20171011220548.GA61269@mauery>
Date: Thu, 12 Oct 2017 12:03:13 -0400
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
References: <20171011220548.GA61269@mauery>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Thu, 12 Oct 2017 16:03:21 -0000


> On Oct 11, 2017, at 6:05 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> I am working on an ipmi provider library and had a few questions and=20=

> observations.
>=20
> 1) Why are there separate ipmi message queues for the host and =
network?=20

iirc it was so that you could have a different set of providers
registered for each channel or even different, channel specific
implementations for the same command.

>   It seems awkward that for the host, the ipmi request comes from a=20
>   different process (btbridge, or in our case kcsbridge), while for =
the=20
>   network (RMCP+), the messages are handled directly in the same=20
>   process.

Is it still awkward if you accept the two queue approach?  The=20
additional layer is needed for the bt/kcs -> host-ipmid
abstraction.  No such abstraction is needed for network.

>=20
>   It seems that the network handler could just as easily package the=20=

>   command up and send it to ipmid the same way that btbridge does.
>=20
> 2) Can we modify the signature of the handlers so that they can behave=20=

>   in a more intelligent manner? It would be nice if they were handed a=20=

>   gsl::span<uint8_t> instead of a void* and a length. This allows for =20=

>   a no-copy, bounds-checked way of passing buffers.

sounds good to me!

>=20
>   It would be nice to know what channel something came in on. We might=20=

>   want to be able to change behavior based on the incoming channel (as=20=

>   some channels are more secure than others).

I think the separate message queues solves this need; however, doing
this need not be mutually exclusive of having separate queues if that
enables another use case we don=E2=80=99t support today.

I=E2=80=99m not totally stuck on two queues.  Especially if some =
alternative
maintains the same level of flexibility.  The motivation for a single
queue isn=E2=80=99t clear yet to me though - without more discussion it =
sounds
like we=E2=80=99d end up with the same capability we already have=E2=80=A6=
so why bother?

>=20
>   It would be nice to know what IPMI privilege the command came in=20
>   with (ADMIN for session-less commands) so that the command handler=20=

>   can behave appropriately based on the user.

Makes sense.

>=20
> 3) When registering commands, it would be nice of the list also=20
>   maintained a priority so that commands could be easily overridden.=20=

>   Currently the only way to override a command is to make sure that=20
>   your library gets loaded first (and this is done via the library=20
>   name). If we had default ipmi commands loaded at DEFAULT_PRIO and=20
>   then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or=20=

>   something like that, we could have integrators further on down the=20=

>   line able to easily add a new provider library and piecemeal =
override=20
>   individual command. An alternate (or addition) might be the addition=20=

>   of a unregister command method to remove an existing command so it=20=

>   could be replaced with a new one (or just straight up removed).

The intent is that everything in OpenBMC is overridable by an =
integrator.
We provide a reasonable =E2=80=98reference=E2=80=99 implementation but =
can be replaced
with something else via a bitbake layer.  At image construction time.

I think you are proposing a setup where an image has multiple providers
for the same command, and the =E2=80=98reference=E2=80=99 has a low =
priority.  In their
bitbake layer, an integrator could _add_ another provider with higher
priority, which would be selected to handle the command since it has
the higher priority.

That makes sense, but why wouldn=E2=80=99t an integrator just _replace_ =
the
reference in an image with the custom integrator provider?  This type
of thing is exactly why we are a bitbake distro.

I hope you don=E2=80=99t have a good answer to this :-) as one of my =
goals is
to try move runtime complexity into the build process as much as we can.

>=20
>=20
> I am happy to work on changes that I would like to see and submit=20
> patches for review, but I wanted to know if there was some sort of=20
> historical or other reason that would prevent my work from getting=20
> rejected before I actually do the work.
>=20
> --Vernon
