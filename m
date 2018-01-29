Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVd2j3Hj5zF0Pn
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 05:14:52 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3779C6DEDF;
 Mon, 29 Jan 2018 13:14:49 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: BMC redundancy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <524CA01B-1D8E-4C15-B5DB-A27157FBECB7@fuzziesquirrel.com>
Date: Mon, 29 Jan 2018 13:14:49 -0500
Cc: Alexander Amelkin <a.amelkin@yadro.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <78B87CAD-3E09-46AA-A7A4-D1A19A8D40C0@fuzziesquirrel.com>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <7eb0f506-1dd7-1a28-cc0a-9f7813c28562@yadro.com>
 <524CA01B-1D8E-4C15-B5DB-A27157FBECB7@fuzziesquirrel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 18:14:53 -0000

+cc: list

> On Jan 29, 2018, at 1:13 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>=20
> Thanks for the quick reply!
>=20
>> On Jan 29, 2018, at 11:45 AM, Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
>>=20
>> Brad, do you have any examples or existing systems having multiple =
BMCs with any commercial firmware like MegaRAC ?
>=20
> Not really.  I=E2=80=99m just familiar with IBM systems and this is =
something
> we have done in our commercial BMC stacks for a long time.
>=20
>>=20
>> I can't think of a problem you're proposing to address with multiple =
BMCs for a single host, but I can imagine a number of problems it may =
add.
>=20
> Indeed.  Obviously complexity is one.  I=E2=80=99d be interested in =
hearing about
> other problems.  You=E2=80=99ve exposed my agenda - I=E2=80=99m =
looking for ways for IBM to
> be able to support something like this in OpenBMC but at the same time
> minimize the complexity burden for everyone else.
>=20
>>=20
>> BMC lockup? Solved by hardware watchdog.
>> BMC firmware corruption? Solved by read-only golden image on a =
separate flash IC (well supported by at least Aspeed).
>> BMC DoS attack? Solved by network isolation and overall correct =
network environment configuration.
>> BMC chip burnout? Does it happen at all? Isn't this an indicator of =
some major hardware design flaw? Does adding another chip actually solve =
this problem?
>=20
> Yeah on the surface I agree with all your points here, assuming the
> definition of a system is a single board.  It doesn=E2=80=99t make =
sense.
>=20
> We do have some modular system designs though where N discrete chassis
> can be connected together with high speed cabling or a backplane for
> a single SMP fabric across the N chassis for example.  Its these kind
> of system designs where multiple BMCs make a little more sense.
>=20
>>=20
>> What else?
>=20
> It's really the connections between the BMC and the host hardware on
> these larger systems.  These busses can and do have both transient and
> hard failures, and IBM needs a way to maintain connections from a BMC
> to the host hardware in that state.  Also, while not really a =
redundancy
> statement, it simply isn=E2=80=99t economical for BMC vendors to =
develop SOCs
> that can provide enough pins on systems this large.
>=20
> -brad
