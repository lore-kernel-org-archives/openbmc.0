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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rpSw3JH9zF1Dt
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 09:22:22 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2F1856E229;
 Wed, 23 May 2018 19:22:19 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Proposal for OpenBMC releases
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <f25e143f-dce7-3f6e-3d4e-72ce7fe51ee4@gmail.com>
Date: Wed, 23 May 2018 19:22:18 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <571344FE-9386-4B1E-BCC6-39294C7DDC6B@fuzziesquirrel.com>
References: <f25e143f-dce7-3f6e-3d4e-72ce7fe51ee4@gmail.com>
To: krtaylor <kurt.r.taylor@gmail.com>
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
X-List-Received-Date: Wed, 23 May 2018 23:22:25 -0000


> On May 21, 2018, at 1:07 PM, krtaylor <kurt.r.taylor@gmail.com> wrote:
>=20
> In order for us to facilitate all member companies in the OpenBMC work =
planning process, I believe it is important for the project to adopt a =
formal release schedule. Release cycles allow member companies to plan =
on content being delivered, get a read on project priorities, and =
exchange design ideas on the best implementation. As with other =
projects, release dates would be fixed in time. If a feature didn't make =
the release cutoff, then it ships in the next release. This really helps =
drive prioritization of new functionality.
>=20
> As Brad commented in the community call today, let's start off the =
proposal with aligning with the Yocto project releases plus some time =
for project testing/hardening. Yocto releases are every 6 months, around =
May-October[1], so if we allow for a month of freeze and testing, that =
would be OpenBMC releases every June-November. Since June is next month, =
I'd propose that we start planning now for the November release.
>=20
> OpenBMC release ? November 2018
>=20
> Questions:
> How do we number releases? do we want to code name them?

I would suggest/vote-for adopting Yocto/Poky/OE conventions here=E2=80=A6
so 2.3 -> pyro, 2.4 -> rocko, etc.

> Do we want a stable branch/working branch organization?

I would think so.  Again I'd suggest/propose something similar to
Yocto/Poky/OE:

master
master-next
rocko
rocko-next
pyro
pyro-next

Perhaps we could skip the -next branches.

> How long does the project maintain a stable branch? n-1? n-2?

I=E2=80=99m not sure.  My gut reaction was, as many as the community is =
willing
to write patches against, test, and maintain.

Do you consider N to be master (dev branch) or the most recent release?
If the latter=E2=80=A6I=E2=80=99d be happy to start with supporting just =
N.  We can
see about N-1, N-2 once we get a taste of supporting something other
than just master.

> Do we want project milestones for content proposal, code freeze and =
release?

Most definitely, IMO.

>=20
> [1] https://wiki.yoctoproject.org/wiki/Releases
>=20
> Kurt Taylor (krtaylor)
