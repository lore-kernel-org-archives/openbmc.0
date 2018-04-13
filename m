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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N1h46PfxzF1lS
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 01:21:08 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B3415EA0B0;
 Fri, 13 Apr 2018 11:21:04 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: YASL Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
Date: Fri, 13 Apr 2018 11:21:04 -0400
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 13 Apr 2018 15:21:09 -0000


> On Apr 12, 2018, at 11:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
> Some advantages I've found to this technique are:
>=20
> * There's no reduction of readability in the code

This.

> * You get test binaries that you can run independent of your test =
framework, as there isn't really a test framework, just autotools =
running your test binaries in parallel
> * By extension, if you need to debug a failing test case, you can gdb =
the test binary directly without needing to comprehend the side-effects =
of the test framework on your test binary

And this. =20

Honestly these are my _real_ objections but I brought up runtime =
overhead because
that is not subjective.  I just don=E2=80=99t like how the direction we =
are headed
obfuscates things for developers that have a good understanding of =
standard libraries,
tools, and language features (libc, libstd++, STL, GDB, etc...) and =
don=E2=80=99t have an
understanding of the internals of GMock or the =E2=80=9Ctechniques" its =
use drives into the
code.  I expect there to be way more of the former (those up to speed on =
the standard
libraries, tools, language features) than the latter (those comfortable =
working on
a GMock inspired codebase).

IMHO these concepts have a greater (positive) impact on the project =
overall than
super-easy-unit-test writing.  I=E2=80=99d guess I=E2=80=99m in the =
minority, but hey=E2=80=A6I have to
speak my mind right?  I can certainly relate to the opposing viewpoint.=
