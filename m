Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RjLc1dNczF1ql
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 01:18:46 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 77551975BF;
 Thu, 19 Apr 2018 11:18:42 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Domains (was: Migration to new gerrit server is coming)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
Date: Thu, 19 Apr 2018 11:18:42 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD928405-0C6F-4708-9DA5-DB099C4D2B1B@fuzziesquirrel.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
 <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
 <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>,
 Andrew Geissler <geissonator@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 15:18:48 -0000


> On Apr 19, 2018, at 9:43 AM, Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
>=20
>=20
> 03.04.2018 18:30, Andrew Geissler wrote:
>> On Mon, Apr 2, 2018 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> Do we have plans to use the gerrit.openbmc.org domain instead?
>> In order to reduce what's changing with this first migration, I'll
>> keep the old name but yes, Brad got me in touch with someone from the
>> Linux Foundation and long term we'll be moving to something like
>> gerrit.openbmc.org.
> I'm kind of lost with all these domains=E2=80=A6

Understandable :-)

> I remember we have an ongoing effort to move all d-bus stuff from
> org.openbmc to xyz.openbmc-project.

In the early days of this project, org.openbmc was used for DBus naming. =
 At a
later date, we stumbled onto this in the DBus specification:

    Interface names should start with the reversed DNS domain name of =
the
    author of the interface (in lower-case), like interface names in =
Java.=20

but openbmc.org was not available.  So the effort to move all dbus names
from org-openbmc to xyz-openbmc_project was born.

Fast forward to today, and openbmc.org has been donated to the project
by the prior owner (thanks Facebook!)

> Now you're saying we'll be moving gerrit to openbmc.org=E2=80=A6

I=E2=80=99m not sure _moving_ is the correct word.  I=E2=80=99d guess =
that gerrit.openbmc_project.xyz
will be a CNAME for openbmc.org for some amount of time.  Right Andrew?

> What is the official domain for openbmc now?

What do we want it to be?  I=E2=80=99d vote for openbmc.org.  Unless =
someone
argues otherwise I think you can safely assume that openbmc.org is the
=E2=80=9Cofficial=E2=80=9D domain for this project.

> Are we going to move the d-bus stuff back to org.openbmc now?

If this is what people want I don=E2=80=99t see a problem with that.  =
But the
project will (eventually) own both domains, so the urgency goes down a
bit I feel.

> Personally, I would welcome that as I hate the .xyz TLD as it is
> meaningless and beside that has some not very nice connotation for any
> Russian speaker. I also think that short 'openbmc' is way more neat =
than
> 'openbmc-project'.
> Also, as openbmc-project.xyz is owned by Patrick Williams (as well as
> OpenBMC IANA PEN), and openbmc.org is owned by TLF, I'd say that we =
must
> go with openbmc.org everywhere.

We are in the process of transferring the xyz domain and the IANA PEN
from Patrick to TLF.  There isn=E2=80=99t any resistance on Patrick=E2=80=99=
s end, if
that makes anyone feel better.  It is just a matter of getting it done.=20=


> However, I'd like to know the official intention.

Have I answered this?

>=20
> Alexander.
>=20
