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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4204l05FGNzDqC3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 20:30:02 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CD19EE9F40;
 Tue, 28 Aug 2018 06:29:55 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Proposals for commit log policy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
Date: Tue, 28 Aug 2018 06:29:55 -0400
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Tue, 28 Aug 2018 10:30:05 -0000


> On Aug 22, 2018, at 7:58 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Tue, 21 Aug 2018 at 22:01, Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> some-package: bump version 62286ef3 to 4fa63380
>>=20
>> Author Name (2):
>>  commit 1 synopsis
>>  another commit synopsis
>>=20
>> Another Author (3):
>>  great commit
>>  yet another great commit
>>  fix previous not-so-great commit
>>=20
>> Change-Id: some-long-gerrit-hash
>> Signed-off-by: The Version Bumper <bumper@nowhere.net>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>> What do you think? Is this feasible? Any other ideas how we could =
simplify creating release notes suitable for end users?
>=20
> I think this is a great suggestion. I would also like to see this =
happen.
>=20
> Having the maintainers or authors of the packages submit their bumps
> would ensure this does not become a burden for the central repository
> maintainer.
>=20
> An advantage of the maintainers of individual packages submitting
> their changes is they know the best timing for integrating their
> changes, and know what relevant details should be added to the bump
> commit message.

I also would like to see this.  To be clear I mean the commit msg text =
above,
and not a =E2=80=98Impact=E2=80=99 token. =20

The autobump script was deployed at a time in the project when _every_ =
repository
had the same maintainer, so it made some sense back then.  Today we have =
a much
more distributed set of maintainers.

I=E2=80=99ve actually disabled the cron job that runs the script, =
because it needed
some rework to handle the new openbmc/openbmc repository layout.

I plan on simply _not_ turning it back on, and let maintainers do their =
own
bumps like Joel has been doing for the kernel moving forward (Thanks =
Joel).
Unless there are major objections.

thx - brad

>=20
> Cheers,
>=20
> Joel
