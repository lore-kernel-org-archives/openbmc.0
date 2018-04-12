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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MSq60v6CzDqlJ
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 03:40:17 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 251F2EA08C
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 13:40:14 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: reference platforms?
Message-Id: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
Date: Thu, 12 Apr 2018 13:40:13 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 12 Apr 2018 17:40:18 -0000

I think in the not-too-distant-future we are going to need a concept of =
reference
platforms.

openbmc/openbmc is essentially the same thing as Poky.  A super-repo
of other upstream repos (bitbake, oe-core, etc=E2=80=A6).  Our upstream =
repos
just happen to be different things like poky, meta-virtualization, =
meta-phosphor,
meta-aspeed, etc.

But the similarity ends when you look at the platforms supported.  Poky
has a set of reference platforms.  Any other platforms or distros using
Poky are not the Yocto projects concern - they are completely maintained
by the project that uses Poky (like us!).

Thus far we have not really put any filter on what machines you get
when you clone openbmc/openbmc.  I think that needs to change to a model
like the one the Yocto project uses.  The clear benefits I see to that
are:

- It addresses a scaling problem in the openbmc/openbmc repository.  We
are on track to repeat the mistakes of the openembedded project that led
to the formation of Poky in the first place.  That is, we cannot add new
platform and BSP layers indefinitely.  At some point it will become
unmanageable.  Part of me wonders if we are already there.

- Testing.  Obviously a developer cannot test a patch on 100 platforms =
or
10 different SOCs.  So what is the developer expected to test on?  A =
reference
platform.  Then who tests the other systems?  The maintainers of those
systems.  Adopting the same mode of thinking as Poky makes this =
distinction
clear.

So what does everyone think of the idea of reference platforms?  Can
they help the OpenBMC project?

So the obvious next question is=E2=80=A6what are the metrics for =
defining reference
platforms?  I predict finding the answer to that will be a challenge =
:-).

Go ahead and throw crazy ideas out there.  Pay money to the project?  =
Most
days without a compile failure?  There are about a million things we =
could
do here - but what does everyone find fair?

thx - brad=
