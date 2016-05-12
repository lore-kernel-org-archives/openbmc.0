Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5Mfm5swVzDqCm
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 04:57:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=wxZFZ7E5; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com CAB4F1C832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1463079419;
 bh=xtS7zao8NKLnWKYRICdazfI6QlvuhN07GCaRMpOGUF0=;
 h=Subject:From:In-Reply-To:Date:References:To:From;
 b=wxZFZ7E5gT/QxBe+o/GadwNdn6tGnIYQUhJkVEAGBLGyuPxCW+vPSr0wsccm2UZK0
 CtDbeZuKQOP7A1S1R5b1GrN2YJHSj33+gD0pFXjSQwPmmy8H2IC8V1d6yvf/9PjQBa
 tId3FiqQseNo5flTptHASwn4ZNyQ85i/nBfFBVE0=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 3B37F1C7F9
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 14:56:59 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [openbmc/docs] Take a stab at a proper DBUS API document. (#25)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <openbmc/docs/pull/25/c218606742@github.com>
Date: Thu, 12 May 2016 14:56:59 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3297DCA-F2A7-4F02-AE37-5CA1A305BC9D@fuzziesquirrel.com>
References: <openbmc/docs/pull/25@github.com>
 <openbmc/docs/pull/25/c218606742@github.com>
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2016 18:57:05 -0000

Thanks Chris!


> On May 11, 2016, at 6:15 PM, Chris Austen <notifications@github.com> =
wrote:
>=20
> Review status: 0 of 1 files reviewed at latest revision, 4 unresolved =
discussions.
>=20
> dbus-interfaces.md, line 50 [r1] (raw file):
>=20
> | ------------------------- | ---------------------------------------- =
| ---------------------------------------- |
> | /org/openbmc/HostIpmi/<n> | Yes on systems with the host-ipmi =
machine feature, otherwise no. | n: IPMI interface number.  If =
implemented, at least one IPMI interface must exist. |
>=20
> n: you did not specify where n comes from. The tag does not translate =
in md. maybe you need <n> ?

added backticks and it shows up now.

>=20
> dbus-interfaces.md, line 62 [r1] (raw file):
>=20
> | ------------ | ------------ | ------------- | =
---------------------------------------- |
> | SoftPowerOff | void         | x             | Prepare the host =
processor firmware for an orderly shutdown. |
> |              |              | x             | The result status.     =
                  |
>=20
> x would be a negative number for bad results, positive for good? Will =
need someone to define that

Yeah.  Can that come later?  There are lots of undefined things in =
here=E2=80=A6

>=20
> dbus-interfaces.md, line 81 [r1] (raw file):
>=20
> | ---------- | ------------ | ------------- | =
----------------------------- |
> | setPresent | s            | void          | Indicate the item is =
present. |
> |            | s            |               | true or false            =
     |
>=20
> I looked at the code, the first letter is capitalized

I looked too, again, and it isn=E2=80=99t.  What are you looking at?

>=20
> dbus-interfaces.md, line 192 [r1] (raw file):
>=20
> | path                                  | required | description       =
                       |
> | ------------------------------------- | -------- | =
---------------------------------------- |
> | /org/openbmc/sensors/<class>/<sensor> | No       | Any sensor =
instances must be instantiated in the sensors namespace. |
>=20
> those angled brackets do not show up on the web. HTML must want to use =
them. perhaps the hexcode for them ?

backticks fixed.

>=20
> Comments from Reviewable
>=20
> =E2=80=94
> You are receiving this because you authored the thread.
> Reply to this email directly or view it on GitHub
>=20
