Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ychSG53MYzDqp3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 11:09:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 24AD7975B9;
 Wed, 15 Nov 2017 19:09:12 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Gerrit code review velocity
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAF506B@ORSMSX105.amr.corp.intel.com>
Date: Wed, 15 Nov 2017 19:09:11 -0500
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B00151F-6B6E-4060-8316-F955F9A8E20F@fuzziesquirrel.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF506B@ORSMSX105.amr.corp.intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Thu, 16 Nov 2017 00:09:20 -0000

Hi Ed

> On Nov 15, 2017, at 4:50 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> Is there anywhere that the SLAs and formats for how community code =
reviews are conducted?

I don=E2=80=99t think so.  We have been operating with 2 x +1 required =
and then a merge review from the maintainer (me), although I don=E2=80=99t=
 always follow that if changes seem trivial.  I=E2=80=99d be willing =
entertain a stricter policy.

> =20
> I=E2=80=99m having some concerns around the code merge velocity on =
both sides of the spectrum, and I thought I=E2=80=99d see what =
everyone=E2=80=99s thoughts were on the matter.
> =20
> A great example of these concerns is below.  First and foremost, I=E2=80=
=99m not picking on this specific committer here, this seems to be a =
greater issue.
> https://gerrit.openbmc-project.xyz/#/c/7925/
> =20
> This patchset was pushed last night, approved by a single developer,

This had two +1s from other developers before I submitted it.  What am I =
missing?

> and merged by the submitter <24 hours later.  Considering this is a =
=E2=80=9Cphosphor=E2=80=9D reference component, changes an architecture =
level change (supporting multiple HWmon clients)

In my head this was a bug fix.  I=E2=80=99m don't understand how this is =
an architectural change.  I just changed the bus name format from:

xyz.openbmc_project.Hwmon<N>.Hwmon

to=20

xyz.openbmc_project.Hwmon-<ID>.Hwmon1

> and doesn=E2=80=99t seem to have any supporting unit tests, I=E2=80=99m =
concerned at the velocity that it was moved through the progression, and =
into master.
> =20
> Considering that we had some discussions on this specific change =
before, I would=E2=80=99ve liked to have input, and I=E2=80=99m sure =
others in the community would=E2=80=99ve as well, but were not given the =
opportunity. =20

That=E2=80=99s all reasonable.  I support having a conversation about =
how code reviews are conducted and making changes to the process.  But =
to be honest, what would be more valuable to me is an understanding of =
why you view this particular change as an architectural change, and I =
view it as a bug fix.  That is a pretty fundamental disconnect.

Maybe to start that, would you be willing to briefly outline what you =
think the old architecture was, and what the new one is after this =
change?

> Do we have  a process for how long code review->test->merge should =
take, and what process it should follow?

We don=E2=80=99t.  My personal preference would be for this to be at the =
repo maintainers discretion.  I=E2=80=99m sure that sounds bad since I =
am the maintainer of nearly all of them, but I do want other people =
maintaining eventually and I=E2=80=99d still say the same thing even =
after it wasn=E2=80=99t me.

That said, I=E2=80=99m more concerned in building a community here, so =
I=E2=80=99m willing to submit to group-think if others feel one way or =
the other.

> =20
> On the other end of the spectrum, I see code commits where the last =
activity was several months ago, and do not see anyone picking it up, =
nor any forward progress on merging.  Is there a process defined for =
abandoning commits?
> =20
> If the answer to all of these questions is, =E2=80=9Cno=E2=80=9D or =
=E2=80=9Cnothing written down=E2=80=9D I=E2=80=99m happy to put down =
some of my thoughts on integration rules down in a spec-like form, and =
see if we can come up with something that everyone is happy with.

This is a great idea.  Thanks!

> =20
> Thanks,
> =20
> -Ed=20


-brad=
