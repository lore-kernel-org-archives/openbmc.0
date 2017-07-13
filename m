Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7GhX53TGzDqBs
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 10:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XAcfWzhB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q+qsoSs2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B6B8F20A7F;
 Wed, 12 Jul 2017 20:21:29 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 12 Jul 2017 20:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=HE5/7bKU1HCy+PNSpd72vJurQDaBvNZG3CEN64JWc
 84=; b=XAcfWzhBmLAi80D0a8BNkT2E4cQpIjEGK+zxVJ9LCq0hm3nhPfR2VGU+1
 LBIZAxQvzmVv8G5YA0WbBEuWsOwR/a3NxoBJ7JjvA8d2UlgRi4gG+MKWVtrWRPGO
 puyQKeQGCduQjcfI7FwpzMmJP5yG1EBXLJapyy+nq0Bp5psOt8Gl8fHVRy6hYdJ4
 zcuycT/8ZXEQOzsxhE1NC2+/dunhCHTg25tr2xA3PHmGOjl8+CmSxREKSvUy/pag
 J0RcsPft3YpMBctd6ljH9umUSUxJpuOM5xfpt+nmh/uR8xGEtsGAbc86cnYI2gAg
 PomiYaQKEuq3Ou4uG9xKZGwDD/fYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=HE5/7bKU1HCy+PNSpd
 72vJurQDaBvNZG3CEN64JWc84=; b=q+qsoSs2N3kNsze/Z/uR1u3iixjrcut5Vd
 31vsELyoWK7/fMnyINiWh1UDC5drU+TaZE1/9oJtpri1jI23Qb7OakxUVcQeFI0o
 F+Hyu7a4LPFUx8XVqOTJgT3CGKNM28PsK5E0e0P9MHPFJnEIM2694sD08WIKGMwr
 uTnkfiImKruuDakoXrwpaqZUDRLIGGQQBmxBM+anGk3iWrqC8SKPy5f6eUa2En4u
 7RB8kS5HLdWEyC1LIfQZeA9HViLTq+t5786c+tGnT96bB/kIUKIPlwflz5HL1zcj
 qdJ0U9nL9cAVs6i9TGWVCBkbBvngpCAUgxf/cmK6dUiFivCWRPrw==
X-ME-Sender: <xms:Cb1mWfESPqWqvL95oArJCYwEWj784qkg8LYQLWVjrWeaVJM49cB-GQ>
X-Sasl-enc: vvtr9Z1BnypKlDdaErjbQnsispeaIm4KPEubrO3WAElx 1499905288
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7DE97E057;
 Wed, 12 Jul 2017 20:21:27 -0400 (EDT)
Message-ID: <1499905281.4935.13.camel@aj.id.au>
Subject: Re: Linux Kernel PMBus drivers
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Date: Thu, 13 Jul 2017 09:51:21 +0930
In-Reply-To: <CAPLgG=k=Tvtp3JuC601eiS6jHPF=F_Ye5e=z9BC1h1OyzAR1xQ@mail.gmail.com>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
 <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
 <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
 <CAPLgG=k=Tvtp3JuC601eiS6jHPF=F_Ye5e=z9BC1h1OyzAR1xQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-AUKpkmeDNRU++Jnbr1q+"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 13 Jul 2017 00:21:34 -0000


--=-AUKpkmeDNRU++Jnbr1q+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-07-12 at 14:46 -0700, Rick Altherr wrote:
> Look in the MAINTAINERS file for the longest file path match.=C2=A0 They
> specify mailing list, git repo, and maintainer emails.

Well, less manually, you can use ./scripts/get_maintainer.pl in the
Linux source tree:

3 09:45:11 andrew@keelia:~/src/linux/aspeed$ ls -1 patches/pmbus-max31785-r=
fc-v1/
0000-cover-letter.patch
0001-hwmon-pmbus-Disable-build-of-non-max31785-drivers.patch
0002-pmbus-Add-fan-configuration-support.patch
0003-pmbus-Allow-dynamic-fan-coefficient-values.patch
0004-pmbus-Add-MAX31785-driver.patch
3 09:45:24 andrew@keelia:~/src/linux/aspeed$ ./scripts/get_maintainer.pl pa=
tches/pmbus-max31785-rfc-v1/000[1-4]*
Guenter Roeck <linux@roeck-us.net> (maintainer:PMBUS HARDWARE MONITORING DR=
IVERS)
Jean Delvare <jdelvare@suse.com> (maintainer:HARDWARE MONITORING)
linux-kernel@vger.kernel.org (open list)
linux-hwmon@vger.kernel.org (open list:PMBUS HARDWARE MONITORING DRIVERS)

