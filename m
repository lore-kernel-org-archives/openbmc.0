Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPfLB16c1zDqBs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:54:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jxqOHZ2b"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f5eV3eHw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E48302081C;
 Thu, 16 Feb 2017 22:54:55 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 16 Feb 2017 22:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=n9yk4aGNQExu4Isok9UpmxE5lJI=; b=jxqOHZ
 2btxNXYunct+lnGT2P/v8pEgMzUTv/+KQbIGQiRA9z7eKyo4zb7e1L/Ha00c2B0m
 Bn/cFDpEN/HyiMCBkrqowFR8AgL5C0UN2/1nk5s5Isf+W6xVbIbcR8qqD47KvD9r
 VJ1SrjKkjJ3joXaxXBxgwBQarNzquQylGrsqg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=n9yk4aGNQExu4I
 sok9UpmxE5lJI=; b=f5eV3eHweCXfvVrYA7aLTeSN6AoCRQNS9UqNMsN6ToOHaf
 MDh27XDjhJJlllZscWsIdygxrBU/TFbKL+WqVOy+6lhO7TFLBJSO/5JI9q99sfob
 asthhtFl6a/EpUV5umiyRdxOmcGdcikuHJKvJTxW4zIA2mIfLp5/4Fl5/TpPE=
X-ME-Sender: <xms:D3SmWGiDthugqr8j-BJiOAaFItd196v9ZRP377hbCuNIUWwRl40rFQ>
X-Sasl-enc: IX2GMX8ML9ExBC7mCRIXpij7xPblr1gvupFpSdKxkuR7 1487303695
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD0E77E0D2;
 Thu, 16 Feb 2017 22:54:53 -0500 (EST)
Message-ID: <1487303690.3661.42.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr
 <raltherr@google.com>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 17 Feb 2017 14:24:50 +1030
In-Reply-To: <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
 <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
 <1487302684.3661.40.camel@aj.id.au>
 <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+jysD0A94EEnX+e9Qh++"
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
X-List-Received-Date: Fri, 17 Feb 2017 03:54:58 -0000


--=-+jysD0A94EEnX+e9Qh++
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-17 at 14:11 +1030, Joel Stanley wrote:
> > On Fri, Feb 17, 2017 at 2:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Fri, 2017-02-17 at 14:02 +1030, Joel Stanley wrote:
> > > > > > On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.=
au>
> > > wrote:
> > > > Required for pinmux, which tests some bits in the LHC's IO space.
> > > >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >=20
> > > Large Hadron Collider!
> > >=20
> > > Does the ast2400 want to know about it's particle accelerator too?
> >=20
> > Nah, the ast2400 doesn't require a particle accelerator for pinctrl,
> > and I don't think we have any other reason to need it (yet).
>=20
> I think we need it for mbox, assuming we end up enabling ast2400
> platforms with that functionality.

The registers used by mboxd are the "Host Interface Control" registers
(HICRx), which are different to the "LPC Host Control" registers
(LHCRx) used by pinmux.

Andrew
--=-+jysD0A94EEnX+e9Qh++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpnQKAAoJEJ0dnzgO5LT5yM8P/1k0MSUuFy9QhOpXe9RNwmWz
B0xxQHeYSxag9RaeDe2NJf/VF+2/1mhDT6jyUfp5FDOBQGzmQGFdy/Y4mR3K9Yy+
5ECdMYnpebpAd6oLdeIMRDIAbZzC6x2ahSVhQgtKXuvploh4Wnv19K2Dwg0Exkfm
OPncru6+Y+z+YGOBmr/3LALDwPRiyUn45iWCYy+BSA72YEKXOTRe+2CRS8vB78mF
zfszi3QRcjMM8aq0xYZqt+gXqjgsyWbVWAoGePQCrnCvJYY0Gjm7clgA4+1RCQR6
B8VEL/6RywLWYHqOMEPG+Cob6/5pk0Na86mmx5tMvWgJDGAHp04igyOOZXSwmHVF
dhg66UdEWfOdfX3eqXiqxHl0Z7PUPIfYY3LktDi3U/88Ke5lQxFYILKs7s1zIPZO
qjDONoU7gSIDRfBQ6TuBMljqQJ7VBN6rAGqgy+QISaUIw8VALEBA0jQn4vIJJYn0
bKwsfimwbbfCLerL3KzVGTBPpM+Kv+XUAlB9i5iwHwnwsAOBXJ2Orxumlam4OLp7
qNxIjhlU7+rmpfeYJm/ggGayclGFCmK5MnFDDttwWSNEvGOxPh85FuLSdOphHZ39
q+75I7yRzhKKQMX23lVE6vYf9etD35juYnuqCLpLKT2P94/asKhbHUHy0sZUS3ez
Aoe8JD/z1pf6jaRtuX4U
=Dvl6
-----END PGP SIGNATURE-----

--=-+jysD0A94EEnX+e9Qh++--
