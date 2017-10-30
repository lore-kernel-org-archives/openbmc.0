Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQkr23myHzDqMY
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 06:21:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 006C78B260;
 Mon, 30 Oct 2017 15:21:48 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: PECI API?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
Date: Mon, 30 Oct 2017 15:21:48 -0400
Cc: openbmc@lists.ozlabs.org, ed.tanous@linux.intel.com,
 james.feist@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Mon, 30 Oct 2017 19:21:54 -0000


> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>=20
> Hi Dave,
> =20
> I=E2=80=99m currently working on PECI kernel driver

I=E2=80=99m curious about the high level structure.  I=E2=80=99m sure =
others are as well.  Anything
you can share would be informative and appreciated!

A couple questions that popped into my head:

 - Would there be a new Linux bus type or core framework for this? =20
 - How many drivers would there be for a full stack.  Something like =
this?
     - client? (hwmon, for example)
     - core? (common code)
     - bmc specific implementation? (aspeed, nuvoton, emulated =
differences)
 - Have you considered using DT bindings and/or how they would look?

These questions are motivated by the recent upstreaming experience with =
FSI
(flexible support interface) where a similar structure was used.  FSI on =
POWER
feels similar to PECI in terms of usage and features so I thought I=E2=80=99=
d just throw
this out there as a possible reference point to consider.

> and hwmon driver implementation. The kernel driver would provide these =
PECI commands as ioctls:
> =20
> - low-level PECI xfer command

Would a separate =E2=80=98dev=E2=80=99 driver similar to i2c-dev make =
sense here?  Just
thinking out loud.

> - Ping()
> - GetDIB()
> - GetTemp()
> - RdPkgConfig()
> - WrPkgConfig()
> - RdIAMSR()
> - RdPCIConfigLocal()
> - WrPCIConfigLocal()
> - RdPCIConfig()
> =20
> Also, through the hwmon driver, these temperature monitoring features =
would be provided:
> =20
> - Core temperature
> - DTS thermal margin (hysteresis)
> - DDR DIMM temperature
> - etc.

Sweet!

> =20
> Patches will come in to upstream when it is ready.
> =20
> Cheers,
> Jae

For completeness, a port of the Aspeed SDK PECI driver was proposed in =
2016
but it didn=E2=80=99t go anywhere:

https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html

thx - brad=