With a few options you can trim it down a bit:

3 09:47:03 andrew@keelia:~/src/linux/aspeed$ ./scripts/get_maintainer.pl --=
no-roles --no-rolestats --no-n patches/pmbus-max31785-rfc-v1/000[1-4]*
linux@roeck-us.net
jdelvare@suse.com
linux-kernel@vger.kernel.org
linux-hwmon@vger.kernel.org


> On Wed, Jul 12, 2017 at 2:17 PM, Maxim Sloyko <maxims@google.com>
> wrote:
> > Hi Brad,
> >=20
> > Thanks for the info. Do you know which kernel subtree should I be
> > basing my patches on?

If they're new drivers I'd just base them on the latest stable release
- for the patches above I'm working against v4.12 at the moment.
However, Guenter's tree (maintainer) lives here:

3 09:47:37 andrew@keelia:~/src/linux/aspeed$ git remote -v show | grep roec=
k
hwmon   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git (fetch)
hwmon   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git (push)

Hope that helps.

Andrew

> >=20
> > On Wed, Jul 12, 2017 at 1:56 PM, Brad Bishop <bradleyb@fuzziesquirr
> > el.com> wrote:
> > > > On Jul 12, 2017, at 1:32 PM, Maxim Sloyko <maxims@google.com>
> > > wrote:
> > > >
> > > > Hi Joel,
> > > >
> > > > I have a couple of small PMBus HWMon Linux Kernel drivers for
> > > Zaius (Infineon and Intersil parts). Do you know which
> > > subtree/mailing list I should send these to or how can I figure
> > > this out?
> > > >
> > >=20
> > > linux-hwmon@vger.kernel.org
> > >=20
> > > > Thanks.
> > > >
> > > > --
> > > > Maxim Sloyko
> > >=20
> >=20
> >=20
> >=20
> > --=C2=A0
> > Maxim Sloyko
> >=20
>=20
>=20
--=-AUKpkmeDNRU++Jnbr1q+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZZr0BAAoJEJ0dnzgO5LT52HUP/AmlykSnO/TsdNE/F8vsWCDt
sdwrJnyPo4HsfvgFycZGS/WiJXsHct+Z+CD7InDc01giZK3P+MysAvHJLs9euqTl
avYCL4pRy3Him1iaQfF9HQlZEma2CS2256WDFvYsb1xdnzxlSnYuMb22eDuH9ysH
ZpS2dHTLZeU/F+28GmxMX1Qo0RuA+LkRDe1VnBEPyS1ezj9eckmHoSYC1ZKeXIZa
DkZukb0LyPAGkbSG21f9DBNCMd0FgRmD8TLwbU4e6IrqbFtBwLsUSesHXuCCEc9+
loitatw/970yM7gbqogncAGiKGvQ/gMZF3zGWeKkwnA/i84OuUS7fO90Zho7NgzS
unWILj5/nUJuy9AXuXsqJ6IGoNoe1EMGSmcKaoGlLxDJFT8l/TfYSBiMr4SCvAnK
Dkn1bAAsCKVBsnIOgVMepcoN7rxrig6zK3DPN+TiywTvhD71Z7J6k6LGGzYr1HOP
ppwqvavXCe8rpqOe5JhA97Wyo1Z0TtjghTedWwt8NV/kgmXpW/wb3qJGd53axJbq
N3iEiVlGZu8YT/u93qRyfCSFiCrvfsjvacaAzyzmToUWmg0BgClD8nengQ8+k9R1
S4l8uYavk/kK4UeQTPUJfQSHxeFDmbpqZKo9Qz7DyftVz/6a4zQZyuOxdocUFuXz
756A0EwdL7tVC18JHH0f
=18Fk
-----END PGP SIGNATURE-----

--=-AUKpkmeDNRU++Jnbr1q+--
