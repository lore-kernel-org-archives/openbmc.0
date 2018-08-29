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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420sF90GHczF31h
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 02:55:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BC982EA0B2;
 Wed, 29 Aug 2018 12:55:20 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Single-Source
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
Date: Wed, 29 Aug 2018 12:55:20 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0DEA9298-A196-44BC-AEDA-A72BCCE93D77@fuzziesquirrel.com>
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 29 Aug 2018 16:55:25 -0000



> On Aug 29, 2018, at 11:53 AM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad;
>=20
> While working on updating the documentation, which holds a
> clang-format example in it, within the markdown, I was curious if
> there was a single-source of truth w.r.t configurations of this
> nature?  I imagine it hasn't been an issue yet, but I'm going to
> update clang-format files to use the header inclusion, once we settle
> on the exact pattern, and it'd be useful to have a single-source file
> where I could make the change, and copy that file out into places --
> since I'm not sure of a reasonable automated approach.
>=20
> Any suggestions or thoughts would be appreciated.

Honestly I don=E2=80=99t think we should be telling maintainers how to =
style
the code they maintain.  Just that they have one and and provide a way
for contributors to adhere to it.

But I think I am in the minority with that viewpoint so I guess you
could put a clang-format in the docs repo?  Does that work?


>=20
> Patrick
