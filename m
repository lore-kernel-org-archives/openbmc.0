Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttWVh5r86zDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 11:13:16 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
Date: Tue, 3 Jan 2017 19:13:13 -0500
Cc: Eddie James <eajames.ibm@gmail.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8AB41DE-BABF-428F-9F12-5F4FE5DD5BAD@fuzziesquirrel.com>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
 <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
 <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
 <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 00:13:17 -0000


> On Jan 3, 2017, at 7:06 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Wed, Jan 4, 2017 at 10:49 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>> What if the driver is built into the kernel?  Is there such a thing =
as module only drivers?
>=20
> Our kernel is build with module loading disabled at present.
>=20
> modprobing the driver when userspace is ready is a neat hack that we
> could use for now. However, the driver will need a mechanism that

Do you happen to know if =E2=80=98a mechanism=E2=80=99 is something that =
needs to be invented or=20
if Linux already has something?

> tells it to bind to the hardware when it becomes available. The same
> mechanism would be useful for the fsi driver to initiate a scan and
> bind it's client drivers.
>=20
> Cheers,
>=20
> Joel
