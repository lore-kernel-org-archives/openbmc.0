Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCknB4rDSzDrBt
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 08:41:18 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2017 14:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,368,1503385200"; d="scan'208";a="1205246204"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2017 14:41:15 -0700
Date: Thu, 12 Oct 2017 14:41:15 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
Message-ID: <20171012214115.GC17014@mauery>
References: <20171011220548.GA61269@mauery>
 <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
 <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
 <AB5054A8-5A1E-4EF9-8312-77FE43C67570@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AB5054A8-5A1E-4EF9-8312-77FE43C67570@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 12 Oct 2017 21:41:19 -0000

On 12-Oct-2017 12:37 PM, Brad Bishop wrote:
>=20
> > On Oct 12, 2017, at 12:25 PM, Xo Wang <xow@google.com> wrote:
> >=20
> > On Thu, Oct 12, 2017 at 9:03 AM, Brad Bishop
> > <bradleyb@fuzziesquirrel.com> wrote:
> >>=20
> >>> On Oct 11, 2017, at 6:05 PM, Vernon Mauery <vernon.mauery@linux.intel=
=2Ecom> wrote:
> >>>=20
> >>> I am working on an ipmi provider library and had a few questions and
> >>> observations.
> >>>=20
> >>> 1) Why are there separate ipmi message queues for the host and networ=
k?
> >>=20
> >> iirc it was so that you could have a different set of providers
> >> registered for each channel or even different, channel specific
> >> implementations for the same command.
> >>=20
> >=20
> > The reasoning here also derives from the "build the distro as you like
> > it" approach. If you don't want a network interface to the BMC, then
> > you can simply not build it or its handlers.
> >=20
> > Of course we could write a single queue service for both host and
> > network that can be configured and built to support only one, but that
> > puts the onus on architecting and testing that service to ensure the
> > all three configurations all work independently.
>=20
> Another possible advantage for multiple queues might be cgroups prioritiz=
ation.

I think multiple queues might work out fine then. They do seem to have=20
some compelling advantages. But I would like to at least consolidate the=20
queueing portion of the code so all the queues have the same bugs.

> >>>  It seems awkward that for the host, the ipmi request comes from a
> >>>  different process (btbridge, or in our case kcsbridge), while for the
> >>>  network (RMCP+), the messages are handled directly in the same
> >>>  process.
> >>=20
> >> Is it still awkward if you accept the two queue approach?  The
> >> additional layer is needed for the bt/kcs -> host-ipmid
> >> abstraction.  No such abstraction is needed for network.
> >>=20
> >>>=20
> >>>  It seems that the network handler could just as easily package the
> >>>  command up and send it to ipmid the same way that btbridge does.
> >>>=20
> >>> 2) Can we modify the signature of the handlers so that they can behave
> >>>  in a more intelligent manner? It would be nice if they were handed a
> >>>  gsl::span<uint8_t> instead of a void* and a length. This allows for
> >>>  a no-copy, bounds-checked way of passing buffers.
> >>=20
> >> sounds good to me!
> >>=20
> >=20
> > We can use more intelligent (safer) data passing throughout phosphor co=
de. :)
> >=20
> >>>=20
> >>>  It would be nice to know what channel something came in on. We might
> >>>  want to be able to change behavior based on the incoming channel (as
> >>>  some channels are more secure than others).
> >>=20
> >> I think the separate message queues solves this need; however, doing
> >> this need not be mutually exclusive of having separate queues if that
> >> enables another use case we don=E2=80=99t support today.
> >>=20
> >> I=E2=80=99m not totally stuck on two queues.  Especially if some alter=
native
> >> maintains the same level of flexibility.  The motivation for a single
> >> queue isn=E2=80=99t clear yet to me though - without more discussion i=
t sounds
> >> like we=E2=80=99d end up with the same capability we already have=E2=
=80=A6so why bother?
> >>=20
> >=20
> > One set of cases is where a host might have multiple interfaces to the
> > BMC (e.g. BT and SSIF).
>=20
> What about three queues here?  (bt, ssif and rmcp)?  It would require
> some rework of the bt/ssif/kcs -> host-ipmid interface to support multiple
> host-ipmid instances.=20

I think we could have as many queues as we want. I would vote for one=20
per interface so that the interface information can be passed in via the=20
context data to the handler.

--Vernon
