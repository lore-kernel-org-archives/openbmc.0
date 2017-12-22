Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z3NrJ4G2SzF0CG
 for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2017 09:45:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1513982711.5787.141.camel@fuzziesquirrel.com>
Subject: Re: Request for a development repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Fri, 22 Dec 2017 17:45:11 -0500
In-Reply-To: <CAO=noty9Z6VuPtyuCgSqVeT4jRon4=YfwzHid=8zup50gA8u4w@mail.gmail.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
 <CAO=noty9Z6VuPtyuCgSqVeT4jRon4=YfwzHid=8zup50gA8u4w@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Dec 2017 22:45:21 -0000

On Thu, 2017-12-21 at 13:41 -0800, Patrick Venture wrote:
> On Thu, Dec 21, 2017 at 11:16 AM, Tanous, Ed <ed.tanous@intel.com>
> wrote:
> > In the hope of being more open with our development process, we=E2=80=
=99d
> > like to
> > create a repo for hosting work-in-progress applications, and
> > applications
> > that don=E2=80=99t really fit into the other repositories.  Internall=
y, we
> > have such
> > a repository, informally named proving ground, where we try to
> > build out
> > concepts to test new applications, modes, and put the things that
> > are
> > specific to our platform that don=E2=80=99t really fit anywhere else.=
  An
> > example of
> > a component that would be contained in here would be this:
> > https://gerrit.openbmc-project.xyz/#/c/8197/
> >=20
> >=20
> >=20
> > With the goal of being more open, we=E2=80=99d like to find a way to =
make
> > these
> > prototypes available to the community sooner, and have our machine
> > targets
> > build some of the components while still in development.  The
> > options we=E2=80=99ve
> > considered thusfar are:
> >=20
> >=20
> >=20
> > 1.       Acquire a repository under github/openbmc, possibly called
> > intel,
> > possibly called something more company agnostic.  Here we would put
> > our
> > prototypes, and things that we would like to enable on our
> > platforms.
>=20
> I vote for this option with a more generic name.  It would be handy
> since a lot of new daemons or work has nowhere to really be staged.

How would this work exactly?  Would there be one repository for the
whole project where any submissions are accepted unconditionally?  Or
are we driving at providing a repo to organizations and/or individuals
that they maintain?

I'm probably sounding critical of the idea...that isn't the intent -
just wanting to understand where we are headed.

>=20
> >=20
> > 2.       Start our own repository on 01.org (Intels open source
> > repository)
> > and simply make our platform recipes in openbmc point to it.
> >=20
> > 3.       Create repositories for each component under openbmc, and
> > define a
> > faster SLA and process for requesting new repos.

In the longer term this would get my vote.  But I still think we need
to do something to enable you in the short term, until someone proposes
a process.

You mention a faster SLA and I want to touch on that because I think it
is important.

I'm reading between the lines a bit, but I'd guess if I'd created a
repository for the project you reference above within a couple days of
the submission (along with a couple other RFCs) we wouldn't be having
this conversation.

For better or worse, I am the maintainer of this project (at the moment
anyway :-)).  Let me share what I think this role means because I think
its informative here.

My role is to ensure that:
 - contributors to the project have a voice.
 - participation and collaboration occurs transparently (open).
 - contributions make the project better for the most number of people.

If someone submits an RFC, and I just create a repository, I've done
none of those things.  I honestly have very little motivation to hold
up any contributions based on technical merit alone.  What I want to
see is evidence of the bullet points above.

I'm perfectly happy to personally work myself to ensure these things
are being done for contributions from others, but that _will_ be a high
latency process.  To make it faster, contributors themselves can
solicit support for their ideas from others by asking them to review
code, vocalize their support on the mailing list, etc.  People that
helped shape the proposed code/design/idea behind closed doors don't
count imho - that would just be a rubber stamp.

Does this insight help any with the problem we are trying to solve with
the proposed proving-ground?

Sorry for the book - thoughts welcome.

> >=20
> > 4.       Continue with our internal fork, and publish prototypes to
> > repositories once they fit some definition of =E2=80=9Cdone=E2=80=9D.
> >=20
> >=20
> >=20
> > My personal preference would be #1, but I=E2=80=99m curious if anyone=
 has
> > any
> > thoughts on other opinions on how this should be done, or have
> > better
> > options that we haven=E2=80=99t thought of yet.
> >=20
> >=20
> >=20
> > Thanks,
> >=20
> >=20
> >=20
> > -Ed
