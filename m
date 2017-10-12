Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCkgw37qtzDqJ7
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 08:36:43 +1100 (AEDT)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2017 14:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,368,1503385200"; d="scan'208";a="159902420"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga005.jf.intel.com with ESMTP; 12 Oct 2017 14:36:41 -0700
Date: Thu, 12 Oct 2017 14:36:41 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Xo Wang <xow@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
Message-ID: <20171012213641.GB17014@mauery>
References: <20171011220548.GA61269@mauery>
 <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
 <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Oct 2017 21:36:45 -0000

On 12-Oct-2017 09:25 AM, Xo Wang wrote:
> On Thu, Oct 12, 2017 at 9:03 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> >
> >> On Oct 11, 2017, at 6:05 PM, Vernon Mauery <vernon.mauery@linux.intel.=
com> wrote:
> >>
> >> I am working on an ipmi provider library and had a few questions and
> >> observations.
> >>
> >> 1) Why are there separate ipmi message queues for the host and network?
> >
> > iirc it was so that you could have a different set of providers
> > registered for each channel or even different, channel specific
> > implementations for the same command.
> >
>=20
> The reasoning here also derives from the "build the distro as you like
> it" approach. If you don't want a network interface to the BMC, then
> you can simply not build it or its handlers.
>=20
> Of course we could write a single queue service for both host and
> network that can be configured and built to support only one, but that
> puts the onus on architecting and testing that service to ensure the
> all three configurations all work independently.

What about a ipmi queue library or something that handles loading the=20
appropriate provider libraries (based on some path) and then manages the=20
incoming messages. We have two separate queue implementations between=20
net-ipmi and host-ipmi; we could simplify this so the behavior is the=20
same between the two.

> >>   It seems awkward that for the host, the ipmi request comes from a
> >>   different process (btbridge, or in our case kcsbridge), while for the
> >>   network (RMCP+), the messages are handled directly in the same
> >>   process.
> >
> > Is it still awkward if you accept the two queue approach?  The
> > additional layer is needed for the bt/kcs -> host-ipmid
> > abstraction.  No such abstraction is needed for network.
> >
> >>
> >>   It seems that the network handler could just as easily package the
> >>   command up and send it to ipmid the same way that btbridge does.
> >>
> >> 2) Can we modify the signature of the handlers so that they can behave
> >>   in a more intelligent manner? It would be nice if they were handed a
> >>   gsl::span<uint8_t> instead of a void* and a length. This allows for
> >>   a no-copy, bounds-checked way of passing buffers.
> >
> > sounds good to me!
> >
>=20
> We can use more intelligent (safer) data passing throughout phosphor code=
=2E :)

I will probably start with changes like this that pull me gently into=20
the code.

> >>
> >>   It would be nice to know what channel something came in on. We might
> >>   want to be able to change behavior based on the incoming channel (as
> >>   some channels are more secure than others).
> >
> > I think the separate message queues solves this need; however, doing
> > this need not be mutually exclusive of having separate queues if that
> > enables another use case we don=E2=80=99t support today.
> >
> > I=E2=80=99m not totally stuck on two queues.  Especially if some altern=
ative
> > maintains the same level of flexibility.  The motivation for a single
> > queue isn=E2=80=99t clear yet to me though - without more discussion it=
 sounds
> > like we=E2=80=99d end up with the same capability we already have=E2=80=
=A6so why bother?
> >
>=20
> One set of cases is where a host might have multiple interfaces to the
> BMC (e.g. BT and SSIF).
>=20
> I can't immediately think of why a provider might want to respond to a
> command differently based on what host interface it came on, but maybe
> somebody else can.

We have two kcs interfaces that in theory are supposed to have different=20
behavior: one is from the host and can have reasonable latency, the=20
other is the kcs that the BIOS would use during an SMI and needs to have=20
minimal latency. That being said, I am not sure if this feature is still=20
used at this time. You said you were looking for a use case. :)

--Vernon
