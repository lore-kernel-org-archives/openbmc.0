Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I8VAchs2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ENODpqBU"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJS7L2QlyzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 00:58:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F34E211CE;
 Fri, 20 Oct 2017 09:58:19 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 09:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GPxLufPmC4aUiH1JQrqWsazpy+K71C6aBpz9ByE1xVs=; b=I8VAchs2
 vIOOYFKdyRUIom/WanWLaaJLGxik8fdwy3RV/Zdc9kJrm8a+j59YKdkrD10/dNL1
 1Ho0Y+egz0cYGXSwhemf3UYk94hiKORM7JKfQAo2mev0rYRk3QPHeoKWTKbGFwCl
 uzse8xtm/sBBQSN2t1fkc1RfNNf1DWs9fi7N2sdfzuCTuFhmQdTOgQC7lxOXZ1Nd
 vnMfDCZU9Z/fEvNifBSmwIuomjnMoK0XgUilptp2EtRylsgnJ+/LVkKVagwqGoZX
 ce1wjAfItAeZ7Rtrff6oJv1cXaNd3Ns5bkHd3k6gn5qusmkmsGTprH3p+bYx0Z30
 YMhSgswYVhvL3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=GPxLufPmC4aUiH1JQrqWsazpy+K71
 C6aBpz9ByE1xVs=; b=ENODpqBUxBtwOhPyCtf+atVvEH168bIz3Wh8lpzBLVUvZ
 B9606WMgLkZ4MdXAEx7SiEWhtCQdIDBcQQlh+ROFnn3YxzlJxJHfFeptpuSdzPyp
 qPAu/0CpiKlkamI2QIoNQnnGyZrP9Cby+crYoOSGOqXBsER+SN4htZrVwS/V6AED
 rxo9MM4BKNvMAOuCqs8X7KwPDm+qNTO8ZLy2N2aGiDVT9i3b19RIxm8oLlUEkQjt
 O8gCyqh/R67RWIhiKZJQkzy4+OO0g0yQVqz7Mi53z/7sVDPJcmEDGT2L2yYxrSa8
 Py6fVI0uvAGyRiJkSNR/Zz15Vj65nad3tja8TXTbw==
X-ME-Sender: <xms:-wDqWZCiMV8EPNAYnIJ-GyL6mo7FMY6MRlO1ARcTFOcEw01EM31YLQ>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1FF6248ED;
 Fri, 20 Oct 2017 09:58:17 -0400 (EDT)
Message-ID: <1508507891.24322.55.camel@aj.id.au>
Subject: Re: [PATCH u-boot] Revert "ast-g5: deactivate vbar (for qemu)"
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Sat, 21 Oct 2017 00:28:11 +1030
In-Reply-To: <20171010122749.9124-1-clg@kaod.org>
References: <20171010122749.9124-1-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fzxWfqe01hDS2zrElHjD"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 20 Oct 2017 13:58:25 -0000


--=-fzxWfqe01hDS2zrElHjD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 14:27 +0200, C=C3=A9dric Le Goater wrote:
> This reverts commit a0ca4ecbeae4ae9632ebc67bf5318dd2ea09c94f.
>=20
> Support was added to QEMU in :
>=20
> commit 91db4642f868 ("target-arm: Add VBAR support to ARM1176 CPUs")
>=20
> The work around happens to crash the guest when the vector relocation
> is done, with ignore_memory_transaction_failures=3Dfalse which is
> now the default in QEMU.

Applied to v2016.07-aspeed-openbmc with the Signed-off-by.

Cheers,

Andrew

> ---
> =C2=A0arch/arm/lib/relocate.S | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/lib/relocate.S b/arch/arm/lib/relocate.S
> index 33bcff41ac30..475d503dd9df 100644
> --- a/arch/arm/lib/relocate.S
> +++ b/arch/arm/lib/relocate.S
> @@ -35,7 +35,7 @@ ENTRY(relocate_vectors)
> > > =C2=A0	ldr	r1, =3DV7M_SCB_BASE
> > > =C2=A0	str	r0, [r1, V7M_SCB_VTOR]
> =C2=A0#else
> -#if defined(CONFIG_HAS_VBAR) && !defined(CONFIG_ARCH_AST2500)
> +#ifdef CONFIG_HAS_VBAR
> > =C2=A0	/*
> > =C2=A0	=C2=A0* If the ARM processor has the security extensions,
> > =C2=A0	=C2=A0* use VBAR to relocate the exception vectors.
--=-fzxWfqe01hDS2zrElHjD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6gDzAAoJEJ0dnzgO5LT5HykP/ReSGJcHVu7R2RVmAFsHlmOp
d0a8NtpaJsJdad1/ddhbAXrjfMMAWqpSxEIT8EisyezunNNqt/y5jmRPA7CwkxOE
m41EDmA0gPCQeysoQT+eaMCPkOvKg4AEo9QwqqoD/RIamp8KQq3y0dWFIcwC4wF1
3LY0CuMwgZdG+jDffgmFEaeayFp3sIrXdJqEfy70da/EFu+VQ0kedLugGhOMr810
doT41hBIia2qc8j21fblU0GodMXSw4iwWpNgHLQf8GGYKHCLFc8WQY8UIJNTF4Je
mNOBCnW/3/yoWlTZusmZAPBPXhDF39JeuM78WHX1CPegAgrMC4WauYJcGxHkDO1s
JskYyxGs+PxFk2cBQfQeNcCsIbhEOrDQdSRqy3+CrdQ5kLFFQ8Ze7a2N/Nz/BSny
GxYok+jQeo9kAsa+UvdjPrLbDXVjjV/qSvrGJBKAGZXLPke3oal9Xn30N/7M3bZZ
/siGusqKm4DXjoSwHraV3mSSlDl+SavZjZEFmPcz9c+7o3rZRAnJZVxZO+UX5HnB
o9mwKrAKCxXldupZ4HRycuK5Ep694LyqpmTRzlPtoTBoOYytzdCnuixfSapfKiPE
Bj7X5Jg43+nOzGt/nivr3zW50XZ6o7muS+3rYWQq9p0i4Gr88W+9Od8dUB9gpJVc
Po6HxweFiftxg0rqM0OG
=sf41
-----END PGP SIGNATURE-----

--=-fzxWfqe01hDS2zrElHjD--
