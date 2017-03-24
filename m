Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqfWn6S0gzDq7d
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 10:19:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DxbRVKnU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H/1QSANt"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BB0620DBF;
 Fri, 24 Mar 2017 19:19:30 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 24 Mar 2017 19:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=tsU2gZFwtby8k9WXKetzCjBLCC/tWtt0taurNiyjr
 5g=; b=DxbRVKnUkbeKPlXi9hjCdHKDAd3wl0122OYRX5rBQeCCcPpx34TA/B8Vq
 Z5TbZwACbB+0cEXh37CUhJFnZb/Yc0ftUZ3kWJIhVtj+iRKiWIoMqBeWRb9n38tp
 +58MBDvwG3VrUj6Re50+hoa4d5lyf1p853wX2EFaOqKq5ZpssWvi6cdqRCyY+DJ4
 bs8BMsGvYMretnilCp8hkmmyNxCqeZSGsZVX5dUM1XRQLDKgKtVyijSF+9c+X301
 IH14D6PURWXFTCMDgB9f3A2ZSdHXzeAePitzgQ0Hm+HHWF1vJimclsH5lwMiZcX4
 hXxL3g04TGGlNuiC11Ok6L01ORABA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=tsU2gZFwtby8k9WXKe
 tzCjBLCC/tWtt0taurNiyjr5g=; b=H/1QSANtzA3lGMCFckp0ZZU+KvqqEd5jk9
 SwBo3dhj/7wF0yxmsoCeUg96ZO6gFJe+ontNvJb9JDJcAqfffu7f11ugJABeAWDC
 ouFc96n82MkV1NaCvGC4xn2qF9Cv5vOwMvtfrlmWM1ebd1wp41VV3lLoCBl0Xh4M
 0pbrQoXsVOdXFKLpX4KQX4ACc3I6p05OQfGNgXUnxAnLUpCFYc7YelLAE7AMoojg
 M+mzZPEcIKRHFhLnYWbhgUUPYdUB2tNSGYXovFSnADLDb6LxkBRc2t2YB4KXK5cj
 CEePZcZuX3ZN0iwEr5RWxTn5hBe63rG8omirUSPgg4+lyt41hWpA==
X-ME-Sender: <xms:ganVWPcvbASvDX3EEROBQtkHX6bAyGCyiHLEFR6zMxwWvppFzoBRhA>
X-Sasl-enc: miB9e+2bCPLVJdLxvY5fp5wci/ZGMWuvK+iJSqsmcRaO 1490397569
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D3D02400E;
 Fri, 24 Mar 2017 19:19:27 -0400 (EDT)
Message-ID: <1490397560.3847.10.camel@aj.id.au>
Subject: Re: [PATCH] ARM: aspeed: Disable UCD90160 in the Witherspoon
 devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Sat, 25 Mar 2017 09:49:20 +1030
In-Reply-To: <CAPH-5w7Ac9tw0+Q8XvLspENjPuMczewKOT9dMeGLYs1nB2ZVWw@mail.gmail.com>
References: <20170324011322.31837-1-andrew@aj.id.au>
 <1490321135.3847.6.camel@aj.id.au>
 <CAPH-5w7Ac9tw0+Q8XvLspENjPuMczewKOT9dMeGLYs1nB2ZVWw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hLASLsXMXCM0ZuVTAi9x"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Fri, 24 Mar 2017 23:19:36 -0000


--=-hLASLsXMXCM0ZuVTAi9x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-03-24 at 13:55 -0700, Xo Wang wrote:
> > On Thu, Mar 23, 2017 at 7:05 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > Xo: Adding you in case you've seen any issues with Zaius that may
> > benefit from a similar work-around in the short term.
> >=20
>=20
> Thanks for the copy. I haven't seen the unsupported command errors
> from the UCD90160 on Zaius.=20

Right - to clarify a bit here: The PMBus core does check the status
bytes, but only on certain operations. I hacked i2c-core's smbus
emulation to query the status byte(s) after every operation[1], and the
excerpts in the commit message were observed as a results. Further, not
all operations generate errors, only some.

[1] https://github.com/amboar/linux/commit/d0ff1707c094168641ab4f687b00c6fc=
4d772bda

> I suspect it's because we perform less
> i2c-get/-set on our UCD, since it is already programmed to treat the
> UCD rails' control pins as output GPIOs.

