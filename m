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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TRjS6PzCzF36W
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 12:11:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B0584134F34;
 Sun, 15 Jul 2018 22:11:18 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: How to handle security vulnerabilities (was: OpenBMC security
 workgroup status)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1531464997.759540.1439362504.21B25D92@webmail.messagingengine.com>
Date: Sun, 15 Jul 2018 22:11:18 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC6EEF0D-8D17-4936-A6DD-4059CB459EBC@fuzziesquirrel.com>
References: <OFE1ABED0B.13DF2F69-ON002582C8.007A50D4-002582C8.007AA270@notes.na.collabserv.com>
 <1531464997.759540.1439362504.21B25D92@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 02:11:25 -0000


> On Jul 13, 2018, at 2:56 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Fri, 13 Jul 2018, at 07:49, Joseph Reynolds wrote:
>>> What's the short-term strategy for handling [security] vulnerability
>>> reports received in the gap between now and getting some formal
>>> process in place?=20
>> We don't have a strategy.  Let's discuss it here.
>>=20
>> Officially (https://github.com/openbmc/openbmc/ section "Bug =
Reporting")
>> issues are managed on GitHub.=20
>>=20
>> Unofficially, Brad volunteered to accept one batch of security
>> vulnerability reports and distribute them, presumably to the OpenBMC =
TSC
>> members (https://github.com/openbmc/docs section "Technical Steering
>> Committee ") or their delegates.  I assume they would privately =
contact
>> a trusted OpenBMC contributor who could address the problem.=20
>>=20
>> We could adapt the Linux model
>> =
(https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html),
>> although I am still looking for information on what the Linux =
security
>> team does with the bug report.  For example, how security group =
members
>> track and discuss problems among themselves, how they pull in =
additional
>> resources to fix or mitigate the problem, and how they inform =
downstream
>> distros before announcing the problem, etc.=20
>=20
> I thought the documention described most of this? security@kernel.org =
is a private list, so discussions can happen there freely. With respect =
to informing downstream distros, as mentioned that's done via the =
linux-distros@vs.openwall.org list. As for how they pull in additional =
resources to fix or mitigate the problem, that's going to depend on the =
affected parties. No-one can order anyone to fix a particular problem, =
but the developers/maintainers/vendors involved have skin in the game so =
should be motivated to fix the issue.
>=20
>>=20
>> I think the first step for the OpenBMC team is to establish an email
>> address (like security@openbmc.org), subscribe only trusted people to
>> that email list, and update the docs to explain that you should email
>> the security team for security questions, and use issues for =
everything
>> else.=20
>=20
> Sounds good to me. Who can sort out security@? Brad? I'm sure we could =
sort out list hosting on ozlabs.org if necessary (like we use for this =
list).

Unless someone replies in the negative in the next couple days, lets =
just
do another list on ozlabs.org, if ozlabs.org is ok with that :-)

>=20
>> Presumably, the security team would communicate privately among
>> themselves and the submitter to assess the situation, and contact
>> OpenBMC community members privately to address the problem.=20
>> This would be an easy step to take, and would move the team in the =
right
>> direction.  What do you think?
>=20
> Sounds good enough for the moment!
>=20
> Andrew
