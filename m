Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhKF90Z4JzDqR9;
 Tue, 29 Aug 2017 16:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jAMoCs1E"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kxGzu92r"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BB3CE20E15;
 Tue, 29 Aug 2017 02:56:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 02:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/GvQ3kLLuzHCW/5WdWDKUk9vOoaKpcCkT63tqRpIB
 ic=; b=jAMoCs1E07wXyvMa9do7O8YkqtZ70fu5ivvtz355CenuXqi/yOZluwtA9
 36q7RL30reZxVwgdKKZY2EfL+T4HMKaeAzLg7l7B1zrW4I1UCc9Hb/jrYZHCi9zq
 H5Up3WuFv7eOmsrVe7BGOar6iENsaqBvsjW73aC127JTWmLhlADmBor03+aExenl
 BoluuYe+7dv5zILJhOvqpp17FLLT1I4Fz1iZ5shyXbInu/DcpZJnBc1z/wZ/V9r0
 I+1lI2wHVTsaWTDLB6PNpgumxq3/V9xKY8Kplv+EIPXKO5wMV3TVSTjLL8qyoqKG
 QzNbpdVR484RCIVjLNp207QpnlcCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/GvQ3kLLuzHCW/5WdW
 DKUk9vOoaKpcCkT63tqRpIBic=; b=kxGzu92rMAdCbgOROb2hKRHi4hOOrOoQZV
 kyLwksK7g7H13XskRsR+f+4KpwGdkXe2y37vNGtsU1gmmgt5wrClQ8JvIHZmZjvZ
 QQyZZQKxBKPHx9/729g+skADoYs82+6XgztiZdo3ck6LYeCUvbhRvtFMG376E1Aq
 zJdQVUgpK1NPlczbTbGP7vbwwZfrzSeWLu9SOavCBZLU4Uz1sVvSLxE6nCIk56cK
 9RLo+jiYkZcYrVm6RXYTgo+qeoTB6vPb0Fgn6cM4K7pBJYKGfFV/ZBSGpXvQ4aQR
 ay6jtUmsvXE1vvmMGjKrhnow2C4RGxGR6UJSOhC+YMEK/z4eP+qQ==
X-ME-Sender: <xms:OhClWWXDs981kGDxdLwUzMuSZP1pWKvCLhoTI_C35LZJcCtQQp9pLg>
X-Sasl-enc: ZJKIqS1Mqwvo6ZpeqC3NIBRM5NrjKqiyo1u4S/qUzVlm 1503989817
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F5572418B;
 Tue, 29 Aug 2017 02:56:54 -0400 (EDT)
Message-ID: <1503989809.5933.5.camel@aj.id.au>
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
From: Andrew Jeffery <andrew@aj.id.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, brendanhiggins@google.com, 
 benh@kernel.crashing.org, joel@jms.id.au, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 ryan_chen@aspeedtech.com
Date: Tue, 29 Aug 2017 16:26:49 +0930
In-Reply-To: <20170828160702.x45hagij4kkm5zzc@ninjato>
References: <20170815072102.23067-1-andrew@aj.id.au>
 <20170828160702.x45hagij4kkm5zzc@ninjato>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5SFIj/aZuTWk4Ss2sI3E"
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
X-List-Received-Date: Tue, 29 Aug 2017 06:57:03 -0000


--=-5SFIj/aZuTWk4Ss2sI3E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-28 at 18:07 +0200, Wolfram Sang wrote:
> On Tue, Aug 15, 2017 at 04:51:02PM +0930, Andrew Jeffery wrote:
> > In addition to the base, low and high clock configuration, the AC timin=
g
> > register #1 on the AST2400 houses fields controlling:
> >=20
> > 1. tBUF: Minimum delay between Stop and Start conditions
> > 2. tHDSTA: Hold time for the Start condition
> > 3. tACST: Setup time for Start and Stop conditions, and hold time for t=
he
> > =C2=A0=C2=A0=C2=A0Repeated Start condition
> >=20
> > These values are defined in hardware on the AST2500 and therefore don't
> > need to be set.
> >=20
> > aspeed_i2c_init_clk() was performing a direct write of the generated
> > clock values rather than a read/mask/modify/update sequence to retain
> > tBUF, tHDSTA and tACST, and therefore cleared the tBUF, tHDSTA and tACS=
T
> > fields on the AST2400. This resulted in a delay/setup/hold time of 1
> > base clock, which in some configurations is not enough for some devices
> > (e.g. the MAX31785 fan controller, with an APB of 48MHz and a desired
> > bus speed of 100kHz).
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Applied to for-next, thanks!=20

Thanks!

> I even considered for-current but it does
> not apply there. So, I leave the backporting for the interested parties
> :)
>=20

It depends on Brendan's clock divisor calculation fix, which appears to
be in for-next but not for-current:

    87b59ff8d1d9 i2c: aspeed: add proper support fo 24xx clock params

I'd argue that Brendan's patch should go in for-current as well,
because it fixes a divisor rounding error for the ast2500 (bus is
clocked faster than requested).

Cheers,

Andrew
--=-5SFIj/aZuTWk4Ss2sI3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpRAxAAoJEJ0dnzgO5LT5aeMP/1rp0owg8dov/DKlzF+JUiL2
UCsX8o0X+nnZhuoBFTx03yf4ghvxrzgQnH/gtCOTWhcJOV2Pf4S+aosaz99e0UvY
oy5MdNGXgerzNRbTbtfPCe7yzixEkFCHwcjeOF48jICq0pknA+JxQyotZnGvY6Eo
5RghPA0LZoqrgPw18DzFR0zuqcup17NjSdajFd0bM855FJZV93HlaTkN3Du+o2h2
d+6HqSm9ZWPZf47qwiOb2Mh5zxSXR7QhMfxQ1sBq659M0Aohh0Gq7dGT+hzdImJ2
5nlVAG8iUNZrzhiyszri+VFWz/L3SKhUMRKOSnIGEluGv7EfQWLXuFYB31WE1HqU
fJetN9uFjyfpp+GWwH7SAKcvdvio+sswxrgcki6o1p0EKk8NW8uV2coqY7CVMDIj
2hI0TJbWvjqAB9oYj41TOR5TTrUeVQJqtZeRaFkUKDYNSa8WnjD6BtZWiueVKVg+
t/bR/DKhvBxrHyqVg8zycD/MaFKowxn/N+PBz7hmpol6mD0g1byfsOReqvnRxU5v
JZA/TnmSw2R6y+hrgB2WehYuVbFLfe/7XLy39BwroDtcZ305VI0bGjspsCKoDK7m
LsFUhYRE+eZthZwFE5KDTxdS4VJd63pV2XkmP2jdOmlaw2eg3WBD8c2242yRbMW1
n08P6xrFanr2dgsHsLyG
=dYzu
-----END PGP SIGNATURE-----

--=-5SFIj/aZuTWk4Ss2sI3E--