Possibly, though some testing indicates that leaving the kernel driver
unbound and only doing i2c{g,s}et operations doesn't appear to lead to
problems booting (pgood timeout, due to corrupt UCD configuration[2]).

[2] https://github.com/openbmc/openbmc/issues/832

>=20
> Do those errors you see always come after a UCD9000 driver bind operation=
?

Well, due to the fact that it gets bound, yes. But they're not
necessarily related.

Andrew

>=20
> > The associated userspace changes for Witherspoon are here:
> >=20
> > https://gerrit.openbmc-project.xyz/#/q/topic:unbound-ucd+status:open
> >=20
> > Andrew
> >=20
> > On Fri, 2017-03-24 at 11:43 +1030, Andrew Jeffery wrote:
> > > This is a work-around for [1]. Binding the UCD9000 driver to the devi=
ce (and
> > > possibly the sequence of unbinding, poking the UCD90160 via i2cset, t=
hen
> > > re-binding the UCD9000 driver) appears to have some negative effects.
> > > Instrumenting the transactions with reads of the PMBus status tree le=
ad to
> > > the following observations under "normal" operation.
> > >=20
> > > [1] https://github.com/openbmc/openbmc/issues/832
> > >=20
> > > UCD9000/PMBus core sending unsupported commands:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: Unknown error
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: CML status: 0x80
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50=
 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returni=
ng error -5
> > >=20
> > > Reading the status bytes off the UCD90160 gives -EBADMSG:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:21=
 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_BYTE: -74
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0...
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_CML: -74
> > >=20
> > > "Other comms fault" errors:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Unknown error
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: CML status: 0x82
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Other comms fault
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56=
 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57=
 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57=
 witherspoon kernel: i2c i2c-11: Unknown error
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57=
 witherspoon kernel: i2c i2c-11: CML status: 0x2
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57=
 witherspoon kernel: i2c i2c-11: Other comms fault
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57=
 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: Unknown error
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: CML status: 0x80
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59=
 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returni=
ng error -5
> > >=20
> > > Reduce our problems by communicating with the UCD90160 as little as p=
ossible.
> > > With the associated userspace change, the only communication will be =
applying
> > > the VCS work-around.
> > >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >=20
> > > ---
> > > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/=
arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > index 4d26d4702a34..69d5897dbfde 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > @@ -253,6 +253,7 @@
> > > > =C2=A0=C2=A0=C2=A0=C2=A0};
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0ucd90160@64 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
status =3D "disabled";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0compatible =3D "ti,ucd90160";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0reg =3D <0x64>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0};
>=20
> cheers
> xo
--=-hLASLsXMXCM0ZuVTAi9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY1al4AAoJEJ0dnzgO5LT5+TIP/0MqQmtV8curOx/9xxKTkXim
/eYz7LXnXTpu5viem6qpaZv4W0qkZkxRnhMAsa9qCfSBgqf51PVtHEZu5/gtNJky
Vsq+QL7corU9UJ9iF5n8NdM+ZUsqtoy4R8lCbR7k6WXzgASBRiHO+pjuKHm3R23v
I00RfK+ntdkJ+Np+MaiD7bxnND1tBPvbyVhJXXtaZY1EYUbsChqns0PfYScneml2
euE/QihBAdL5kXDBTEyD/s/SvNtwhvTrvH4bhGDs+isMMD04jMQNcUUDKY/16ON6
Qz2TuzT/KUpbvpuijh/xeoGdv5O931jySAOeUD/M1cwLm04uRTTTxUp5v4/x4i5x
f9pOqWdlPfUgDOt1lL5W4EsyoRHaGU3Vj2zehK5TUAeO+QqYAXA/KZtRLwPR0vui
Jgsm3jkCo/69UuIFCkM2T+oxjykqFhdOgY1pXVu5kt6YSo7HSNG5iujdlF3e2M6y
61uTic2aVXUd0M5xezE0hKIq3EdZtNtu3p3kMLIp7AVBV73ZrUPYPD5Zh9kfbzFI
gETcGGJ4jOrBgaHjW1Mp1T2qSXGab146BdUzUJPFQNm4+FHDho5qbrZ8ZwEeHqW4
xKVDg1CiKTXAYru0oZ8DZJ9iTq1RTXC66sUCl6DkNIKxltYUf6ODpgWvF+LhS39s
ik5UY6naAiYjVQtZXf81
=9jao
-----END PGP SIGNATURE-----

--=-hLASLsXMXCM0ZuVTAi9x--
