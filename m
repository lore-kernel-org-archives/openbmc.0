Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6Csk0vnFzDqRF
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 12:10:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Does anyone tftpboot the userspace image?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
Date: Sun, 22 Jan 2017 20:10:10 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <64A10099-953A-42D4-ACD7-7F355C737D25@fuzziesquirrel.com>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Mon, 23 Jan 2017 01:10:18 -0000

Hi Xo

Honestly this is my _only_ use case=E2=80=A6 I don=E2=80=99t ever flash =
machines unless
whatever I am testing specifically requires that, which for me anyway,
is very infrequent.

There doesn=E2=80=99t necessarily have to be an all or nothing approach =
taken here.

cpio.lzma.u-boot can be removed from IMAGE_FSTYPES in several places:

-in your local.conf
-in zaius.conf in the zaius layer
-in a yet to be created ingrasys.conf in the ingrasys layer
-probably other ways too

Alternatively, we can turn it off by default and add it where it is =
desired - possibly
-in my local.conf
-in in ibm.conf

I guess what I am not sure of is which makes more sense to be the =
default?
When these kinds of questions come up I tend to think in terms of what =
would
benefit new users of the project the most?  I honestly don=E2=80=99t =
know - what does
everyone else think?

-brad


> On Jan 20, 2017, at 8:59 PM, Xo Wang <xow@google.com> wrote:
>=20
> Hi folks,
>=20
> I noticed from this discussion
> https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
> that kernel developers were tftpbooting the userspace image from a
> obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
>=20
> 1. How does/did that work? I guess you needed a custom init in the
> initrd to load the u-boot container (?) instead of from mtd?
>=20
> 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
> kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
> mkimage' every build, and it can't be parallelized.
>=20
> I ask because I mailed a change to remove those image products from
> the build, then followed the 'blame' to this use case:
> https://gerrit.openbmc-project.xyz/#/c/1957/
>=20
> cheers
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
