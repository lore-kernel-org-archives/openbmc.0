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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mbsf4lhCzDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 04:11:02 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3FE9D14D9C5;
 Thu,  9 Aug 2018 14:10:59 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: phosphor-logging in testing
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notyPv2adUkvdB4xWLngFG5sqfSNQg4eJXM22Ub7ociKd_A@mail.gmail.com>
Date: Thu, 9 Aug 2018 14:10:59 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <61E15CC6-3C64-47ED-B0F8-2880049733BA@fuzziesquirrel.com>
References: <CAO=notyPv2adUkvdB4xWLngFG5sqfSNQg4eJXM22Ub7ociKd_A@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 09 Aug 2018 18:11:03 -0000


> On Aug 9, 2018, at 12:46 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> So, phosphor-logging/log.hpp requires one to link in systemd, so=20
> technically I can already argue it isn't a header-only code-base.

This isn=E2=80=99t really what I think of when I think of header only.  =
But maybe
the distinction doesn=E2=80=99t matter anyway - this isn=E2=80=99t any =
different than sdbusplus
needing libsystemd.  Both phosphor-logging/log.hpp and the sdbusplus bus =
and
message APIs were intended to be C++ language bindings only.  So no =
abstractions
beyond what libsystemd already provides.  For the most part.  Now =
elog.hpp is
another story...

> That said, I'm looking at how to enable testing such that we can
> easily validate error code paths.

I suggest you do the same as what you did for sdbusplus.  Don=E2=80=99t =
mock the
language binding apis provided by log.hpp - mock the libsystemd =
(journal)
apis and set your expectations on those.

>=20
> One approach is to move the code in the header such that it calls some
> code in the library itself that we can swap out with a "body double."
> Another approach is to have some global variable in that library that
> one can flip when they want such that the tests throw an exception or
> something useful to catch in a test.  Or just do nothing.
>=20
> Is there anyone already tackling this problem?
>=20
> Patrick
