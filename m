Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGvNP4lspzDrpn
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 12:19:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1389514279D;
 Tue, 17 Oct 2017 21:14:00 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Machine-scope maintainers for OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1508288180.24322.21.camel@aj.id.au>
Date: Tue, 17 Oct 2017 21:13:59 -0400
Cc: Lei YU <mine260309@gmail.com>, OpenBMC <openbmc@lists.ozlabs.org>,
 Yi TZ Li <shliyi@cn.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Mykola Kostenok <c_mykolak@mellanox.com>,
 Patrick Venture <venture@google.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>, Andrew Geissler <geissonator@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF62FE4E-809B-4BE5-8E24-17B859B1F373@fuzziesquirrel.com>
References: <1507868164.5452.192.camel@aj.id.au>
 <CAARXrtkrQtpdkCxp+Oqf-HUBttY6sv2+BEr3gAknXNXq=SGyAg@mail.gmail.com>
 <1508288180.24322.21.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Wed, 18 Oct 2017 01:19:18 -0000

>=20
> On Oct 17, 2017, at 8:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Tue, 2017-10-17 at 09:23 +0800, Lei YU wrote:
>> Hi Andrew, Brad,
>>=20
>> I would like to bring a question about how do we welcome system
>> vendors' systems.
>>=20
>> Background: in gerrit we already have some system vendors' machines
>> under review:
>> * meta-inventec/meta-lanyang: =
https://gerrit.openbmc-project.xyz/#/c/3888/
>> * meta-yadro/meta-vesnin: =
https://gerrit.openbmc-project.xyz/#/c/6429/
>>=20
>> They both contain a "large" commit that introduce a machine.
>>=20
>> I know we have suggestions to split the commit into separated smaller
>> ones, but this
>> seems a bit hard:
>> * The work is based (referenced) on a similar machine, e.g palmetto =
or
>> zaius, which
>>    means the base code (meta-xxx) is already big;
>> * The change is submitted as a "squashed" one after it's built and
>> tested, which means
>>    not each "internal" commit can be built successfully.

I understand.  I remember the first time someone asked me to split
a bunch of my work into small pieces.  My first thought was, why!?! It
works as-is.

But I think this view is just an artifact of not having your code peer
reviewed (or not properly) in the past, or having to do peer review =
yourself.
(I=E2=80=99m not referring to you personally Lei, just in general).

It really doesn=E2=80=99t take very long participating in an environment =
where
peer review is primary to understand the benefit for both the author
and the reviewer, of that extra effort.


>>=20
>> In such case, how do we handle this case? Is it possible to accept a
>> large squashed commit
>> if and *only* if the change is to introduce a new meta-machine?

For the new machine case, we may have an opportunity to ease the
transition for new contributors with a new machine cookbook or wizard=E2=80=
=A6
one that includes help constructing a series of patches rather than just =
one.

>=20
> I think that depends. What are you comfortable reviewing? Personally I
> *much* prefer small, obvious patches than a hulking diff in the
> magnitude of thousands of lines. I find it *much* harder to track
> what's going on in the latter type of change. Bear in mind that this =
is
> code that could/will be executing on any number of people's machines,
> and we have a responsibility to the community to ensure it's not doing
> anything too crazy.
>=20
> If you're comfortable reviewing large patches like that and signing =
off
> on them then you may have just won yourself a lot of work :D =
Otherwise,
> my view is contributors should help themselves by helping those
> reviewing the code say yes to their contribution, which means at least
> self-contained changes which are hopefully small.
>=20
> However, we do run into one of my favourite topics: essential vs
> accidental complexity[1]. Sometimes it's not possible to break things
> down further. In this case reviewers might have to just deal with =
large
> patches, but contributors should be willing to bend to their judgement
> on whether the patch has been reduced to deal with only the essential
> complexity of the problem. If it hasn't, the patch should probably be
> split.
>=20
> I'm hesitant to provide a blanket rule like "all new system additions
> can be a patch bomb" without ruling out accidental complexity from the
> problem.
>=20
> [1] https://en.wikipedia.org/wiki/No_Silver_Bullet
>=20
> Sure, this all raises the bar to contribution a bit. However I feel it
> does so in a way that leads to positive long-term contributions to the
> community by demonstrating some commitment, rather than just having
> code dumped over the wall with the risk that it gets neglected.
>=20
> Maybe this could be seen as being exclusive. That's true to an extent,
> but I feel it's principled exclusion: That we should weight exclusion
> for the quality of the implementation of the contribution (i.e. =
whether
> the patch can be understood with confidence, the quality of the =
design,
> quality of the code code, whether it has tests, etc), but we should
> heavily weight *inclusion* for the requirements and concepts driving a
> contribution (adding support for previously unsupported systems,
> alternative implementations of DBus interfaces if they meet new
> requirements, etc).
>=20
> To clarify, saying no to a patch adding a new system should probably
> not be interpreted as "no we don't want to support your system", =
rather
> "thanks for your effort to contribute support for your system! However
> I think you can help us help you by arranging the patch differently".
>=20
> To finish, these are my personal opinions on the matter, and may not =
be
> reflected by the community at large. I'm keen to hear what other =
people
> think. Hopefully it addressed your query somewhere in the wall of text
> :)
>=20
> Andrew


I=E2=80=99m pretty much in complete agreement with all of Andrew=E2=80=99s=
 points.

-brad
